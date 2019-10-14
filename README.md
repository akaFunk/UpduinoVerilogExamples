# Upduino Verilog Examples
These are a few examples for the Upduino v2.0 (Lattice ICE40 device)
written in Verilog and designed to be used with icestorm. The examples
are designed to be part of a very small Verlog/FPGA class. Some
additional hardware is required. We used the custom made board at
https://github.com/akaFunk/UpduinoLEDButtonExpander, but a bunch of
buttons and LEDs on a breadboard will do the job.

There are also very simple build scripts in each directory which can be
run to build the whole project and flash it onto the Upduino.

## Chapter 1 - No Logic
This examples just shows how a bare metal Verilog file looks like.
It just inverts a button and routes it to an LED.

## Chapter 2 - Simple Logic
This example shows basic logic in Verilog. It takes two buttons as
inputs and only if both are pressed the LED lights up.

## Chapter 3 - Blink
We introduce the clocked always block and implement a counter. If the
counter reaches a specific value the LED is turned on, while it is
turned off otherwise. This example additionally shows how to initialize
the internal clock source of an ICE40 FPGA.

## Chapter 4 - Statemachine
A simple state machine is introduced as state machines are crutial
components in FPGA/CPLD design. The state machine has four states. In
each states it will light up one of the four LEDs. The states are
ordered in a circle and a jump between two states happens when the
button corresponding to the current light up LED is pressed.

## Chapter 5 - Chaser Light
The state machine from chapter 4 is modified to not jump between the
states by a press of a button, but instead a counter. This turns it into
a chaser light.
