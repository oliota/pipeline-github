#!/bin/bash
timestamp=$(date '+%Y-%m-%d_%H-%M-%S')
echo "Commit made at $timestamp" > "commits/$timestamp.txt"
