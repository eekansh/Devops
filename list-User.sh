#!/bin/bash

# Replace these with your repository details
GITHUB_TOKEN=""
OWNER=""
REPO=""

# Fetch the list of collaborators
response=$(curl -s -H "Authorization: token $GITHUB_TOKEN" \
                -H "Accept: application/vnd.github.v3+json" \
                "https://api.github.com/repos/$OWNER/$REPO/collaborators")

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "jq is required but it's not installed. Please install jq."
    exit 1
fi

# Filter users with read access (pull permission)
echo "Users with read access:"
echo "$response" | jq -r '.[] | select(.permissions.pull == true) | .login'

