#!/bin/bash -l
#SBATCH --job-name=nvproftimeline_large_410
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kjetil.lye@sam.math.ethz.ch
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=normal
#SBATCH --constraint=gpu
#SBATCH --account=s839

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

srun $HOME/alsvinn/build/alsuqcli/alsuqcli kelvinhelmholtz_3d_tube/kelvinhelmholtz.xml
 
