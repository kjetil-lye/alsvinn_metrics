# alsvinn_metrics

A small collection of scripts to measure total number of floating point operations and memory bandwidth of alsvinn.

## Usage
First run the different configurations through nvprof (see attached submit files). Then open resulting nvprof output files in nvvp, and export kernel data to csv. Name kernel data as ```data/kernel_data_<resolution>.csv``` and run the notebook under notebooks.