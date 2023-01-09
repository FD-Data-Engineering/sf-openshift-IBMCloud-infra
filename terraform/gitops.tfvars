######

## gitops_repo_host: The host for the git repository. GitHub, GitHub Enterprise, Gitlab, Bitbucket, Azure DevOps, and Gitea git servers are supported. If the value is left empty then Gitea will be used by default
#gitops_repo_host=""

## gitops_repo_org: The org/group where the git repository exists/will be provisioned. If not will provided the org will default to the username
#gitops_repo_org=""

## gitops_repo_repo: The short name of the repository (i.e. the part after the org/group name)
gitops_repo_repo="-Quickstart-gitops"
