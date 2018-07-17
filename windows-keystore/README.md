# Certificates in Azure App Service

This directory contains a simple sample demonstrating how a _Java_ app running in Azure App Service can use certificates uploaded from the Azure Portal.

## Pre-requisites

There are two steps involved in making a certificate available to your Azure Web App:
- Upload the certificate (*.pfx / *.cer) from the Azure portal as explained [here](https://docs.microsoft.com/en-us/azure/app-service/app-service-web-tutorial-custom-ssl#upload-your-ssl-certificate).
- Make the uploaded certificate available to your app by defining the `WEBSITE_LOAD_CERTIFICATES` app setting as described [here](https://docs.microsoft.com/en-us/azure/app-service/app-service-web-ssl-cert-load#load-your-certificates).

## Use the certificate in your app

Once the certificate is made available to your app, as described above, you can use the [KeyStore](https://docs.oracle.com/javase/8/docs/api/java/security/KeyStore.html) APIs to access the certificate as demonstrated by [this sample](./index.jsp).
