FROM debian:stretch

RUN apt-get update -qq && apt-get install -y transmission-daemon
ENTRYPOINT transmission-daemon --foreground



