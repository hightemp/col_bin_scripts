const { execSync } = require("child_process")
const fs = require("fs")

var sC1 = "docker ps | awk '{print $1}'"
var sC2 = "docker inspect --format='{{.Name}};;;{{range $p, $conf := .Config.ExposedPorts}}{{$p}} {{end}}' "

var sIDs = execSync(sC1).toString()
var aIDs = sIDs.split(`\n`);
aIDs.splice(0, 1);
aIDs.pop();
// console.log(aIDs);

var sResult = ``

aIDs.forEach((sID) => {
	var sRow = execSync(sC2+sID).toString();
	var aRow = sRow.split(`;;;`)
	console.log([sRow, aRow]);
	var iPort = aRow[1].replace(/\W+/, '')*1
	sResult += `
      - name: "${aRow[0]}"
        subtitle: ""
        tag: "app"
        url: "http://192.168.31.237:${iPort}/"
        target: "_blank"
	`
})

console.log(sResult);
