#!/bin/bash -l
#SBATCH --job-name=nvproftimeline_16
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kjetil.lye@sam.math.ethz.ch
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=normal
#SBATCH --constraint=gpu
#SBATCH --account=s913

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

srun nvprof -m dram_read_transactions,dram_write_transactions,dram_write_throughput,dram_read_throughput,flop_count_dp,flop_count_sp -o output_16.nvprof $HOME/alsvinn/build/alsuqcli/alsuqcli kelvinhelmholtz_3d_tube/kelvinhelmholtz.xml
 
