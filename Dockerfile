# Create a new image from Alpine Linux
FROM alpine:3.19.1

# Install build-base metapackage (gcc, g++, make, libc-dev, etc.)
RUN apk add --no-cache build-base

# Install git and cmake (needed to install EdgeX device SDK)
RUN apk add --no-cache git
RUN apk add --no-cache cmake

# Define the working directory for cloning repositories
WORKDIR /code

# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python

# Install OPC-UA library
RUN git clone -b v1.3.6 https://github.com/open62541/open62541.git
WORKDIR /code/open62541/build
RUN cmake ..
RUN make
RUN make install

# Copy all files to app directory
WORKDIR /code/app
COPY . .

# Compile app
WORKDIR /code/app/build
RUN cmake ..
RUN make

# Run app
CMD ["./src/server-opcua"]
