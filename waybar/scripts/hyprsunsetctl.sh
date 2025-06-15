#!/usr/bin/env bash

PID_FILE="/tmp/hyprsunset.pid"
ENABLED_ICON=󰖚
DISABLED_ICON=

toggle_hyprsunset() {
    if [[ -f "$PID_FILE" ]]; then
        pkill -F "$PID_FILE"
        rm "$PID_FILE"
    else
        hyprsunset -t 5250 > /dev/null 2>&1 &
        echo $! > "$PID_FILE"
    fi
}

print_status() {
    if [[ -f "$PID_FILE" ]]; then 
        CLASS="enabled"
        TEXT="$ENABLED_ICON ON"
        TOOLTIP="hyprsunset on"
    else
        CLASS="disabled"
        TEXT="$DISABLED_ICON OF"
        TOOLTIP="hyprsunset off"
    fi
    printf '{"text": "%s", "class": "%s", "tooltip": "%s"}\n' "$TEXT" "$CLASS" "$TOOLTIP"
}

NO_ARGS=0
E_OPTERROR=85

if [ $# -eq "$NO_ARGS" ]
then
    echo "Usage: `basename $0` options (-ts)"
    echo "  -t  Toggle hyprsunset"
    echo "  -s  Get status"
    exit $E_OPTERROR
fi

while getopts ":ts" Option
do
    case $Option in
        t ) toggle_hyprsunset ;;
        s ) print_status ;;
        * ) echo "Invalid option"; exit $E_OPTERROR ;;
    esac
done

shift $(($OPTIND - 1))

