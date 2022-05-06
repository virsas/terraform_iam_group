# terraform_iam_group

Terraform module to create IAM Groups with custom policies and members

##  Dependencies

IAM Users - <https://github.com/virsas/terraform_iam_user>

## Files

- Group policies: path ./json/iam_groups/admin.json

``` json
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Effect":"Allow",
      "Action": "*",
      "Resource":"*"
    }
  ]
}
```
the json file has the same name as the role

## Terraform example

``` terraform
##############
# Variable
##############
# Not needed

##############
# Module
##############
module "iam_group_admin" {
  source  = "github.com/virsas/terraform_iam_group"
  name    = "admin"
  members = [ module.iam_user_admin1.name, module.iam_user_admin2.name ]
  region  = "eu-west-1"
}
```
