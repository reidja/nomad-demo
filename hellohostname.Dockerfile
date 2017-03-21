FROM python:3-alpine

RUN mkdir /app
COPY hellohostname.py /app/hellohostname.py
RUN chmod +x /app/hellohostname.py
WORKDIR /app

ENV PYTHONUNBUFFERED=1

CMD ["python3", "hellohostname.py"]