FROM debian:buster
EXPOSE 8080

RUN apt update -y && apt install -y gnupg wget openjdk-11-jre && \
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - && \
    echo "deb https://pkg.jenkins.io/debian binary/" > /etc/apt/sources.list.d/jenkins.list && \
    apt update && \
    apt install jenkins -y && \
    service jenkins start && \
    cat /var/lib/jenkins/secrets/initialAdminPassword

# CMD tail -f /dev/null 
