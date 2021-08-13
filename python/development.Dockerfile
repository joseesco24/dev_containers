# Declaration of the Python version.

FROM python:3.7.10

# Declaration of the project file system and username inside the development container.

ARG WORKDIR=/home/python_dev/workspace
ARG WORKDIR_ROOT=/home/python_dev
ARG USERNAME=python_dev

# Creating the user on bash and their home directory.

RUN useradd --create-home --shell /bin/bash $USERNAME

# Creating the directories for the file system.

RUN mkdir -p $WORKDIR

# Copying the dependencies files to the container.

COPY ["requirements/commons.txt","requirements/development.txt","$WORKDIR/"]

# Adding to the container path the Python dependencies directory.

ENV PATH="/home/$USERNAME/.local/bin:$PATH"

# Changing the premises of the file system.

RUN find "$WORKDIR_ROOT/" -type d -exec chmod 755 {} \;
RUN find "$WORKDIR_ROOT/" -type f -exec chmod 755 {} \;

RUN chown -R $USERNAME $WORKDIR_ROOT
RUN chmod 755 $WORKDIR_ROOT

# Establishing the default user and the default work directory.

WORKDIR $WORKDIR
USER $USERNAME

# Installing the dependencies inside the container.

RUN pip install --upgrade pip
RUN pip install -r commons.txt -r development.txt

# Removing the dependencies files from the container.

RUN rm -r development.txt
RUN rm -r commons.txt