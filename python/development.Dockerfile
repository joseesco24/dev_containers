FROM python:3.7.10

ARG USERNAME=python_dev
ARG WORKDIR=/home/python_dev/workspace

RUN useradd --create-home --shell /bin/bash $USERNAME

RUN mkdir -p $WORKDIR

COPY ["requirements/commons.txt","requirements/development.txt","$WORKDIR/"]

ENV PATH="/home/$USERNAME/.local/bin:$PATH"

RUN find "$WORKDIR/" -type d -exec chmod 755 {} \;
RUN find "$WORKDIR/" -type f -exec chmod 755 {} \;

RUN chown -R $USERNAME $WORKDIR
RUN chmod 755 $WORKDIR

WORKDIR $WORKDIR
USER $USERNAME

RUN pip install --upgrade pip
RUN pip install -r commons.txt -r development.txt