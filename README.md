# DockerAutomation

- It checks whether Docker and Docker Compose are installed.
- It downloads the latest version of Docker if necessary.
- It creates a user and folder for each environment.
- It creates a volume for each room.
- It mounts the volume in each environment.
- It creates the container for each environment.
- It starts the container for each environment.

# Prerequisites

    Docker
    Docker Compose

- Make sure the operating system is Ubuntu 20.04 before running the script.

# Installation

- Clone the repository:

`git clone https://github.com/0x5FE/dockerAutomation.git`

`cd dockerAutomation`

- Run the automation script:

`chmod +x dockerautomation.sh`

`./dockerAutomation.sh`

- Or Download the script to your server.
- 
# Possible errors and how to resolve them

The following errors may occur when running the script:

- Error 1: Docker is not installed.

- Solution: Install Docker as instructed in the Docker documentation.

- Error 2: Docker Compose is not installed.

- Solution: Install Docker Compose as instructed in the Docker Compose documentation.

- Error 3: The script cannot access the Dockerfile or docker-compose.yml file.

- Solution: Make sure the Dockerfile and docker-compose.yml files are located in the script's current working directory.

- Error 4: The script cannot create the user or folder for the environment.

- Solution: Make sure the user running the script has superuser privileges.

 - Error 5: The script cannot create the volume for the environment.

- Solution: Make sure the user running the script has superuser privileges.

- Error 6: The script cannot mount the volume in the environment.

- Solution: Make sure the user running the script has superuser privileges.

- Error 7: The script cannot create the container for the environment.

- Solution: Check the Docker log for more information about the error.

# Note


- The script can be customized to meet the specific needs of each environment. ***For example, you can change the version of Docker to use, the file name of the Dockerfile or docker-compose.yml***, or the list of environments to create.
  
- The script must be run as superuser.
