#!/bin/bash

set -euo pipefail

get_points(){
    local mine="$1"
    local opponent="$2"
    if [ "$mine" -eq "$opponent" ]; then
        echo 1
    elif [ "$mine" -gt "$opponent" ]; then
        echo 3
    else
        echo 0
    fi
}

process_game_data(){
    while read -r team1 goals1 delim goals2 team2 || [ -n "$team1" ]; do
        [ -z "$team1" ] && continue
        
        echo "$team1 $(get_points "$goals1" "$goals2") $goals1"
        echo "$team2 $(get_points "$goals2" "$goals1") $goals2"
    done
}


group_key_sum() {
    local prev_key=""
    local sum_p=0
    local sum_g=0

    while read -r key p g; do
        if [ "$key" != "$prev_key" ]; then
            if [ -n "$prev_key" ]; then
                echo "$prev_key $sum_p $sum_g"
            fi
            prev_key="$key"
            sum_p=0
            sum_g=0
        fi
        sum_p=$(( sum_p + p ))
        sum_g=$(( sum_g + g ))
    done
    
    if [ -n "$prev_key" ]; then
        echo "$prev_key $sum_p $sum_g"
    fi
}


as_markdown_table() {
    echo
    echo '| Team | Points | Goals |'
    echo '| ---- | -----: | ----: |'
    while read -r team points goals; do
        echo '|' "$team" '|' "$points" '|' "$goals" '|'
    done
    echo
}


process_game_data < game_result.txt | sort | group_key_sum | sort -k2,2nr -k3,3nr | as_markdown_table
