
#!/bin/bash

# Prompt user for GitHub URL
read -p "Enter GitHub URL: " github_url

# Prompt user for branch name
read -p "Enter branch name: " branch_name

# Extract repository name from GitHub URL
repo_name=$(basename "$github_url" | cut -d'.' -f1)

# Check if repository folder exists
if [ -d "~/myfolder/$repo_name/$branch_name" ]; then
    # Folder already exists, prompt user for action
    read -p "Folder ~/myfolder/$repo_name/$branch_name already exists. Do you want to overwrite it? (y/n): " overwrite
    if [ "$overwrite" == "y" ]; then
        rm -rf "~/myfolder/$repo_name/$branch_name"
    else
        echo "Exiting. Duplicate folder already exists."
        exit 1
    fi
fi

# Create the directory
mkdir -p "~/myfolder/$repo_name/$branch_name"

# Clone repository to specified branch
git clone --branch "$branch_name" "$github_url" "~/myfolder/$repo_name/$branch_name"

echo "Repository cloned to ~/myfolder/$repo_name/$branch_name"
