FROM node:8
COPY . .
MAINTAINER Deepak Tewatia <deepaktewatia01@gmail.com>

RUN npm install
EXPOSE 8080
CMD ["npm", "run", "serve"]
