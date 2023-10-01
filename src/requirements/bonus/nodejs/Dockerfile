FROM debian:bookworm

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nodejs
RUN apt-get -y install npm
RUN npx create-react-app my-react-app -y

WORKDIR  my-react-app

ENTRYPOINT ["npm", "start"]