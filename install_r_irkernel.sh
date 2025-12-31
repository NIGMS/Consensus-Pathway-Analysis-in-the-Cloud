#!/usr/bin/env bash
set -euo pipefail

# Avoid interactive prompts + avoid restarting services (which kills AML terminals)
export DEBIAN_FRONTEND=noninteractive
export NEEDRESTART_MODE=l

# 1) System packages for R + graphics + networking
sudo -E apt-get update -y

sudo -E apt-get install -y \
  r-base r-base-dev \
  libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev libwebp-dev \
  libcurl4-openssl-dev libssl-dev libxml2-dev

# 2) Install IRkernel + deps into system library (run as root)
sudo R --quiet -e "install.packages(
  c('IRkernel', 'ragg', 'pbdZMQ', 'repr', 'IRdisplay'),
  repos = 'https://cloud.r-project.org/'
)"

# 3) Register Jupyter kernel for this R
R --quiet -e "IRkernel::installspec(
  name = 'r-4.5.2',
  displayname = 'R 4.5.2',
  user = TRUE
)"



