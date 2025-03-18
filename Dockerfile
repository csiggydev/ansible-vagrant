# Jammy Image
FROM ubuntu:22.04

# Inject JHA NetSkope Signed Certificates
COPY /certificates/* /usr/local/share/ca-certificates/
COPY /certificates/* /etc/ssl/certs/

# Bootstrap binaries (sudo unnecessary)
RUN apt update
RUN apt install -y ca-certificates
RUN update-ca-certificates
RUN apt install -y software-properties-common
RUN apt install -y python3 curl telnet openssh-server

# SSH
EXPOSE 22

ENTRYPOINT service ssh start && bash