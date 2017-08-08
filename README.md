# azure-resource-manager-dse

These are Azure Resource Manager (ARM) templates for deploying DataStax Enterprise (DSE).  If you're new to this, the [DataStax Deployment Guide for Azure](https://github.com/DSPN/azure-deployment-guide) is a good place to start.

Directory | Description
--- | ---
[extensions](./extensions) | Common scripts that are used by all the templates.  In ARM terminology these are referred to as Linux extensions.
[marketplace](./marketplace) | Used by the DataStax Azure Marketplace offer.  This is not intended for deployment outside of the Azure Marketplace.
[multidc](./multidc) | Python to generate an ARM template across multiple data centers and then deploy that.
[singledc](./singledc) | Bare bones template that deploys 1-40 nodes in a single datacenter.

## Deploying DataStax with the Azure CLI

Important Note: To use these deployments scripts, you must first deploy a cluster through Azure Marketplace [here](https://azure.microsoft.com/en-us/marketplace/partners/datastax/datastax-enterprisesingledc/).  This is because these templates use a VM image and the only way to accept the EULA for the image is through the marketplace.  By accepting the EULA once, your Azure subscription becomes enabled to deploy this VM through other methods like the CLI.

Command line deployments can be accomplished using the Azure CLI or Azure PowerShell.  We typically recommend the CLI as it is cross platform and can be used on Windows, Linux and the Mac.  This repo also provides shell scripts that works with the Azure CLI.  Detailed instructions on installing the Azure CLI are available [here](https://azure.microsoft.com/en-us/documentation/articles/xplat-cli-install/).

The youtube video below gives a detailed walkthrough showing how to deploy a DataStax Enterprise cluster using the Azure CLI.

[![IMAGE ALT TEXT](http://img.youtube.com/vi/n0XuCDRZ8bU/0.jpg)](http://www.youtube.com/watch?v=n0XuCDRZ8bU "Deploying DataStax with the Azure CLI")

Post deploy steps can be found at the Azure Deployment Guide [here](https://github.com/DSPN/azure-deployment-guide/blob/master/postdeploy.md).

ADD TEXT
