FROM ubuntu:24.04 AS base

# Utils
RUN apt-get update && apt-get install -y htop vim wget busybox

# Build tools
RUN apt-get update && apt-get install -y build-essential cmake python3

# Define ICSC home
ENV ICSC_HOME /opt/icsc-home
WORKDIR $ICSC_HOME

# Get ICSC source code
RUN wget -q https://github.com/intel/systemc-compiler/archive/ed343b83870f3d72ee31abee33d31884bd1b2221.zip
# Unzip and move to icsc folder
RUN busybox unzip -q *.zip && rm *.zip
RUN mv * icsc

# For some reason this file is missing from the zip exports which causes
# an error later.
# https://github.com/intel/systemc-compiler/blob/ed343b83870f3d72ee31abee33d31884bd1b2221/systemc/.gitattributes#L2
RUN wget https://github.com/intel/systemc-compiler/raw/ed343b83870f3d72ee31abee33d31884bd1b2221/systemc/docs/DEVELOPMENT.md -O $ICSC_HOME/icsc/systemc/docs/DEVELOPMENT.md

# Install
RUN ./icsc/install.sh

CMD bash
