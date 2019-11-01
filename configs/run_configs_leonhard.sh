#!/bin/bash
set -e
for nx in 16 32 64 128 256 410;
do

    cd nx_${nx};
    bsub -R "rusage[ngpus_excl_p=1,mem=8000] span[ptile=8]" -n 1 -W 24:00 nvprof -m dram_read_transactions,dram_write_transactions,dram_write_throughput,dram_read_throughput,flop_count_dp,flop_count_sp -o output_64.nvprof $HOME/alsvinn/build/alsuqcli/alsuqcli kelvinhelmholtz_3d_tube/kelvinhelmholtz.xml
    cd ..;
    cd nx_large_${nx};
    bsub -R "rusage[ngpus_excl_p=1,mem=8000] span[ptile=8]" -n 1 -W 24:00 $HOME/alsvinn/build/alsuqcli/alsuqcli kelvinhelmholtz_3d_tube/kelvinhelmholtz.xml
    cd ..;
done
