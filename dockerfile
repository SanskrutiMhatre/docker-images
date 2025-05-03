FROM ubuntu:22.04

# Install necessary tools
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    unzip \
    gedit \
    nano \
    git \
    curl \
    x11-apps \
    libxext-dev \
    libxrender-dev \
    libxtst-dev \
    libxt-dev \
    libgtk-3-dev \
    libasound2 \
    libgl1-mesa-glx \
    libgl1-mesa-dev \
    software-properties-common \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH


# Create the target directory before extraction
RUN mkdir -p /home/devuser && \
    wget https://download.eclipse.org/oomph/epp/2021-12/R/eclipse-inst-linux64.tar.gz && \
    tar -xvzf eclipse-inst-linux64.tar.gz -C /home/devuser && \
    rm eclipse-inst-linux64.tar.gz

ENV PATH="/opt/eclipse:$PATH"

# Install VS Code
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list && \
    apt-get update && apt-get install -y code


# Install Google Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
apt-get install -y ./google-chrome-stable_current_amd64.deb && \
rm google-chrome-stable_current_amd64.deb


# Download and install JavaFX SDK
RUN wget https://download2.gluonhq.com/openjfx/20/openjfx-20_linux-x64_bin-sdk.zip && \
    unzip openjfx-20_linux-x64_bin-sdk.zip -d /opt && \
    rm openjfx-20_linux-x64_bin-sdk.zip

ENV PATH="/opt/javafx-sdk-20/bin:$PATH"
ENV JAVAFX_HOME="/opt/javafx-sdk-20"

# Set working directory
WORKDIR /home/dev

CMD [ "bash" ]
