FROM ubuntu:18.04

COPY install_packages.sh /opt
RUN chmod +x /opt/install_packages.sh && cd /opt && ./install_packages.sh
