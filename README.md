# alsvinn_metrics

A small collection of scripts to measure total number of floating point operations and memory bandwidth of alsvinn.

This works through doing two runs for each configurations. One run with nvprof to measure the approximate amount of data transferred within the GPU, and number of floating point operations executed per timestep, then a large run without nvprof to get the bandwidth and FLOPS.

## Usage
First you need to run the different configurations found in ```configs```. The configurations listed as ```nx_<mesh size>``` should be run with ```nvprof```, with the command line options

    nvprof -m dram_read_transactions,dram_write_transactions,dram_write_throughput,dram_read_throughput,flop_count_dp,flop_count_sp -o output_<mesh size>.nvprof <path to alasuqcli> kelvinhelmholtz_3d_tube/kelvinhelmholtz.xml

while the configurations listed as ```nx_large_<mesh size>``` should be run without, in other words as

    <path to alasuqcli> kelvinhelmholtz_3d_tube/kelvinhelmholtz.xml

After all configurations are run, open the output_<mesh size>.nvprof in ```nvvp``` (Nvidia visual profiler) and select export to csv. Save the file as ```nx_<mesh size>.csv```. Move all configuration files to a subfolder under ```data``` (see example folders in ```data``` for how the folder layout should look like)

After the ```.csv``` files have been generated, open the notebook and adjust as needed. Take care to set the correct bandwith and flops for the given GPU.