#!/bin/bash
echo "$(date -u '+%Y-%m-%d %H:%M:%S')" >> contribuition.txt
git add -A
git commit -m "Add hourly contribution"
git status
