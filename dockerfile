FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Set locale to avoid GUI issues
RUN apt-get update && apt-get install -y locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

# Install essential utilities, GUI, and fonts
RUN apt-get update && apt-get install -y \
    tzdata wget curl gnupg lsb-release software-properties-common \
    build-essential nano gedit unzip git x11-apps dbus-x11 \
    libx11-dev libgtk-3-0 libxss1 libgconf-2-4 libnss3 libasound2 \
    libatk-bridge2.0-0 libxrandr2 libgbm1 xdg-utils libxdamage1 \
    libxcomposite1 libglu1-mesa libgl1-mesa-glx \
    libcanberra-gtk-module libcanberra-gtk3-module \
    fonts-dejavu fonts-liberation fonts-freefont-ttf \
    sudo --no-install-recommends

# Create non-root user 'devuser' and grant sudo access
RUN useradd -ms /bin/bash devuser && \
    echo 'devuser:123456' | chpasswd && \
    usermod -aG sudo devuser

# Install MySQL and PostgreSQL
RUN apt-get install -y mysql-server mysql-client \
    postgresql postgresql-contrib

# Install Google Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get install -y ./google-chrome-stable_current_amd64.deb && \
    rm google-chrome-stable_current_amd64.deb

# Install Dia (Diagram Editor)
RUN apt-get install -y dia

# Install VS Code
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list && \
    apt-get update && apt-get install -y code

# Install OpenJDK 11
RUN apt-get install -y openjdk-11-jdk

# Set JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Create directory for JDBC drivers
RUN mkdir -p /home/devuser/jdbc

# Install JDBC Driver for MySQL
RUN wget -P /home/devuser/jdbc https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.26.tar.gz && \
    tar -xzvf /home/devuser/jdbc/mysql-connector-java-8.0.26.tar.gz -C /home/devuser/jdbc && \
    rm /home/devuser/jdbc/mysql-connector-java-8.0.26.tar.gz

# Install JDBC Driver for PostgreSQL
RUN wget -P /home/devuser/jdbc https://jdbc.postgresql.org/download/postgresql-42.2.23.jar

# Install Eclipse Installer
RUN wget https://download.eclipse.org/oomph/epp/2021-12/R/eclipse-inst-linux64.tar.gz && \
    tar -xvzf eclipse-inst-linux64.tar.gz -C /home/devuser && \
    rm eclipse-inst-linux64.tar.gz

# Fix permissions for devuser
RUN chown -R devuser:devuser /home/devuser

# Switch to non-root user
USER devuser
WORKDIR /home/devuser

# Expose DB ports
EXPOSE 3306 5432

# Default shell
CMD ["bash"]
