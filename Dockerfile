FROM python:3.12-slim

WORKDIR /app

COPY web/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY dr2server/ dr2server/
COPY web/ web/

WORKDIR /app/web

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

CMD ./entrypoint.sh
