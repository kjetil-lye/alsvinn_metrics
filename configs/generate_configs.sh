#!/bin/bash
set -e
for nx in 16 32 64 128 256;
do

    cp -r template nx_${nx};
    sed -i "s/NX/${nx}/g" nx_${nx}/kelvinhelmholtz_3d_tube/kelvinhelmholtz.xml;
done
