# Using an already built binary
FROM tedyst/lighthouse
LABEL "com.github.actions.name"="Lighthouse Audit"
LABEL "com.github.actions.description"="Run tests on a webpage via Google's Lighthouse tool"
LABEL "com.github.actions.icon"="check-square"
LABEL "com.github.actions.color"="yellow"

LABEL version="0.1.0"
LABEL repository="https://github.com/jakejarvis/lighthouse-action"
LABEL homepage="https://jarv.is/"
LABEL maintainer="Jake Jarvis <jake@jarv.is>"

# Disable Lighthouse error reporting to prevent prompt
ENV CI=true

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
