# GCPTerraform

1| Install Terraform v0.12.0 or later.

2| Open variables.tf and fill in any required variables that don't have a default.
  Run terraform get.
  Run terraform plan.

3| If the plan looks good, run terraform apply. It will take sometime, so keep patience. 
 
4| Deploy a sample application

5| To setup kubectl to access the deployed cluster, run gcloud beta container clusters get-credentials $CLUSTER_NAME --region $REGION --project $PROJECT, where CLUSTER_NAME, REGION and PROJECT correspond to what you set for the input variables.

6| Run kubectl apply -f app/ABC.yml to create a deployment in your cluster.

7| Run kubectl get pods to view the pod status and check that it is ready.

8| Run kubectl get deployment to view the deployment status.

9| Run kubectl port-forward deployment/nginx 8080:80

10| Now you should be able to access your app deployment on http://localhost:8080

11| Destroy the created resources

  If you deployed the sample application, run kubectl delete -f app/ABC.yml.
  Run terraform destroy.
