pipeline {
agent any
stages{
stage("fetch"){
steps{
git branch: 'main', url: 'https://github.com/SRIVATSA2002/internforte.git'
}}

stage("build docker image"){
steps{
sh 'docker build -t webserver:v1 .'
sh 'docker run --name webserver -p 5000:5000 webserver:v1' 
}}
}}




