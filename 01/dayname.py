#!/usr/bin/env python3

from datetime import datetime

def main():
    now = datetime.now()
    day_of_week = now.strftime('%A')
    print(day_of_week)

if __name__ == '__main__':
    main()


