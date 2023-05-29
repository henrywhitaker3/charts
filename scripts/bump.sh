#!/bin/bash
# Bump the version number for charts using the generic template
# Usage: ./bump.sh <version>

for dir in */; do
    if [ $dir == "generic/" ]; then
        continue
    fi

    cat "$dir"Chart.yaml 2>/dev/null | grep generic >/dev/null 2>&1
    rc=$?
    if [ $rc -eq 0 ]; then
        DIR=$dir VERSION=$1 task update:version
    fi
done
