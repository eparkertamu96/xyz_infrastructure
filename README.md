# XYZ Infrastructure

This project contains the infrastructure for the XYZ project. This project deploys the XYZ FastAPI API application to and AWS EKS Cluster using EKS Blueprints.

## Requiremenst
This project has the following requirements.
- Linux (Ubuntu, specifically version 22)
- NodeJS
- AWS CLI and CDK
- An AWS Account in which a user or role has the permissions to deploy and manage an EKS cluster and associated serivces.

## Steps to deploy
In order to deploy the XYZ application to a new AWS EKS Cluster, follow the steps below.

Much of this project was based upon the AWS EKS Blueprints Quick Start project, so use it as a reference if needed. https://aws-quickstart.github.io/cdk-eks-blueprints/getting-started/

1) Clone the project locally.

2) Install nodejs if not already installed.
```sudo npm install nodejs```
3) Install the AWS CLI if not already installed. Here is a link for instructions. https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

4) Install the AWS CDK.
```npm install -g aws-cdk```

5) Install the necessary npm modules. Execute the following command in the root directory of the project.
```npm install```

6) Bootstrap your AWS account if you have not already done so. (Sudo may be required.)
```cdk bootstrap aws://<your-account-number>/<region-to-bootstrap>```

7) Execute the deploy.sh bash script.
```sudo bash deploy.sh```

If everything works correctly, you should see the following message displayed in your command window.
"Passed: The message matches!""

## Tear Down
When you are ready to tear down all of the infrastructure, you can execute the following commands and it will remove all AWS infrastructure, EXCEPT what was created during the Bootstrap setup. (Sudo may be needed.)

```kubectl delete -f xyz_config.yaml```
```cdk destroy```

It is possible that some items may not delete properly so manual deletion of CloudFormation Stacks may be required.