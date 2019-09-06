FROM jakejarvis/chrome-headless:latest

LABEL "com.github.actions.name"="Lighthouse Audit"
LABEL "com.github.actions.description"="Run tests on a webpage via Google's Lighthouse tool"
LABEL "com.github.actions.icon"="check-square"
LABEL "com.github.actions.color"="yellow"

LABEL version="0.1.0"
LABEL repository="https://github.com/jakejarvis/lighthouse-action"
LABEL homepage="https://jarv.is/"
LABEL maintainer="Jake Jarvis <jake@jarv.is>"

# Install necessary tools to parse Lighthouse results
RUN apt-get update -qqy && \
    apt-get install -qqy --no-install-recommends jq bc && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Download latest Lighthouse build from npm
# Cache bust to ensure latest version when building the image
ARG CACHEBUST=1
RUN npm install -g lighthouse

# Disable Lighthouse error reporting to prevent prompt
ENV CI=true

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
