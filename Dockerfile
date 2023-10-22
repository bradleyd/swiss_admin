FROM ruby:3.2.2-slim-bullseye


COPY ./ ./

RUN apt install git -y; bundle
RUN rake test
