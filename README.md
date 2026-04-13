# Travel-Memory
# Objective:
Gain practical experience in deploying a MERN stack application on AWS using infrastructure automation with Terraform and configuration management with Ansible.

---

## Traffic flow Architecture Design.

https://github.com/predatordev1/Travel-Memory/blob/main/Travel%20memory.drawio

<img width="700" height="730" alt="Travel Memory" src="https://github.com/user-attachments/assets/f1609956-5349-4a5e-b7a0-bcadee94613d" />

---

## Architecture :

| Service | Port | Description |
| --- | --- | --- |
| Frontend | 3000 | To Acess the main page of Website using ALB url |
| Backend | 3001 | Backend will be running using 3001 port and will communicate with Frontend |

## File structure:

---

# Part 1: Infrastructure Setup with Terraform

 - ## AWS Setup and Terraform Initialization:
     - ## Configure AWS CLI and authenticate with your AWS account.
    
        <img width="657" height="249" alt="image" src="https://github.com/user-attachments/assets/4d2e6b3c-154d-43c1-a59c-8280379c2cce" />

     - ## Initialize a new Terraform project targeting AWS.
  
        - First clone the repo and create all required files of Terraform :
          ```bash
          git clone https://github.com/predatordev1/Travel-Memory.git
          cd Travel-Memory
          mkdir Terraform
          cd  Terraform
          touch main.tf output.tf version.tf variable.tf providers.tf terraform.tfvars
      
          ```
        - Edit provider.tf file and configure providers details alaong with version.
  
          ```bash
    
          terraform {
            required_providers {
              aws = {
                source = "hashicorp/aws"
                version = "6.33.0"
              }
            }
          }
    
          ```
        - After editing above file save and run below command to initialize the terraform .
          ```bash
    
            terraform init
          
          ```
          <img width="811" height="467" alt="image" src="https://github.com/user-attachments/assets/b2573367-4440-48c7-a5fd-fbc48dfa2e70" />
          <img width="1567" height="957" alt="image" src="https://github.com/user-attachments/assets/c72ab233-50a6-4f87-8033-f1a6ea344093" />
        
- ## VPC and Network Configuration: Write all terraform codes for creation of all required resources as per below steps:

  ```bash  
      Create an AWS VPC with two subnets: one public and one private.
      Set up an Internet Gateway and a NAT Gateway.
      Configure route tables for both subnets.
  ```

  - Create an AWS VPC with two subnets: one public and one private.

    <img width="858" height="752" alt="image" src="https://github.com/user-attachments/assets/91044494-fc9f-4573-b08b-0cab7667b2dc" />

  - Set up an Internet Gateway and a NAT Gateway.

    <img width="897" height="741" alt="image" src="https://github.com/user-attachments/assets/2d61cffb-a131-4a03-a105-afbc215cd638" />

  - Configure route tables for both subnets.

    <img width="842" height="510" alt="image" src="https://github.com/user-attachments/assets/2d0be72b-3940-49e7-8f57-214c375b3d53" />

- ## Security Groups and IAM Roles:
    - EC2 Security Group
      - Frontend security group
        
        <img width="896" height="763" alt="image" src="https://github.com/user-attachments/assets/748cce00-dfef-457a-9d2f-2499392346b8" />
      
      - Backend security group
        
        <img width="1106" height="655" alt="image" src="https://github.com/user-attachments/assets/cee97577-8bd0-474a-9f9a-cc454dd8efee" />
      
- ## EC2 Instance Provisioning:
  <img width="1027" height="831" alt="image" src="https://github.com/user-attachments/assets/33a7c3f1-bf7c-4646-b4be-397c570accd4" />

- ## Resource Output:
  <img width="949" height="861" alt="image" src="https://github.com/user-attachments/assets/28a5f885-7ddd-4bf8-aebf-d32206e57a51" />

 - ## Now time to Create all resources :
   ```bash  
      Create resources using Terraform script.
      terraform validate
      terraform plan
      terraform apply

   ```

   <img width="968" height="409" alt="image" src="https://github.com/user-attachments/assets/dda16406-1721-4654-ac83-0ca8829e3e88" />



# Part 2: Configuration and Deployment with Ansible


   
