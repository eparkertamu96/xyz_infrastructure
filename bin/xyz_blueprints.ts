import 'source-map-support/register';
import * as cdk from 'aws-cdk-lib';
import * as blueprints from '@aws-quickstart/eks-blueprints';

const app = new cdk.App();

// AddOns for the cluster.
const addOns: Array<blueprints.ClusterAddOn> = [
    new blueprints.addons.ArgoCDAddOn,
    // new blueprints.addons.CalicoAddOn,
    // new blueprints.addons.MetricsServerAddOn,
    // new blueprints.addons.ClusterAutoScalerAddOn,
    // new blueprints.addons.ContainerInsightsAddOn,
    new blueprints.addons.AwsLoadBalancerControllerAddOn()
    //new blueprints.addons.VpcCniAddOn(),
    // new blueprints.addons.CoreDnsAddOn(),
    //new blueprints.addons.KubeProxyAddOn(),
    // new blueprints.addons.XrayAddOn()
];

const account = process.env.AWS_ACCOUNT_NUMBER;
const region = process.env.AWS_REGION;

const stack = blueprints.EksBlueprint.builder()
    .account(account)
    .region(region)
    .addOns(...addOns)
    .build(app, 'eks-blueprint');
// do something with stack or drop this variable
const b = stack.getClusterInfo();