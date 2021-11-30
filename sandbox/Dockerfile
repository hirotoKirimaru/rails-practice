FROM ruby:3.0.2

RUN apt-get update -qq 

WORKDIR /rails

COPY Gemfile Gemfile.lock /rails/

ENV BUNDLE_PATH=/usr/local/bundle BUNDLE_APP_CONFIG=/usr/local/bundle BUNDLE_BIN=/usr/local/bundle/bin

RUN bundle install --jobs=4 \
  && mkdir -p /rails/tmp/cache \
  && mkdir -p /rails/tmp/pids \
  && mkdir -p /rails/tmp/sockets

COPY . /rails/

COPY docker/script/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]