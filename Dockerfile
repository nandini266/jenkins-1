#Dockerfile, image, container

FROM python:3.8-slim-buster
ADD . /python-flask
WORKDIR /python-flask
EXPOSE 22
RUN pip install -r requirements.txt
CMD [ "python", "./myapp.py" ]
