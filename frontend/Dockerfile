FROM node:16

RUN mkdir /frontend
COPY . /frontend

WORKDIR /frontend

RUN yarn

CMD ["yarn", "serve", "--port", "3000"]