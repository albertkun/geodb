# Start from the official PostgreSQL image
FROM postgres:latest

# Update the package lists
RUN apt-get update

# Install necessary packages for GDAL, and also Git and wget
RUN apt-get install -y libgdal-dev git wget

# Install Python and necessary packages for PostgreSQL
RUN apt-get install -y python3 python3-pip libpq-dev python3-dev python3-venv

# Set the working directory in the container
WORKDIR /app

# Create a virtual environment and activate it
RUN python3 -m venv venv
ENV PATH="/app/venv/bin:$PATH"

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install Python packages
RUN pip3 install --no-cache-dir -r requirements.txt

# Command to run on container start
CMD ["postgres"]