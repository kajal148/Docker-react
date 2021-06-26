FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

#run phase

FROM nginx
EXPOSE 80 
#mapping ^ ports for incoming requests

COPY --from=builder /app/build /usr/share/nginx/html
