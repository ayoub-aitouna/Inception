FROM debian:bullseye

RUN apt-get update

RUN apt-get install -y curl gnupg

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash -

RUN apt-get -y install nodejs

RUN npx create-react-app react_app -y

WORKDIR  /react_app

ENTRYPOINT ["npm", "start"]