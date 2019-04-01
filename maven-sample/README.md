# Sample demonstrating deployment to Azure using Maven

## Pre-requisites

1. Install the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest) 
2. Open command prompt and run `az login`

## Setup

1. Open pom.xml, locate the `azure-webapp-maven-plugin` plugin section
2. Edit the resource group, region, linuxRuntime, etc as per your requirements
3. [Optional] Define the `APPINSIGHTS_INSTRUMENTATIONKEY` environment variable with the appropriate value if you plan to use App Insights

## Build and deploy to Azure

To deploy to the resource group, etc configured in the pom.xml, run the following command:

```
mvn clean package azure-webapp:deploy
```
