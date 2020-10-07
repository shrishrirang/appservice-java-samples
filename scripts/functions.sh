apt install -qqq -y jq

# Usage: set_creds <resource-group-name> <webapp-name>
# Assumes: az login AND az account set -s <subscription-id> have been run already
# Return Value: This will set env variable $cred which can be used for calling zipdeploy, etc
# Example:
# set_creds myrg mysitename
# curl -X POST -u $cred 'https://mysitename.scm.azurewebsites.net/api/zipdeploy' --data-binary @'./test.zip'
set_creds()
{
    response=`az webapp deployment list-publishing-credentials -g $1 --name $2`

    user=`echo $response \
        | jq '.publishingUserName' \
        | sed -e 's/"//g'`

    pass=`echo $response \
        | jq '.publishingPassword' \
        | sed -e 's/"//g'`

    export cred="$user:$pass"
}

# Usage: enable_logging <resource-group-name> <webapp-name>
# Assumes: az login AND az account set -s <subscription-id> have been run already
enable_logging()
{
    az webapp log config -g $1 --name $2 --application-logging filesystem --detailed-error-messages true --docker-container-logging filesystem --failed-request-tracing true --level verbose --web-server-logging filesystem
}

