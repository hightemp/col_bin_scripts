scp proxy_fornex:/etc/openvpn/easy-rsa/pki/private/${1}.key ./certs
scp proxy_fornex:/etc/openvpn/easy-rsa/pki/issued/${1}.crt ./certs
scp proxy_fornex:/etc/openvpn/easy-rsa/pki/reqs/${1}.req ./certs
scp proxy_fornex:/etc/openvpn/certs/ta.key ./certs
scp proxy_fornex:/etc/openvpn/certs/ca.crt ./certs
