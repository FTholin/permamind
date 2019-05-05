FROM python:3.6

COPY ./permamind /app

WORKDIR /app/Perma_model

RUN pip3 install -r /app/requirements.txt

EXPOSE 5000

CMD python3.6 ./api.py
