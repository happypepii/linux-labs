#!/usr/bin/env python3

import json
import sys

def get_json(filename):
    try:
        with open(filename, "r") as inp:
            return json.load(inp)
    except FileNotFoundError as e:
        fatal(f"Unable to read {filename}: {e}")


def main():
    if len(sys.argv) != 2:
        fatal("Provide data JSON as the only argument.")
    data = get_json(sys.argv[1])
    for line in map(lambda x: x.rstrip('\n'), sys.stdin):
        print(line.format(**data))

if __name__ == '__main__':
    main()
