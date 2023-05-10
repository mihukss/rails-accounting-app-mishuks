FROM ruby:3.1.2

ARG RAILS_ROOT=/app
RUN apt-get update -qq && apt-get install -y nodejs tzdata imagemagick build-essential nano vim npm

RUN gem install bundler:2.1.4

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock  ./
RUN bundle install --jobs 5

COPY package.json yarn.lock ./
RUN npm install --global yarn
RUN yarn install --frozen-lockfile \
  && yarn cache clean --force --all

COPY . $RAILS_ROOT

ENV PATH=$RAILS_ROOT/bin:${PATH}
