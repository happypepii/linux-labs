#!/usr/bin/env python3

import sys

print(f"var count: {len(sys.argv)-1}")

for i, arg in enumerate(sys.argv[1:], start=1):
	print(f"var {i}: [{arg}]")
