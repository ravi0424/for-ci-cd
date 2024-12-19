#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull ravikirangunnabattula/simple-php-app

# Run the Docker image as a container
docker run -d -p 80:80 ravikirangunnabattula/simple-php-app
