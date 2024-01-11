#!/usr/bin/env bash

if command -v stow &> /dev/null
then
# iterates over directories calling stow for each one
    for FILE in */; 
        do stow ${FILE%/};
    done
else
    echo "GNU stow must be installed."
fi
