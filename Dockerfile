FROM node:latest

RUN npm install -g nodemon

WORKDIR app

ADD package.json .

VOLUME src test

RUN npm install

EXPOSE 8080

CMD ["npm", "run", "start"]
