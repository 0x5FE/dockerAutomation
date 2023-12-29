#!/bin/bash

# Docker version
DOCKER_VERSION="20.10.8"

# Docker Compose configuration file name
DOCKER_COMPOSE_FILE="docker-compose.yml"

# List of environments to create
ENVIRONMENTS=(
  "prod"
  "dev"
  "test"
)

# Server operating system version
OS_VERSION="ubuntu:20.04"

# Server user
USER="root"

# Server password
PASSWORD="password"

# Folder where containers will be created
CONTAINERS_FOLDER="/var/lib/docker"

# Function to check if Docker is installed
function check_docker {
  if ! command -v docker &> /dev/null; then
    echo "Docker is not installed."
    exit 1
  fi
}

# Function to check if Docker Compose is installed
function check_docker_compose {
  if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose is not installed."
    exit 1
  fi
}

# Function to download the latest version of Docker
function download_docker {
  echo "Downloading the latest version of Docker..."
  curl -sL https://get.docker.com | sh
}

# Function to create the environment
function create_environment {
  # Check if the environment already exists
  if docker ps -a | grep -q "$1"; then
    echo "Environment $1 already exists."
    return
  fi

  # Download the Dockerfile and Docker Compose
  echo "Downloading the Dockerfile and Docker Compose..."
  curl -sL https://raw.githubusercontent.com/bard/docker-automation/main/Dockerfile -o Dockerfile
  curl -sL https://raw.githubusercontent.com/bard/docker-automation/main/docker-compose.yml -o docker-compose.yml

  # Create the user and directory for the environment
  echo "Creating the user and directory for the environment..."
  docker exec -it $1 bash -c "sudo useradd -m -s /bin/bash $USER"
  docker exec -it $1 bash -c "sudo mkdir -p $CONTAINERS_FOLDER/$1"
  docker exec -it $1 bash -c "sudo chown $USER:$USER $CONTAINERS_FOLDER/$1"

  # Change the password of the user in the container
  echo "Changing the password of the user in the container..."
  docker exec -it $1 bash -c "echo $PASSWORD | sudo passwd $USER"

  # Create the volume for the environment
  echo "Creating the volume for the environment..."
  docker volume create $1-volume

  # Mount the volume in the container
  echo "Mounting the volume in the container..."
  docker run -it --rm -v $1-volume:/var/www/html $1
}

# Check if Docker is installed
check_docker

# Check if Docker Compose is installed
check_docker_compose

# Download the latest version of Docker if necessary
if ! docker --version | grep -q "$DOCKER_VERSION"; then
  download_docker
fi

# Create all environments
for environment in "${ENVIRONMENTS[@]}"; do
  create_environment $environment
done

# Success message
echo "All environments were created successfully!"
