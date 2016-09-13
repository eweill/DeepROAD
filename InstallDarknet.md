# Install Darknet on Palmetto

First, change directories to scratch2 in order to clone the DeepROAD repository into the correct location.  Clone the entire DeepROAD repository.  Change directory to scripts folder inside DeepROAD repository.

	# Change directory to /scratch2/<your-username>
	cd /scratch2/${USER}

	# Clone repo into /scratch2/<your-username>
	git clone https://github.com/eweill/DeepROAD.git
	
	# Move to directory to invoke interactive node on Palmetto
	cd /scratch2/${USER}/DeepROAD/scripts

In this directory, there are 3 executable scripts.  `getGPUNode` is the script to run to invoke an interactive node on Palmetto with a K40 as the accelerator.

	# Invoke the getGPUNode scripts to get an interactive session
	./getGPUNode

After logging onto a node with a K40 GPGPU, we need to change directories again to where Darknet is installed.  Go back into the scripts folder and source the `yolo` script which will add all the necessary modules to your interactive session (including CUDA, OpenCV, FFMPEG, and more).  Then invoke the command `module list` to make sure all modules were added successfully.
	
	# Change directories to darknet repo
	cd /scratch2/${USER}/DeepROAD/scripts

	# Source the yolo file to set modules
	source yolo

	# Check the modules that were loaded
	module list

Once all modules have been added successfully, we can now make the darknet installation.  Change directories into the darknet location and then run `make` in the directory which will create all object files needed.  This Makefile defaults to using CUDA and cuDNN, however not using OpenCV.  If you would like to use OpenCV, simply modify the Makefile to read `OPENCV=1` instead of 0.  Conversly, to use CPU only (no-gpu), simply change the CUDA and CUDNN flags to 0.

	# Change directories to darknet installation
	cd /scratch2/${USER}/DeepROAD/CU-Darknet

	# Run the `make` command to create all object files (modify as needed)
	make

If there are no errors, it should have compiled correctly. Now try running darknet.
	
	./darknet

	# This is the output that will appear if installed correctly:
	usage: ./darknet <function>