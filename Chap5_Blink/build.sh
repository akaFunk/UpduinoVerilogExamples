#!/bin/bash
set -e
yosys -q -p "synth_ice40 -blif top.blif" top.v
arachne-pnr -d 5k -P sg48 -p upduino.pcf top.blif -o top.txt
icepack top.txt top.bin
icetime -d up5k top.txt
iceprog top.bin
