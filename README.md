# Zeppelin Notebook Python and Spark

This docker image provides an development environent with pyspark through Zepellin notebooks.

## Basic Use

The docker images can be found in  [my repository](https://hub.docker.com/r/jaglima/pyspark-zeppelin/) on Docker Hub.

### Obtaining the Docker Image

To get the docker image, the following `pull` command can be used.

    docker pull jaglima/pyspark-zeppelin


### Running the Image

The following command starts a container with the Notebook server listening on HTTP connections on port 8080 with a randomly generated authentication token.

    docker run -it --rm -p 8080:8080 \
    -v /some/host/folder/notebooks:/root/notebooks \
    jaglima/pyspark-zeppelin \
    zeppelin

A possible shortcut is to use run.sh script, calling 

    ./run.sh args

where args are passed to pyspark-zeppeplin env. Just calling ./run.sh zeppelin starts a zeppelin notebook in 127.0.0.1:8080.


### Sharing Zepellin Notebooks with the Image

To create/save notebook files on your local host available to the Zepellin on the Docker container, change the sample path (`/some/host/folder/notebooks`) to a directory, on your local host, that contains Zepellin notebook file.


## Using Spark

The container server is configured to run pyspark in local mode. The following steps must be completed to use pyspark.


## Using the Image Offline

This section contains instructions on how to save the image locally and load the image from a saved file

### Saving the Image to a File

To save the image locally to a file, use the `docker save` command. The `-o` option allows you to specify a path and filename to save the image as. The format of the command is `docker save [OPTIONS] IMAGE`. An example command to save the `jaglima/pyspark-zeppelin` image to your downloads folder would look like the following.

    docker save -o ~/Downloads/pyspark-zeppelin.docker jaglima/pyspark-zeppelin

After the image is saved it can be copied to a USB or network share.

### Loading the Image into Docker

To load an archive into Docker, use the `docker load` command. The `-i` options allows you to specify a path and filename of an archive to load. The format of the command is `docker load [OPTIONS]`. An example of command to load an archive would look like the following. 

    docker load -i ~/Downloads/pyspark-zeppelin.docker


## Useful Docker Commands


### List running containers
    
    docker ps


### Attach to a running container

    docker exec -it training /bin/bash


### Stop container

    docker stop training


### Remove containers that are exited

    docker rm $(docker ps -q -f status="exited")


