#!/usr/bin/env bash

# iterates over directories calling stow for each one
for FILE in */; 
    do stow ${FILE%/};
done
