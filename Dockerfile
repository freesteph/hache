FROM ruby:3.4.1-slim

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

CMD ["bundle", "exec", "ruby", "main.rb"]
