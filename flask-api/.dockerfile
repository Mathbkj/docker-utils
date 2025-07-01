# Base Image to buld from
FROM ubuntu:22.04

# apt is the package manager for Linux-based systems
# Here we are using it to update the package list and install python dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
# Set the working directory in the container
WORKDIR /app
# Copy the requirements with the flask dependency to the container
COPY requirements.txt .
# Install the flask lib as specified in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt 
# Expose the port so that the container can communicate with the web interfaces
EXPOSE 5000
# Copy app.py to the container
COPY . .

# Runs the Flask application when the container starts, overriding the default bash
CMD ["python3","app.py"]

# Note: For better performance and practice, you should always consider installing the requirements.txt and then copy the python file.
# This way, docker will cache the layer with the dependencies and will only process a new layer if the requirements.txt changes.
# If there are no changes in the requirements.txt, it will not rebuild the layer, thus speeding up the build process.