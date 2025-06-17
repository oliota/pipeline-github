#!/bin/bash
mkdir -p commits

username=$(git config user.name)
email=$(git config user.email)

for i in {1..40}; do
  timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
  echo "Commit $i at $timestamp" > "commits/$timestamp-$i.txt"
  git add commits/
  git commit -m "Auto commit #$i at $timestamp"
  sleep 1
done

git push
