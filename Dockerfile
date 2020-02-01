FROM ruby:2.6
RUN mkdir /weatherbird
WORKDIR /weatherbird
COPY Gemfile /weatherbird/Gemfile
COPY Gemfile.lock /weatherbird/Gemfile.lock
RUN bundle install
COPY . /weatherbird

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
