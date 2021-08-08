
FROM ruby:2.7.2

RUN mkdir -p /converter
ADD . /converter
WORKDIR /converter
COPY Gemfile /converter/Gemfile
COPY Gemfile.lock /converter/Gemfile.lock
RUN bundle install

CMD bash
