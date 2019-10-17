#!/bin/bash
set -e

# Compile testbench into top_tb
iverilog -Wall -o top_tb top.v  top_tb.v
# Run top_tb
vvp -n top_tb
# Start gtkwave
gtkwave top_tb.vcd top_tb.gtkw
