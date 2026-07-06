#!/usr/bin/env python3

import sys
from datetime import datetime

def process_line(line):
    parts = line.split(None, 1)
    if not parts:
        return line

    date = parts[0]
    rest = f" {parts[1]}" if len(parts) > 1 else ""
    
    try:
        dt = datetime.strptime(date, "%Y-%m-%d")
        day_name = dt.strftime("%A")
        return f"{day_name}{rest}"
    except ValueError:
        return line

def get_input_stream():
    if len(sys.argv) > 1:
        try:
            return open(sys.argv[1], "r")
        except OSError:
            print(f"{sys.argv[1]}: error reading file", file=sys.stderr)
            sys.exit(1)
    return sys.stdin

def process_all_lines(stream):
    try:
        for line in stream:
            print(process_line(line.rstrip('\n')))
    finally:
        if stream is not sys.stdin:
            stream.close()

def main():
    stream = get_input_stream()
    process_all_lines(stream)

if __name__ == "__main__":
    main()