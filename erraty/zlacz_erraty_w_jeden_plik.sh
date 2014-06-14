#!/bin/bash

cat rozdz-*.md > calosc.md
pandoc calosc.md -o calosc.pdf
