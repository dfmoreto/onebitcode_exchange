FROM ruby:2.3-slim

# Install dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends build-essential nodejs libpq-dev chrpath libssl-dev libxft-dev wget

# PhantomJS dependencies
RUN apt-get install libfreetype6 libfreetype6-dev libfontconfig1 libfontconfig1-dev

ENV PHANTOM_JS phantomjs-2.1.1-linux-x86_64

# Download PhantomJS
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 -O /tmp/phantomjs.tar.bz2

# Unpack PhantomJS on /usr/local/share
RUN tar xvjf /tmp/phantomjs.tar.bz2 -C /usr/local/share

# Create a link to executable PATH dir
RUN ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

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
CMD puma -C config/puma.rb
