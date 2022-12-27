#!/usr/bin/env bash

get_interface_name() {
	name="$(docker network inspect "$1" | grep 'docker.network.bridge.name' | sed 's/.*://'|tr -d '[ ",]')"
	if [ -z "$name" ]; then
		name="br-$1"
	fi
	printf "%s" "$name"
}

get_bridge_list() {
	docker network ls -f driver=bridge | tail -n +2 | cut -d' ' -f1
}

check_ipv4() {
	test ! -z "$(ip -4 addr show "$1")"
	return $?
}

get_preferred_addr() {
	docker network inspect -f '{{.IPAM.Config}}' "$1" | sed 's/^[^0-9]*\([0-9]*\.[0-9]*\.[0-9]*\)\.0.*$/\1.1/'
}

is_network_internal() {
	docker network inspect "$1" | grep -i Internal | grep -q true
	return $?
}

main() {
	for nid in $(get_bridge_list); do
		echo "Processing $nid"
		if is_network_internal "$nid"; then
			echo "Internal, skipping"
			continue
		fi

		ifn="$(get_interface_name "$nid")"
		echo "Interface is $ifn"

		if check_ipv4 "$ifn"; then
			echo "Has ipv4 already, skipping"
			continue
		fi

		addr="$(get_preferred_addr "$nid")"
		echo "Addr: $addr"

		ip addr add "$addr" dev "$ifn"
		echo "Added addr!"
	done
}

main