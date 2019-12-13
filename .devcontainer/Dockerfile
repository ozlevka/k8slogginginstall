FROM python:3.6


ENV DEBIAN_FRONTEND=noninteractive

# Or your actual UID, GID on Linux if not the default 1000
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Configure apt and install packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    #
    # Verify git, process tools, lsb-release (common in install instructions for CLIs) installed
    && apt-get -y install git procps lsb-release \
    #
    # Install pylint
    && echo "Install python deps" \
    && pip --disable-pip-version-check --no-cache-dir install pylint ansible awscli \
    #
    # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # [Optional] Add sudo support for non-root user
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    # Install terraform 
    && wget --quiet https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip \
    && unzip terraform_0.12.7_linux_amd64.zip \
    && mv terraform /usr/bin \
    && rm terraform_0.12.7_linux_amd64.zip \
    # Install kubectl
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.14.6/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/bin/ \
    # Install Helm
    && curl -LO https://get.helm.sh/helm-v2.14.3-linux-amd64.tar.gz \
    && tar xvfz helm-v2.14.3-linux-amd64.tar.gz \
    && chmod +x ./linux-amd64/helm \
    && mv ./linux-amd64/helm /usr/bin \
    && rm -rf helm-v2.14.3-linux-amd64.tar.gz linux-amd64\
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
