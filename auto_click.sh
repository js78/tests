#!/bin/bash

while true
do
	xdotool mousemove_relative --sync 0 50 click 1 sleep 5
	xdotool mousemove_relative --sync 0 -50 click 1 sleep 5
done
