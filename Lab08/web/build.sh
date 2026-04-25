#!/bin/bash

set -ueo pipefail

usage() {
    echo "Usage: ..."
}

msg() {
    echo "$( date '+%Y-%m-%d %H:%M:%S | SSG |' )" "$@" >&2
}

get_version() {
    git rev-parse --short HEAD 2>/dev/null || echo unknown
}

build_markdown_page() {
    local input_file="$1"
    local output_file="public/$( basename "$input_file" ".md" ).html"
    $LOGGER "Generating $input_file => $output_file"
    pandoc \
        --template templates/main.html \
        --metadata site_title="$site_title" \
        --metadata page_version="$( get_version )" \
        "$input_file" >"$output_file"
}

build_dynamic_page() {
    local input_file="$1"
    local output_file="public/$( basename "$input_file" ".bin" ).html"
    $LOGGER "Generating $input_file => $output_file"
    "$input_file" >"$output_file"
}


generate_web() {
    local page
    for page in src/*.md; do
        if ! [ -f "$page" ]; then
            continue
        fi
        build_markdown_page "$page"
    done

    local script
    for script in src/*.bin; do
        if ! [ -f "$script" -a -x "$script" ]; then
            continue
        fi
        build_dynamic_page "$script"
    done

    cp -R static/* public/
}

upload_web_rsync(){
    if [ -z "$rsync_target" ]; then
        msg "WARNING: \$rsync_target not set, not uploading."
        return 0
    fi
    rsync -avz --delete public/ "$rsync_target"
}

LOGGER=:
watch_for_changes=false
upload=false

while getopts "hvwu" opt; do
    case "$opt" in
        h)
            usage "$0"
            exit 0
            ;;
        v)
            LOGGER=msg
            ;;
        w)
            watch_for_changes=true
            ;;
        u)
            upload=true
            ;;
        *)
            usage "$0" >&2;
            exit 1
            ;;
    esac
done
shift $(( OPTIND - 1))

site_title="$( whoami )'s site"
rsync_target="school:~/public_html"

mkdir -p public

if [ -f ssg.rc ]; then
    source ssg.rc
fi

generate_web
$upload && upload_web_rsync

if $watch_for_changes; then
    while true; do
        $LOGGER "Waiting for file change..."
        inotifywait -e modify src/* src static static/*
        generate_web
        $upload && upload_web_rsync
    done
fi
