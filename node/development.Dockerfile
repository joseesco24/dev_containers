FROM node:16.6.1

ARG WORKDIR=/workspaces/backend_test_ipcom

RUN mkdir -p $WORKDIR

WORKDIR $WORKDIR

COPY ["package.json", "$WORKDIR"]

RUN npm install -g npm@latest
RUN npm install --production=false

RUN find "$WORKDIR/" -type d -exec chmod 755 {} \;
RUN find "$WORKDIR/" -type f -exec chmod 755 {} \;
