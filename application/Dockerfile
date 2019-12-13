FROM python:3.6

RUN apt-get update 

COPY ./*.py /app/

ENTRYPOINT [ "python", "/app/main.py" ]