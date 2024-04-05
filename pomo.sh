#!/bin/bash

# Function to convert minutes to seconds
function convert_to_seconds() {
    echo $(($1*60))
}

# Set timer durations
work_duration=$(convert_to_seconds 25) # 25 minutes
break_duration=$(convert_to_seconds 5) # 5 minutes

# Function to handle interruptions
function handle_interrupt() {
    echo "Interrupt received! Stopping the pomodoro timer."
    exit 0
}

# Catch SIGINT signal (Ctrl+C) and call handle_interrupt function
trap 'handle_interrupt' SIGINT

while true; do
    echo "🍅 Work for 25 minutes."
    sleep $work_duration
    echo "Take a 5 minute break."
    sleep $break_duration
done
