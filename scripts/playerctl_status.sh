#!/usr/bin/env bash

read -d " " -r -a PLAYERS <<< "$(playerctl -l)"

PLAYING_PLAYER=""
for PLAYER in "${PLAYERS[@]}";
do
    PLAYER_STATUS="$(playerctl -p "$PLAYER" status)";
    if [ "${PLAYER_STATUS}" == "Playing" ]; then
        PLAYING_PLAYER=${PLAYER};
        break;
    fi
done

if [ "${PLAYING_PLAYER}" == "" ]; then
    echo "It's pretty quiet here ...";
else
    LENGTH_FORMAT=""
    LENGTH_CHECK=$(playerctl -p ${PLAYING_PLAYER} metadata --format "{{ duration(mpris:length) }}" 2>/dev/null)
    if [ "${LENGTH_CHECK}" != "" ]; then
        LENGTH_FORMAT=" - {{ duration(position) }}/{{ duration(mpris:length) }}"
    fi

    echo $(playerctl -p "${PLAYING_PLAYER}" metadata --format "{{ playerName }} {{ uc(status) }}: {{ artist }} - {{ title }}${LENGTH_FORMAT}");
fi
