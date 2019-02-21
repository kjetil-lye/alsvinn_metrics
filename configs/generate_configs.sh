#!/bin/bash
set -e
for nx in 16 32 64 128 256;
do

    cp -r template nx_${nx};
    cp -r template_large nx_large_${nx};
    sed -i "s/NX/${nx}/g" nx_${nx}/kelvinhelmholtz_3d_tube/kelvinhelmholtz.xml;
    sed -i "s/NX/${nx}/g" nx_large_${nx}/kelvinhelmholtz_3d_tube/kelvinhelmholtz.xml;
    sed -i "s/NX/${nx}/g" nx_large_${nx}/submit.sh;
    sed -i "s/NX/${nx}/g" nx_${nx}/submit.sh;
done
