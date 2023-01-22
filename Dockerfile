#master test pipeline
# stage 1
From node:latest as node
# create working directory in the pod that contains node
RUN mkdir -p /app
#change the workdirectory to the /app
WORKDIR /app
#copy all files in existence directory to the /app
COPY . /app
#intall npm on the working directory ==> /app
RUN npm install --force
# run npm build in the working directory
RUN npm run build  

# stage 2

FROM nginx:alpine

#copy the build file on the container nginx under /usr/share/nginx/html

COPY --from=node /app/dist/angular-app/ /usr/share/nginx/html

