FROM ruby:2.3-slim

# Install dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends build-essential nodejs libpq-dev

# Set path
ENV INSTALL_PATH /usr/src/app

# Create directory
RUN mkdir -p $INSTALL_PATH

# Set INSTALL_PATH as our user dir
WORKDIR $INSTALL_PATH

# Copy our Gemfile to container
COPY Gemfile ./

# Install gems
RUN bundle install

# Copy our code to container
COPY . .

# Run server
CMD ["rails", "server", "-b", "0.0.0.0"]
