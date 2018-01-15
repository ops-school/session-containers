FROM ubuntu:latest
RUN apt-get update
RUN apt-get install ruby -y
ADD consulupdater.rb consulupdater.rb
CMD ["ruby", "consulupdater.rb"]
