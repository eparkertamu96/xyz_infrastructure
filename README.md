# Welcome to your CDK TypeScript project

This is a blank project for CDK development with TypeScript.

The `cdk.json` file tells the CDK Toolkit how to execute your app.

## Useful commands

* `npm run build`   compile typescript to js
* `npm run watch`   watch for changes and compile
* `npm run test`    perform the jest unit tests
* `cdk deploy`      deploy this stack to your default AWS account/region
* `cdk diff`        compare deployed stack with current state
* `cdk synth`       emits the synthesized CloudFormation template

First bootstrap your environment if you have not already done so:
cdk bootstrap aws://<your-account-number>/<region-to-bootstrap>

Next, install all of the node modules with the following command

npm install

To tear down the infrastructure, run the following command:
kubectl delete -f xyz_config.yaml
cdk destroy

It is possible that not everything gets deleted. You may have to go into CloudFormation and manually
run the delete command again.