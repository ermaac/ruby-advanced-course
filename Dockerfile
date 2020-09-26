FROM ruby:2.6.6-alpine

WORKDIR /opt/app
COPY . ./

RUN gem update --system && gem install bundler --no-document && \
      bundle install --jobs $(nproc) --retry 5 --without development test --path cache/
RUN addgroup -S app && adduser -S -G app app
RUN chown -R app:app /opt/app
USER app

ENTRYPOINT [ "bundle", "exec" ]
CMD [ "rackup", "--host=0.0.0.0", "config.ru", "-p", "4567" ]
