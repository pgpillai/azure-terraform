# azure-terraform
### Instructions

Login to Azure CLI
```
az login
```
### Policy
Connected to Azure CLI, perform the following:

a. Create the Policy Definition
cd to policy
```
az policy definition create --name tagging-policy  --rules tagPolicy.json --param tagPolicyParams.json
```
b. Show the Policy definition
```
az policy definition show --name tagging-policy
```
c. Assign the Policy ( naming "tagging-policy") to the global Scope ( subscription scope in this case)
```
az policy assignment create --name tagging-policy --policy tagging-policy --param tagAssignment.json
```
d. Check the policy was assigned:
```
az policy assignment list
```
### Packer
a. Create a resource group for your image. It will be used as a variable with default value into packer file "server.json" 
```
az group create -l eastus -n azure-infra-rg
```

b. Export ( set) the following variables that will be used in server.json
```
export CLIENT_ID="< client_id value >"
export CLIENT_SECRET="< client_secret >"
export TENANT_ID="< tenant_id >"
export SUBSCRIPTION_ID="< subscription_id > "
```

c. Run the following command to build your server image. 
```
cd infra
packer build server.json

```


### Terraform
The terraform file creates the following resources listed below:

resource group
virtual network
subnet
network security group limiting access ( 4 minimum rules now!!!)
network interfaces
a public ip
load balancer
availability set for the virtual machines
Linux virtual machines (2 by default)
1 managed disk per instance
to do that use the files:

Files	Description
main.tf	Provider and resources
variables.tf	Variables

a. Go to Terraform directory and Run terraform init to prepare your directory for terraform
```
cd infra
pwd
terraform init
```
b. validate the files
```
terraform validate
```
c. to create an execution plan named "solution.plan"
```
terraform plan -out solution.plan
```
d. Create the Infrastructure ( wait some minutes) :
```
terraform apply solution.plan
```
e. You can get as an output result , the URL of the Load balancer Example:

Outputs:
```
app_url = "http://40.71.163.151:8080/"
pgpillai (main *) infra
$ curl http://40.71.163.151:8080/
Hello, udacity World!
```

### Destroying the Resources 
```
terraform destroy
```
```
delete the packer image
az image delete -g azure-infra-rg -n AzureInfraPackerImage
```
