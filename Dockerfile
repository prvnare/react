# here we are just building the Production required files 
FROM node:16-alpine as buildphase
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# serves as the production grade server by copiying the files from the buildphase
FROM nginx
COPY --from=buildphase /usr/app/build  /usr/share/nginx/html