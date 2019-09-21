FROM ruby:2.6

RUN mkdir -p /app
WORKDIR /app

RUN apt-get update -qq && apt-get install -y \
      imagemagick vim

RUN gem install bundler rubygems-bundler
RUN gem regenerate_binstubs

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install --jobs 4
RUN bundle binstubs rspec-core

ADD . /app

EXPOSE 3000
