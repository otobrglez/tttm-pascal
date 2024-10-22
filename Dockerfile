from ubuntu:latest

run apt-get update -yy && \
	apt-get upgrade -yy && \
	apt-get install -yy vim lazarus
