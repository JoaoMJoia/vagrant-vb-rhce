#!/bin/bash

sudo subscription-manager register --username=******** --password='********'
sudo subscription-manager attach --auto
sudo dnf install python3 -y
