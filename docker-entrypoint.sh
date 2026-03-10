#!/bin/bash
set -e

# Configure git credentials if GIT_TOKEN is provided
if [ -n "$GIT_TOKEN" ] && [ -n "$GIT_USER" ]; then
    git config --global credential.helper store
    echo "https://${GIT_USER}:${GIT_TOKEN}@github.com" > ~/.git-credentials
    chmod 600 ~/.git-credentials
    echo "Git credentials configured for ${GIT_USER}"
fi

# Configure git user if not set
git config --global user.email "${GIT_EMAIL:-bot@example.com}"
git config --global user.name "${GIT_NAME:-Claude Bot}"

exec "$@"
