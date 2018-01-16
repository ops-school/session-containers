FROM ubuntu:latest

RUN apt-get update
RUN apt-get install ruby ruby-dev build-essential -y
RUN gem install mongo
ADD coin.rb coin.rb
CMD ["ruby","coin.rb"]
