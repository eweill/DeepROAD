# DeepROAD
This project houses all scripts and code necessary for use of the DeepROAD Suite (in development).

## Darknet on Palmetto Cluster

Please follow the instructions on [Install Darknet on Palmetto](https://github.com/eweill/DeepROAD/blob/master/PalmettoInstall.md)

## Darknet on Jetson TX1 (TK1) or Other Linux Distro

Please follow the instruction on [Install Darknet on Linux](https://github.com/eweill/DeepROAD/blob/master/LinuxInstall.md)

## Downloading Weights and Configuration Files

Simply run the `get-data` script to retrieve weights and configuration as follows

To get a list of all weights possible to download (Palmetto, Jetson, Linux)

    # To get a list of all weights possible to download
    # Palmetto, Jetson TX1, or Other Linux distro
	/scratch2/${USER}/DeepROAD/CU-Darknet/bin/get-data help

To download a single set of weights (and/or configuration) [vgg-16 for example]

	# To download a single set of weights (and/or configuration) [vgg-16 for example]
    # Palmetto
	/scratch2/${USER}/DeepROAD/CU-Darknet/bin/get-data vgg16 palmetto

    # Jetson TX1
    /home/${USER}/DeepROAD/CU-Darknet/bin/get-data vgg16 jetson
    
    # Other linux distro
    /home/${USER}/DeepROAD/CU-Darknet/bin/get-data vgg16 linux

To download all weights and configration files

	# To go ahead and download all weights and configurations
    # Palmetto
	/scratch2/${USER}/DeepROAD/CU-Darknet/bin/get-data all palmetto
    
    # Jetson TX1
    /home/${USER}/DeepROAD/CU-Darknet/bin/get-data all jetson
    
    # Other linux distro
    /home/${USER}/DeepROAD/CU-Darknet/bin/get-data all linux

This script will check the `weights` and `cfg` directories to make sure not to overwrite any files already located in those directories.

To make changes to this repo from Palmetto, there may be a need to remove all modules that have been loaded before `git` commands will work properly.  This can be done by simply executing the following command

    source /scratch2/${USER}/DeepROAD/bin/modules remove

After `git (add/push/etc.)`, modules can be added again for continued work by executing

    source /scratch2/${USER}/DeepROAD/bin/modules add