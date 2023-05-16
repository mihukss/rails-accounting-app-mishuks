FROM ruby:3.1.3

ARG RAILS_ROOT=/app 
RUN apt-get update -qq && apt-get install -y --no-install-recommends tzdata imagemagick build-essential nano vim
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -\
  && apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
  && apt-get upgrade -qq \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

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
