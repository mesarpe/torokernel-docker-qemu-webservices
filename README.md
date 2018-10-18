Test Toro Kernel in 5 minutes
=============================

In this example, you will execute Toro Kernel with a basic web server application. This web server application will read an index.html page from a second image. And you will be able to see the webpage using your webbrowser.

Download Toro Images
--------------------

First, download the last release of *TorowithFilesystem* example (Toro + a basic web server) and another image that contains the index.html, i.e., *ToroFiles.img*:

```
cd /YOUR/FOLDER
mkdir img
cd img
curl -O -L https://github.com/MatiasVara/torokernel/releases/download/master-346/TorowithFileSystem.img
curl -O -L https://github.com/MatiasVara/torokernel/releases/download/master-346/ToroFiles.img
cd ..
```

NOTE: *ToroFiles.img* is an EXT2 filesystem. To modify this image, just mounted and edit index.html which is located in /web/index.html.

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
	-e TOROIMG_A=img/TorowithFileSystem.img \
	-e TOROIMG_B=img/ToroFiles.img \
	-v /YOUR/FOLDER/img:/app/img \
	torokernel/qemu-x86_64-webservices
```

NOTE: this is not intended for running in production. It is simply an easy shortcut to test Toro Kernel.

Testing
-------

Simply open your browser and see the first page, or do it on the command line:

```
curl http://192.100.200.100/
```

Or you can also ping it:

```
ping 192.100.200.100
```

NOTE: this is not intended for running in production. It is simply an easy shortcut to test Toro Kernel.
