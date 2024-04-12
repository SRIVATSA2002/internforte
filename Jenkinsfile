pipeline {
agent any
stages{
stage("fetch"){
steps{
git branch: 'main', url: 'https://github.com/SRIVATSA2002/internforte.git'
}}

stage("delete duplicate"){
      steps{
        sh '''
container_name="webserver"

# Check if container with the given name is running
if sudo docker ps --format '{{.Names}}' | grep -q "^$container_name$"; then
    echo "Container '$container_name' is running. Deleting..."
    sudo docker stop "$container_name" && docker rm "$container_name"
    echo "Container '$container_name' deleted."
else
    echo "Container '$container_name' is not running."
fi

# Check if an image with the given name exists
if sudo docker images --format '{{.Repository}}' | grep -q "^$container_name$"; then
    echo "Image '$container_name' exists. Deleting..."
    sudo docker rmi "$container_name:v1"
    echo "Image '$container_name' deleted."
else
    echo "Image '$container_name' does not exist."
fi
'''
      }
      }

stage("build docker image"){
steps{
sh 'sudo docker build -t webserver:v1 .'
sh 'sudo docker run --name webserver -p 5000:5000 webserver:v1' 
}}
}}




