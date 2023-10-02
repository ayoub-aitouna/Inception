FROM debian:bookworm

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nodejs
RUN apt-get -y install npm
RUN npx create-react-app react_app -y

WORKDIR  /react_app

ENTRYPOINT ["npm", "start"]