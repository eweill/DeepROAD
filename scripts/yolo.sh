# YOLO script

# Modules
module purge
module add gcc/4.8.1
module add anaconda3/4.0.0
module add cuda-toolkit/7.5.18
module add openvc/2.4.9
module add ffmpeg/2.4

# Alias
alias k40='qsub -I -l select=1:ncpus=8:ngpus=1:gpu_model=k40,walltime=06:00:00'

# YOLO PATHS
export PATH=$PATH:/scratch2/${USER}/YOLO_Palmetto/cuDNNv5.1/include/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/scratch2/${USER}/YOLO_Palmetto/cuDNNv5.1/lib64/