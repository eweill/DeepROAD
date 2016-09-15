# Install Darknet on Jetson (Linux)

NOTE: This installation process assumes a home directory of /home/ubuntu/
PREREQUISITE: JetPack 2.3 installed on Jetson. [Download Jetpack](https://developer.nvidia.com/embedded/jetpack)

Create a software directory and clone the DeepROAD repository into that directory.  This includes all the necessary scripts to start using Darknet, including scripts to download weights.

	# Make Software directory
	mkdir /home/ubuntu/Software

	# Clone DeepROAD to scratch2
	git clone https://github.com/eweill/DeepROAD.git /home/ubuntu/Software/DeepROAD

Now that the DeepROAD repo is cloned, building darknet can continue.  A Makefile is provided which will build all dependencies and object files necessary to run darknet.  The Makefile defaults to using CUDA, cuDNN, and OpenCV as these come preinstalled with JetPack 2.3.  If any of these options do not suite the installation on the Jetson, simply modify the Makfile.jetson to reflect the needed changes.

	# Copy the Jetson Makefile, make the darknet executable and other object files needed,
	# and return to original directory.
	cd /home/ubuntu/Software/DeepROAD/CU-Darknet; cp Makefile.jetson Makefile; make; cd -

If there are no errors, it should have compiled correctly.  Now try running darknet.
	
	# If you are in the directory with the executable
	./darknet

	# If you are in a directory without the executable
	/home/ubuntu/Software/DeepROAD/CU-Darknet/darknet

	# This is the output that will appear if installed correctly:
	usage: ./darknet <function>
	# OR
	usage: /home/ubuntu/Software/DeepROAD/CU-Darknet/darknet <function>