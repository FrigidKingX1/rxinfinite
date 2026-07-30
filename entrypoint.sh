#!/bin/sh
PORT=${PORT:-8080}
exec gunicorn server:app --bind 0.0.0.0:$PORT --workers 2
