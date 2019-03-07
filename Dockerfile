FROM node:latest

RUN npm install -g nodemon

WORKDIR app

ADD package.json .

VOLUME src test

RUN npm install

EXPOSE 3000

CMD ["/bin/bash"]
