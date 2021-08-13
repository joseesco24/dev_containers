# About this repository

This repository contains the backend technical test for IPCOM, the execution of the test is explained in the next paragraphs and in their respective test directories, every test directory have their own redme.md.

<br>

## Build and execute part 1

The required API is containerized on a docker container, so first of all is needed to build the respective container image with the next command in the root of the repository.

```bash
docker build -t part_1:stable -f part_1.Dockerfile .
```

After building the image the next step is to deploy the API on a container also using docker with the next command.

```bash
docker run --rm -p 3000:3000 -d --cpus 2 --name part_1 part_1:stable
```

For stopping the API running the stop command is enough.

```bash
docker stop part_1
```

### Note about the part 1

The Api was tested using the request collection available on the directory requests_collections available on this repository, the container of this part need to be stoped, in other way the API will keep runing.

<br>

## Build and execute part 2

The required script is containerized on a docker container, so first of all is needed to build the respective container image with the next command in the root of the repository.

```bash
docker build -t part_2:stable -f part_2.Dockerfile .
```

After building the image the next step is to run the container also using docker with the next command, before running the command you need to be sure to be inside a directory that contains a folder called **csv_files** that is the folder that contains all the csv files that are going to be processed by the container and is where the container is going to deliver the json file with the results.

```bash
docker run --rm --volume $(pwd)/csv_files:/home/production/csv_files -d --cpus 2 --name part_2 part_2:stable
```

### Note about the part 2

The script was tested using the csv files available at the directory csv_files in this repository, the container of this part does not need to be stoped, when all the files on the mount directory are already processed it stops automatically.

<br>
