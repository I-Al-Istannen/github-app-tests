#!/usr/bin/env bash

echo "I am the compiler driver at $PWD"
echo "I am called with the following arguments"
for arg in "$@"; do
    echo " ARG: '$arg'"
done
echo "Delegating to the built compiler..."
echo ""
exec ./compiler.sh "$@"
