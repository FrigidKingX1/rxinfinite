#!/bin/bash

sudo cp rxinfinite-web.service /etc/systemd/system/
sudo systemctl enable rxinfinite-web
sudo systemctl restart rxinfinite-web
