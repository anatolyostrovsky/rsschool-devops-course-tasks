#!/bin/bash

curl -sfL https://get.k3s.io | K3S_URL=https://${private_ip_1}:6443 K3S_TOKEN=${token} sh -

