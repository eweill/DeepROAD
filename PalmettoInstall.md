# Install Darknet on Palmetto

Clone the entire DeepROAD repository into your scratch2 directory on Palmetto.  This includes all the necessary scripts to start using Darknet, including scripts to download weights.  cuDNN needs to be cloned seperately into the correct location to work with the Makefile.

	# Clone DeepROAD to scratch2
	git clone --recursive https://github.com/eweill/DeepROAD.git /scratch2/${USER}/DeepROAD

Next we need to create an interactive job on a node with a GPGPU (in this case a K40).

	# Create interactive session with provided script (modifiable if necessary).
	/scratch2/${USER}/DeepROAD/bin/k40

After successfully invoking an interactive session on Palmetto, set up the proper paths and environment variables for YOLO (including CUDA, OpenCV, FFMPEG, and more).  The `yolo` script inside the cloned repository will set up all path variables and environment variables
	
	# Make sure there are no loaded modules
	module list
	### Should return 'No Modulefiles Currently Loaded.'

	# Source the `yolo` script to set all env and path variables.
    source /scratch2/${USER}/DeepROAD/bin/modules add
	source /scratch2/${USER}/DeepROAD/bin/setEnv palmetto

	# See that all modules are loaded correctly
	module list
	### Should return the following
	###   1) gmp/4.3.2     3) mpc/0.8.1    5) anaconda3/4.0.0       7) opencv/2.4.9
	###   2) mpfr/2.4.2    4) gcc/4.8.1    6)cuda-toolkit/7.5.18    8) ffmpeg/2.4

Note that the list of modules may appear in a different order.  As long as they are all present, the installation and invokation should work fine.

We can now start to build darknet (with the provided modified Makefile).  We want to `make` CU-Darknet so that all object files and dependencies are built successfully.  The Makefile defaults to using CUDa and cuDNN, however, not using OpenCV.  If you would like to use OpenCV, simply modify the Makefile to read `OPENCV=1` instead of 0.  Conversely, to use the CPU-only (no-gpu) version of darknet either change the CUDA and CUDNN flags to 0 or compile with them set to 1 and use the -nogpu flag with executing ./darknet.
	
	# Copy the Palmetto Makefile, make the darknet executable and other object files needed,
	# and return to original directory.
	cd /scratch2/${USER}/DeepROAD/CU-Darknet; cp INSTALL/Makefile.palmetto Makefile; make; cd -

If there are no errors, it should have compiled correctly.  Now try running darknet.

	# If you are in the directory with the executable
	./darknet

	# If you are in a directory without the executable
	/scratch2/${USER}/DeepROAD/CU-Darknet/darknet

	# This is the output that will appear if installed correctly:
	usage: ./darknet <function>
	OR
	usage: /scratch2/${USER}/DeepROAD/CU-Darknet/darknet <function>