#!/bin/bash
container_name="webserver"

# Check if container with the given name is running
if docker ps --format '{{.Names}}' | grep -q "^$container_name$"; then
    echo "Container '$container_name' is running. Deleting..."
    docker stop "$container_name" && docker rm "$container_name"
    echo "Container '$container_name' deleted."
else
    echo "Container '$container_name' is not running."
fi

# Check if an image with the given name exists
if docker images --format '{{.Repository}}' | grep -q "^$container_name$"; then
    echo "Image '$container_name' exists. Deleting..."
    docker rmi "$container_name"
    echo "Image '$container_name' deleted."
else
    echo "Image '$container_name' does not exist."
fi
