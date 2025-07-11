#!/bin/bash

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repositor
function list_users_with_read_access {
    local owner="$1"
    local repo="$2"
    local endpoint="repos/${owner}/${repo}/collaborators"

    echo "Calling: ${API_URL}/${endpoint}"  # for debugging

    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${owner}/${repo}."
    else
        echo "Users with read access to ${owner}/${repo}:"
        echo "$collaborators"
    fi
}


# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access "$REPO_OWNER" "$REPO_NAME"
