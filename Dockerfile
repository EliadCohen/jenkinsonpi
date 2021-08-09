FROM debian:buster
EXPOSE 8080

RUN apt update -y && apt install -y gnupg wget openjdk-11-jre && \
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - && \
    echo "deb https://pkg.jenkins.io/debian binary/" > /etc/apt/sources.list.d/jenkins.list && \
    apt update && \
    apt install jenkins -y && \
    service jenkins start && \
    touch start.sh && \
    chmod +x start.sh

RUN echo '\
#!/bin/bash\n\
service jenkins start\n\
tail -F anything\n\
' > start.sh

