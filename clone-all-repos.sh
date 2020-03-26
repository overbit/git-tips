#!/bin/bash
while read repo; do
    git clone "$repo"
    git submodule update --init
done < repo-list.txt
