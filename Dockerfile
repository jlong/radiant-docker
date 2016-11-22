FROM ruby:1.9

RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y libpq-dev

RUN mkdir /radiant
WORKDIR /radiant

RUN gem install radiant
RUN radiant --database postgresql .

ADD database.yml config/database.yml
ADD gemfile-additions.txt .
RUN cat gemfile-additions.txt >> Gemfile 

RUN bundle install
