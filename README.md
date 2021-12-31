# Rails on Docker

2022.01.01（年越し開発）

## Note

* 新規RailsをDockerで作成（8度目くらいのリトライ、いつもどこかで改修出来ないバグが出る）
* 環境
  + M1 Mac
  + Homebrew、rbenv、nodenv->voltaなどは設定済

## Tree Now

```
.
├── Dockerfile
├── Gemfile
├── Gemfile.lock（カラファイル）
├── README.md（This）
└── docker-compose.yml
```

### Gemfile

* Railsバージョン指定

```ruby
source 'https://rubygems.org'
gem 'rails' '5.2.6'
```

### Dockerfile

* Rubyバージョン指定
* ubuntuでRunの指定
* 作成フォルダパス
* 開発パス
* LocalとDockerの受け渡し

```Dockerfile
FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
```

### docker-compose.yml

* 開発IPパス
* DB領域
  + パス
  + SQL
  + password

```yml
version: '3'
services:
  web:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/app
    ports:
      - 3000:3000
    depends_on:
      - db
    tty: true
    stdin_open: true
  db:
    image: mysql:5.7
    volumes:
      - db-volume:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: password
volumes:
  db-volume:
```

---

# Rails作成

## Step-1

```
docker-compose run web rails new . -force --database=mysql
```
