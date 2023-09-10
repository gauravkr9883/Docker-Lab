# Install ansible in jenkins image 

FROM jenkins/jenkins

USER root

RUN apt-get update && apt-get install python3 -y

RUN apt-get install ansible -y

USER jenkins
