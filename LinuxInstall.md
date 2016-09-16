# Install Darknet on Linux

NOTE: This installation process assumes a home directory of /home/ubuntu/ for the Jetson and /home/${USER}/ for other Linux distributions.

PREREQUISITE: JetPack 2.3 installed on Jetson. [Download Jetpack](https://developer.nvidia.com/embedded/jetpack)

Create a software directory and clone the DeepROAD repository into that directory.  This includes all the necessary scripts to start using Darknet, including scripts to download weights.

	# Make Software directory
    # Jetson TX1
	mkdir /home/ubuntu/Software
    
    # Other Linux
    mkdir /home/${USER}/Software

	# Clone DeepROAD to scratch2
    # Jetson TX1
	git clone https://github.com/eweill/DeepROAD.git /home/ubuntu/Software/DeepROAD
    
    # Other Linux
    git clone https://github.com/eweill/DeepROAD.git /home/${USER}/Software/DeepROAD

Now that the DeepROAD repo is cloned, building darknet can continue.  A Makefile is provided which will build all dependencies and object files necessary to run darknet.  The Makefile defaults to using CUDA, cuDNN, and OpenCV as these come preinstalled with JetPack 2.3.  If any of these options do not suite the installation on the Jetson, simply modify the Makfile.jetson to reflect the needed changes.

	# Copy the the appropriate Makefile, make the darknet executable and other object files needed,
	# and return to original directory.
    # Jetson TX1
	cd /home/ubuntu/Software/DeepROAD/CU-Darknet; cp INSTALL/Makefile.jetson Makefile; make; cd -
    
    # Other Linux
    cd /home/${USER}/Software/DeepROAD/CU-Darknet; cp INSTALL/Makefile.palmetto Makefile; make; cd -

If there are no errors, it should have compiled correctly.  Now try running darknet.
	
	# If you are in the directory with the executable
	./darknet

	# If you are in a directory without the executable
    # Jetson TX1
	/home/ubuntu/Software/DeepROAD/CU-Darknet/darknet
    
    # Other Linux
    /home/${USER}/Software/DeepROAD/CU-Darknet/darknet

	# This is the output that will appear if installed correctly:
	usage: ./darknet <function>
	# OR
	usage: /home/ubuntu/Software/DeepROAD/CU-Darknet/darknet <function>
    usage: /home/${USER}/Software/DeepROAD/CU-Darknet/darknet <function>