FROM node:alpine as builder
WORKDIR './src'
COPY package.json .
RUN npm install
COPY . .
CMD npm run build
#CMD ["npm", "run", "start"]
 
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html