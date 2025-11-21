#!/usr/bin/env python3
import os
import json
import sys

SAVE_FILE = os.path.expanduser("~/.config/waybar/work_hours.txt")
CONFIRM_FILE = os.path.expanduser("~/.config/waybar/work_hours.confirm")


def load_hours():
    if os.path.exists(SAVE_FILE):
        try:
            with open(SAVE_FILE, "r") as f:
                return int(f.read().strip())
        except:
            return 0
    return 0


def save_hours(hours):
    with open(SAVE_FILE, "w") as f:
        f.write(str(hours))


def increment():
    hours = load_hours() + 1
    save_hours(hours)
    return hours


def reset():
    if os.path.exists(SAVE_FILE):
        os.remove(SAVE_FILE)
    return 0


def ask_confirm():
    with open(CONFIRM_FILE, "w") as f:
        f.write("1")
    return None


def confirm_ready():
    return os.path.exists(CONFIRM_FILE)


def clear_confirm():
    if os.path.exists(CONFIRM_FILE):
        os.remove(CONFIRM_FILE)


def output(hours, confirm=False):
    tooltip = (
        f"Work hours: {hours:02d}\nLeft-click to increment\nRight-click to reset"
        if not confirm
        else "Confirm reset? Right-click again to confirm"
    )
    text = f"Confirm Reset?" if confirm else f"{hours:02d} Hours Worked"
    cls = "work-hours confirm" if confirm else "work-hours"
    return json.dumps({"text": text, "tooltip": tooltip, "class": cls})


if __name__ == "__main__":
    hours = load_hours()

    if len(sys.argv) > 1:
        action = sys.argv[1]
        if action == "increment":
            hours = increment()
            clear_confirm()  # increment clears pending confirmation
        elif action == "reset":
            if confirm_ready():
                # second right-click -> perform reset
                hours = reset()
                clear_confirm()
            else:
                # first right-click -> set confirm flag and show confirm state
                ask_confirm()
                hours = load_hours()
                print(output(hours, confirm=True))
                sys.exit(0)
        else:
            hours = load_hours()
    else:
        hours = load_hours()

    # show confirm state if the confirm file exists
    print(output(hours, confirm=confirm_ready()))
