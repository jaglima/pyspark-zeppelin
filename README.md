# Jupyter Notebook Python and Spark

This docker image allows the development of pyspark through the user of Zepellin.

## Basic Use

The docker images can be found in  [my repository](https://hub.docker.com/r/jaglima/pyspark-zepellin/) on Docker Hub.

### Obtaining the Docker Image

To get the docker image, the following `pull` command can be used.

    docker pull jaglima/pyspark-zepellin


### Running the Image

The following command starts a container with the Notebook server listening on HTTP connections on port 8888 with a randomly generated authentication token.

    docker run -it --rm -p 8080:8080 \
    -v /some/host/folder/notebooks:/root/notebooks \
    jaglima/pyspark-zepellin \
    zepellin

To access the notebook server, copy/paste the URL into your browser.


### Sharing Zepellin Notebooks with the Image

To make notebook files on your local host available to the Zepellin on the Docker container, change the sample path (`/some/host/folder/notebooks`) to a directory, on your local host, that contains Zepellin notebook file.


## Using Spark

The container server is configured to run pyspark in local mode. The following steps must be completed to use pyspark.


## Using the Image Offline

This section contains instructions on how to save the image locally and load the image from a saved file

### Saving the Image to a File

To save the image locally to a file, use the `docker save` command. The `-o` option allows you to specify a path and filename to save the image as. The format of the command is `docker save [OPTIONS] IMAGE`. An example command to save the `jaglima/pyspark-zepellin` image to your downloads folder would look like the following.

    docker save -o ~/Downloads/pyspark-zepellin.docker jaglima/pyspark-zepellin

After the image is saved it can be copied to a USB or network share.

### Loading the Image into Docker

To load an archive into Docker, use the `docker load` command. The `-i` options allows you to specify a path and filename of an archive to load. The format of the command is `docker load [OPTIONS]`. An example of command to load an archive would look like the following. 

    docker load -i ~/Downloads/jupyter-pyspark.docker


## Useful Docker Commands


### Run the docker container

    docker run -it --rm -p 8888:8888 \
    -v /some/host/folder/notebooks:/root/notebooks \
    --name=training \
    minerkasch/jupyter-pyspark /bin/bash


### List running containers
    
    docker ps


### Attach to a running container

    docker exec -it training /bin/bash


### Stop container

    docker stop training


### Remove containers that are exited

    docker rm $(docker ps -q -f status="exited")
