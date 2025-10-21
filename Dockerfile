# Use an official Ubuntu base image
FROM ubuntu:latest

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install TeX Live (full or specific packages)
RUN apt-get update && \
    apt-get install -y texlive-full fonts-liberation fonts-noto-color-emoji fonts-symbola --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Create workspace directory for volume
RUN mkdir -p /workspace

# Set the working directory inside the container
WORKDIR /data

# Define the default command to run when the container starts
# This example uses latexmk for comprehensive compilation
CMD ["latexmk", "-cd", "-f", "-interaction=batchmode", "-pdf", "main.tex"]
