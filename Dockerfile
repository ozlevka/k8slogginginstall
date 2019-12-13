FROM python:3.6


ENV DEBIAN_FRONTEND=noninteractive

# Or your actual UID, GID on Linux if not the default 1000
ARG USERNAME=ubuntu
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Configure apt and install packages
RUN apt-get update \
    #
    # Install python deps
    && echo "Install python deps" \
    && pip --disable-pip-version-check --no-cache-dir install pylint ansible \
    # Install kubectl
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.14.6/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/bin/ \
    # Install Helm
    && curl -LO https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz \
    && tar xvfz helm-v2.14.3-linux-amd64.tar.gz \
    && chmod +x ./linux-amd64/helm \
    && mv ./linux-amd64/helm /usr/bin \
    && rm -rf helm-v2.14.3-linux-amd64.tar.gz linux-amd64 \
    # Create a non-root user 
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app/

USER ${USERNAME}

ENTRYPOINT ["./deploy.sh"]

