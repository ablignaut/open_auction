FROM ruby:2.4.2-slim-jessie

# Used aptitude
RUN apt-get update \
  && apt-get install -y aptitude nodejs openssl libpq-dev build-essential imagemagick python-software-properties

# make the "pt_BR.UTF-8" locale so postgres will be utf-8 enabled by default
RUN aptitude update \
  && aptitude install -y locales \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i pt_BR -c -f UTF-8 -A /usr/share/locale/locale.alias pt_BR.UTF-8
ENV LANG pt_BR.utf8

# Set an environment variable where the Rails app is installed to inside of Docker image:
ENV RAILS_ROOT /usr/src/app
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# GEMS:
ENV BUNDLER_PATH /usr/lib/bundler
COPY Gemfile Gemfile
RUN bundle install -j 20 --path $BUNDLER_PATH

# Copy the main application.
COPY . $RAILS_ROOT
