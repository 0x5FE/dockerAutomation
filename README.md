# DockerAutomation

- It checks whether Docker and Docker Compose are installed.
- It downloads the latest version of Docker if necessary.
- It creates a user and folder for each environment.
- It creates a volume for each room.
- It mounts the volume in each environment.
- It creates the container for each environment.
- It starts the container for each environment.

# Prerequisites

    Operating System: Ubuntu 20.04
    Docker: Version 20.10.8
    Docker Compose

- Make sure the operating system is Ubuntu 20.04 before running the script.

# Installation

- Clone the repository:

`git clone https://github.com/bard/dockerAutomation.git`

`cd dockerAutomation`

- Run the automation script:

`chmod +x dockerautomation.sh`

`./dockerAutomation.sh`
