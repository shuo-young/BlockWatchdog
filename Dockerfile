FROM ubuntu:22.04

USER root

ENV DEBIAN_FRONTEND=noninteractive

# Install some essentials
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    build-essential \
    libboost-all-dev \
    wget

# Install python3
RUN apt-get install python3-dev python3-pip -y

# Install souffle
RUN wget https://souffle-lang.github.io/ppa/souffle-key.public -O /usr/share/keyrings/souffle-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/souffle-archive-keyring.gpg] https://souffle-lang.github.io/ppa/ubuntu/ stable main" | tee /etc/apt/sources.list.d/souffle.list
RUN apt-get update && apt-get install souffle -y

# Dependencies for Gigahorse output viz
RUN apt-get update && apt-get install -y graphviz
RUN apt-get update && apt-get install -y libssl-dev

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install pydot

# Set up a non-root 'blockwatchdog' user
RUN groupadd -r blockwatchdog && useradd -ms /bin/bash -g blockwatchdog blockwatchdog

RUN mkdir -p /opt/blockwatchdog

# Copy gigahorse project root
COPY . /opt/blockwatchdog/

RUN chown -R blockwatchdog:blockwatchdog /opt/blockwatchdog
RUN chmod -R o+rwx /opt/blockwatchdog

# Switch to new 'gigahorse' user context
USER blockwatchdog

# Souffle-addon bare-minimum make
RUN cd /opt/blockwatchdog/gigahorse-toolchain/souffle-addon && make libsoufflenum.so
RUN cd /opt/blockwatchdog && pip3 install -r requirements.txt

WORKDIR /opt/blockwatchdog

CMD ["-h"]
ENTRYPOINT ["python3", "/opt/blockwatchdog/blockwatchdog.py"]