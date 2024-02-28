# Use the official Ruby image as the base image
FROM ruby:latest

# Set the working directory in the container
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    libicu-dev \
    zlib1g-dev \
    libsqlite3-dev \
    nodejs

# Clone the Gollum repository
RUN git clone https://github.com/gollum/gollum.git .

# Install Gollum and required gems
RUN bundle install

# Expose port 2027 for Gollum web interface
EXPOSE 2027

# Set default command to run Gollum
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "2027"]

