Test Toro Kernel in 5 minutes
=============================

Download Toro Images
--------------------

You need first to download the Toro image and another image with (HTML) files:

```
cd /YOUR/FOLDER
mkdir img
cd img
curl -O -L https://github.com/MatiasVara/torokernel/releases/download/master-346/TorowithFileSystem.img
curl -O -L https://github.com/MatiasVara/torokernel/releases/download/master-346/ToroFiles.img
cd ..
```

Pull the docker image
---------------------

Next step consists in pulling the docker image, it is time to pull the docker image:

```docker build -t torokernel/qemu-x86_64-webservices  .```

Run
---

Finally, simply run a docker container. Feel free to tune the number of CPUs, and memory.

```
docker run --privileged --cap-add=NET_ADMIN --net=host \
	-d \
	 -e MEMORY=128 \
	-e NUMBER_OF_CPUS=1 \
	-e TOROIMG_A=TorowithFileSystem.img \
	-e TOROIMG_B=ToroFiles.img \
	-v /YOUR/FOLDER/img:/app/img \
	torokernel/qemu-x86_64-webservices
```

NOTE: this is not intended for running in production. It is simply an easy shortcut to test Toro Kernel.
