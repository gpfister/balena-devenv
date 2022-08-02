FROM gpfister/base-devenv:20.04-0.2.0

# Versions
ENV NODE_VERSION="12.x"
ENV NPM_VERSION="6.14.17"
ENV ANGULAR_VERSION="14.1.0"
ENV BALENA_CLI_VERSION="13.10.0"

USER root

# Update all
RUN apt-get update && \
    apt-get full-upgrade -y && \
    apt-get autoremove -y && \
    apt-get autoclean

# Install node
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION} | bash - && \
    apt-get install -y nodejs && \
    apt-get autoclean -y && \
    apt-get autoremove -y

# Update npm
RUN npm i -g --unsafe-perm npm@${NPM_VERSION} @angular/cli@${ANGULAR_VERSION} balena-cli@${BALENA_CLI_VERSION}

# Install development tools
RUN apt-get update && \
    apt-get install -y -o DPkg::Options::=--force-confdef git && \
    apt-get autoclean -y && \
    apt-get autoremove -y

USER vscode
WORKDIR /home/vscode
