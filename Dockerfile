FROM ruby:2.5.1

ARG RAILS_ENV
ARG RAILS_MASTER_KEY

ENV APP_ROOT /app
ENV RAILS_ENV ${RAILS_ENV}
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}

WORKDIR $APP_ROOT

ADD Gemfile $APP_ROOT
ADD Gemfile.lock $APP_ROOT

RUN \
  bundle install && \
  rm -rf ~/.gem
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install nodejs -y --no-install-recommends
RUN apt-get install vim -y --no-install-recommends
RUN apt-get install libsox-fmt-all sox -y --no-install-recommends

ADD . $APP_ROOT

RUN if ["${RAILS_ENV}" = "production"]; then bundle exec rails assets precompile; else export RAILS_ENV=development; fi

EXPOSE 3000
CMD bundler && rails server -b 0.0.0.0; fi
