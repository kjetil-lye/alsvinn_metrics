#!/bin/bash
set -e
for nx in 16 32 64 128 256;
do

    cp -r template nx_${nx};
    cp -r template_large nx_large_${nx};
    sed -i "s/NX/${nx}/g" nx_${nx}/kelvinhelmholtz_3d_tube/kelvinhelmholtz.xml;
    if [ "$nx" -lt "256" ];
    then
       sed -i "s/ENDTIME/0.02/g" nx_${nx}/kelvinhelmholtz_3d_tube/kelvinhelmholtz.xml;
    else
	sed -i "s/ENDTIME/0.001/g" nx_${nx}/kelvinhelmholtz_3d_tube/kelvinhelmholtz.xml;
    fi
    sed -i "s/NX/${nx}/g" nx_large_${nx}/kelvinhelmholtz_3d_tube/kelvinhelmholtz.xml;
    sed -i "s/NX/${nx}/g" nx_large_${nx}/submit.sh;
    sed -i "s/NX/${nx}/g" nx_${nx}/submit.sh;
done
