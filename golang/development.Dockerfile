FROM golang:1.17rc2

ARG USERNAME=development
ARG WORKDIR=/workspaces/golang_tests

RUN useradd -ms /bin/bash $USERNAME

RUN mkdir -p $WORKDIR

RUN mkdir -p $WORKDIR/go/bin
RUN mkdir -p $WORKDIR/go/pkg
RUN mkdir -p $WORKDIR/go/src

COPY [".","$WORKDIR"]

RUN find "$WORKDIR/" -type d -exec chmod 755 {} \;
RUN find "$WORKDIR/" -type f -exec chmod 755 {} \;

ENV GOPATH="$WORKDIR/go"
ENV GOBIN="$GOPATH/bin"
ENV GOROOT="/usr/local/go"

ENV PATH="$PATH:$GOBIN:$GOROOT/bin"

RUN chown -R $USERNAME $WORKDIR
RUN chmod 755 $WORKDIR

WORKDIR $WORKDIR
USER $USERNAME