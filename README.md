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

## AWS Setup and Terraform Initialization:
  - Configure AWS CLI and authenticate with your AWS account.
    
      <img width="657" height="249" alt="image" src="https://github.com/user-attachments/assets/4d2e6b3c-154d-43c1-a59c-8280379c2cce" />

  - Initialize a new Terraform project targeting AWS.
  
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
      
- VPC and Network Configuration: Write all terraform codes for creation of all required resources as per below steps:

  ```bash  
      Create an AWS VPC with two subnets: one public and one private.
      Set up an Internet Gateway and a NAT Gateway.
      Configure route tables for both subnets.
  ```
   
