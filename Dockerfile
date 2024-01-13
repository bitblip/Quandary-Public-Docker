FROM centos:7.9.2009

RUN yum install -y gcc gdb make
RUN yum install -y git

# Install java
RUN yum install -y java-1.8.0-openjdk-devel

RUN yum install -y wget
RUN yum install -y wget tar

# Download and extract jflex
RUN wget --no-check-certificate https://jflex.de/release/jflex-1.7.0.tar.gz -P /tmp \
    && tar -xzf /tmp/jflex-1.7.0.tar.gz -C /usr/lib

# Set JFLEX_DIR environment variable
ENV JFLEX_DIR /usr/lib/jflex-1.7.0

# Create a directory for java-cup
RUN mkdir /usr/lib/cup

# Download and extract java-cup
RUN wget http://www2.cs.tum.edu/projects/cup/releases/java-cup-bin-11b-20160615.tar.gz -P /tmp \
    && tar -xzf /tmp/java-cup-bin-11b-20160615.tar.gz -C /usr/lib/cup

# Set CUP_DIR environment variable
ENV CUP_DIR /usr/lib/cup