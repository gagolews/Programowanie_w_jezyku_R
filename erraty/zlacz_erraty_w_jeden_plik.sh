#!/bin/bash

cat rozdz-*.md > wszystkie_erraty.md
pandoc wszystkie_erraty.md -o wszystkie_erraty.pdf
