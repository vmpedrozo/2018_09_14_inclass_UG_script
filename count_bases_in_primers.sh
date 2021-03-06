#!/bin/bash

# A script to count the number of bases in a primer
# it expects any number of fasta files as input
# it will be wrong if the last line of sequence info
# does not have a newline character

#expecting a fasta file formatted like this

# > sequence_id
# AGCTCGTC

# this will get the second line (the bases) in the files
# that's the head piped into tail
# then count the characters (the wc-m)
# but then also subtract one because the wc -m also counts newlines!
# sigh.
# Another solution would be to use tr like so
# head -n 2 primer_B.fasta | tail -n 1 | tr -d '\n' | wc -m
for file in "$@"
do
  FILENAME=$(basename "$file" .fasta)
  COUNT=$(head -n 2 "$file" | tail -n 1 | tr -d '\n' | wc -m | tr -d " ")
  echo In "$FILENAME", there are "$COUNT" nucleotides.
done
