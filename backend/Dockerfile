FROM ruby:2.5.1-alpine

RUN apk update \
&& apk upgrade \
&& apk add --update --no-cache \
build-base curl-dev git postgresql-dev \
yaml-dev zlib-dev nodejs yarn

WORKDIR /srv
# ENV RAILS_ENV=production

COPY Gemfile* /srv/
RUN bundle install

COPY . /srv
# RUN bin/rails assets:precompile
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]