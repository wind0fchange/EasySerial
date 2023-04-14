#!/bin/bash

# Set serial port parameters
BAUD_RATE=9600
DATA_BITS=8
STOP_BITS=1
PARITY=none
FLOW_CONTROL=none

# Find available serial ports
AVAILABLE_PORTS=$(ls /dev/tty.usbserial-*)

# Choose the first available port
PORT=$(echo "$AVAILABLE_PORTS" | head -n 1)

if [ -z "$PORT" ]; then
  echo "No serial port found. Please connect a device and try again."
  exit 1
else
  echo "Using serial port: $PORT"
  # Launch console with selected port
  screen "$PORT" "$BAUD_RATE","$DATA_BITS"$PARITY"$STOP_BITS" "$FLOW_CONTROL"
fi
