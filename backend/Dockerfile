FROM ruby:2.5.1-alpine

RUN apk update \
&& apk upgrade \
&& apk add --update --no-cache \
build-base curl-dev git postgresql-dev \
yaml-dev zlib-dev nodejs yarn

WORKDIR /srv

COPY Gemfile* /srv/
RUN bundle install

COPY . /srv

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["sh", "entrypoint.sh"]
EXPOSE 8080

CMD ["rails", "server", "-p", "8080", "-b", "0.0.0.0"]