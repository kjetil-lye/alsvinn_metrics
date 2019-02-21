#!/bin/bash
set -e
for nx in 16 32 64 128 256;
do

    cd nx_${nx};
    sbatch submit.sh;
    cd ..;
    cd nx_large_${nx};
    sbatch submit.sh;
    cd ..;
done
