FROM python:3.4-alpine

RUN adduser -D app
USER app

WORKDIR /home/app

COPY --chown=app:app main.py /home/app/

CMD ["python", "main.py"]
