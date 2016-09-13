# DeepROAD
This project houses all scripts and code necessary for use of the DeepROAD Suite (in development).

## Palmetto Cluster

### Install Darknet on Palmetto

Please follow the instructions on [Install Darknet on Palmetto](https://github.com/eweill/DeepROAD/blob/master/InstallDarknet.md)

### Downloading weights and config files

Simply run the `get-data` script to retrieve weights and configuration as follows

	# To get a list of all weights possible to download
	/scratch2/${USER}/DeepROAD/CU-Darknet/scripts/get-data help

	# To download a single set of weights (and/or configuration) [vgg-16 for example]
	/scratch2/${USER}/DeepROAD/CU-Darknet/scripts/get-data vgg16

	# To go ahead and download all weights and configurations
	/scratch2/${USER}/DeepROAD/CU-Darknet/scripts/get-data all

This script will check the `weights` and `cfg` directories to make sure not to overwrite any files already located in those directories.

## Jetson TX1 (or TK1)

### Installing Darknet on Jetson TX1

### Downloading weights and config files