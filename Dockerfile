# Use an official Jenkins image as a parent image
FROM jenkins/jenkins:lts

# The user that will run the commands
USER root

# Installing the necessary packages
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

# Adding Docker's official GPG key
RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -

# Verifying the Docker GPG key
RUN apt-key fingerprint 0EBFCD88

# Setting up Docker stable repository
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"

# Installing Docker CE
#RUN apt-get install -y docker-ce

# Adding the Jenkins user to the Docker group
#RUN usermod -aG docker jenkins

# Switching back to the Jenkins user
USER jenkins

# Inform Docker that the container listens on the specified network ports at runtime.
EXPOSE 8080
