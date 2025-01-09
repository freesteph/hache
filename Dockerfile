FROM ruby:3.4.1-slim

RUN apt-get update && apt-get install -y --no-install-recommends firefox-esr build-essential nodejs npm

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY package.json package-lock.json ./

RUN npm i

CMD ["bundle", "exec", "ruby", "main.rb"]
