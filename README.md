# Pomodoro Timer Script

This script is a simple Pomodoro timer written in Bash. It helps you manage your work and break intervals using the Pomodoro Technique.

## How It Works

The script alternates between work and break intervals:
- **Work Duration:** 25 minutes
- **Break Duration:** 5 minutes

The timer runs in an infinite loop until interrupted by the user.

## Prerequisites

- A Unix-based system with Bash installed (Linux, macOS, etc.)
- Basic knowledge of command-line operations

## Usage

1. **Copy the Script:**
   Copy the following script and save it as `pomodoro.sh`:

    ```bash
    #!/bin/bash

    # Function to convert minutes to seconds
    function convert_to_seconds() {
        echo $(( $1 * 60 ))
    }

    # Set timer durations
    work_duration=$(convert_to_seconds 25)
    break_duration=$(convert_to_seconds 5)

    # Function to handle interruptions (Ctrl+C)
    function handle_interrupt() {
        echo "Interrupt received! Stopping the pomodoro timer."
        exit 0
    }

    # Catch SIGINT signal (Ctrl+C) and call handle_interrupt
    trap 'handle_interrupt' SIGINT

    # Main loop
    while true; do
        echo "🍅 Work for 25 minutes."
        sleep $work_duration
        echo "Take a 5 minute break."
        sleep $break_duration
    done
    ```

2. **Make the Script Executable:**
   Open your terminal, navigate to the directory where `pomodoro.sh` is saved, and make the script executable by running:

    ```sh
    chmod +x pomodoro.sh
    ```

3. **Run the Script:**
   Start the Pomodoro timer by executing the script:

    ```sh
    ./pomodoro.sh
    ```

4. **Interrupting the Timer:**
   To stop the timer, press `Ctrl+C`. This will catch the SIGINT signal and call the `handle_interrupt` function, which stops the script gracefully.

## Customizing Timer Durations

If you want to customize the work and break durations, you can modify the values in the script:

```bash
# Set timer durations (in minutes)
work_duration=$(convert_to_seconds <your_work_duration>)
break_duration=$(convert_to_seconds <your_break_duration>)
```

## Additional Notes

This script uses a simple infinite loop (`while true; do ... done`) to alternate between work and break periods.

The `trap` command is used to handle interruptions and ensure the script exits gracefully when `Ctrl+C` is pressed.

Replace <your_work_duration> and <your_break_duration> with the desired number of minutes.
