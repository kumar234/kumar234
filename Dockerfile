#FROM python:3.7-alpine
#WORKDIR /code
#ENV FLASK_APP=webapp.py
#ENV FLASK_RUN_HOST=0.0.0.0
#RUN apk add --no-cache gcc musl-dev linux-headers
#COPY requirements.txt requirements.txt
#RUN pip install -r requirements.txt
#EXPOSE 5000
#COPY . .
#CMD ["flask", "run"]

FROM node:6
COPY package.json .
RUN npm cache clean
RUN npm install
RUN apt-get update
RUN apt-get -y install nodejs
RUN apt-get -y install mysql-server
COPY . .
RUN mysql -u root -p matrimony < matrimony.sql
EXPOSE 4201
CMD ["node" , "app.js"]
