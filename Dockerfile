FROM ruby:alpine

WORKDIR /work
ADD Gemfile .
RUN apk add --no-cache sqlite sqlite-dev build-base && \
    bundle install