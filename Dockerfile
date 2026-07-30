FROM python:3.12-slim

WORKDIR /app

COPY web/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY dr2server/ dr2server/
COPY web/ web/

WORKDIR /app/web

CMD gunicorn server:app --bind 0.0.0.0:$PORT --workers 2
