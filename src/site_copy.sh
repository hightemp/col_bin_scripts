#!/bin/bash

# wget -mkEpnp

wget \
	--mirror \
	--convert-links \
	--adjust-extension \
	--page-requisites \
	--no-parent \
	$1
