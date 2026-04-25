#!/bin/bash

get_points(){
    local goals_mine="$1"
    local goals_opponent="$2"

    if [ "$goals_mine" -eq "$goals_opponent" ]; then
        echo 1
    elif [ "$goals_mine" -gt "$goals_opponent" ]; then
        echo 3
    else
        echo 0
    fi
}

process_goals(){
    local team1 team2
    local goals1 goals2

    while read -r team1 goals1 delimeter goals2 team2; do
        echo "$team1" "$( get_points "$goals1" "$goals2" )" 
        echo "$team2" "$( get_points "$goals2" "$goals1" )" 
    done
}

group_key_sum() {
    local prev_key=""
    local sum=0

    while read -r key value; do
        if [ "$key" != "$prev_key" ]; then
            if [ -n "$prev_key" ]; then
                echo "$prev_key $sum"
            fi
            prev_key="$key"
            sum=0
        fi
        sum=$(( sum + value ))
    done
    if [ -n "$prev_key" ]; then
        echo "$prev_key $sum"
    fi
}


process_goals <game_result.txt | sort | group_key_sum

