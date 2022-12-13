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
RUN mkdir -p /usr/src/app 
WORKDIR /usr/src/app
COPY package.json /usr/src/app
RUN npm cache clean
RUN npm install
COPY . .
CMD ["npm" , "start"]
