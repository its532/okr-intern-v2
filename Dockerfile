FROM ruby:2.7.1

ENV EDITOR=vim
ENV LANG C.UTF-8
RUN apt-get update -qq \
			&& curl -sL https://deb.nodesource.com/setup_12.x | bash -\
			&& apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim \
			&& apt-get clean \
			&& npm install -g n \
			&& n stable \
			&& npm install -g yarn

RUN apt-get install -y cron

RUN mkdir /okr-intern-v2
WORKDIR /okr-intern-v2
COPY Gemfile /okr-intern-v2/Gemfile
COPY Gemfile.lock /okr-intern-v2/Gemfile.lock
RUN bundle install

COPY package.json package.json
COPY yarn.lock yarn.lock
RUN yarn install

COPY . /okr-intern-v2

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
