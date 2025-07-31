# weatherapp-infra

## Step 1 Backend setup
This step creates
    - An s3 bucket for terrafrom remote state file
    - A DynamoDB for state file locking

## Deployment
 '''bash

 terraform init
 terraform plan
 terraform apply