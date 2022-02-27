FROM strapi/base

WORKDIR /strapi-be

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn install

COPY . .

ENV NODE_ENV production

RUN yarn build

EXPOSE 1337

CMD ["yarn", "start"]

# docker build -t strapi-be .

# data persistance
# docker run -p 1337:1337 -v strapi-db:/strapi-be/.tmp -it --name strapi-be strapi-be