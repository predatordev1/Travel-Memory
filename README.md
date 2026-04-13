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
  - ## Ansible Configuration:
    ```bash  
      ansible --version

    ```
    <img width="1337" height="250" alt="image" src="https://github.com/user-attachments/assets/d8ea8b20-e376-40ca-8ed4-9f4b746ca1bd" />
    <img width="1205" height="356" alt="image" src="https://github.com/user-attachments/assets/584c2c7e-7381-4e76-a7e9-f02f483d8a11" />

 - ## Web Server Setup:
    - Written an Ansible playbook to install Node.js and NPM on the web server.
      <img width="1202" height="610" alt="image" src="https://github.com/user-attachments/assets/64f99c30-8ac0-4432-8753-9ca410a4a8cc" />
      <img width="1462" height="526" alt="image" src="https://github.com/user-attachments/assets/04249eb3-2a8c-46bd-8bb3-07d7381a8271" />

    - Cloning of Github Repo in Both Instances
      <img width="1023" height="501" alt="image" src="https://github.com/user-attachments/assets/c29daffa-d913-4261-9766-ab5c644abce7" />
      <img width="1372" height="642" alt="image" src="https://github.com/user-attachments/assets/f7039d21-4382-4402-bd94-f92bba99327c" />

  - ## Database Server Setup:
    - frontend setup
      
      <img width="973" height="602" alt="image" src="https://github.com/user-attachments/assets/0eb62681-ff94-4d40-961b-bdf3aafdaf57" />

    - backend setup

      <img width="935" height="365" alt="image" src="https://github.com/user-attachments/assets/394ac3ff-e3a0-4819-add4-c97281ae6a10" />

   - ## Application Deployment:
     - Frontend deployment:
       
       <img width="978" height="830" alt="image" src="https://github.com/user-attachments/assets/d4e926e9-c4ee-4b2d-bd45-84fe25ab8aa3" />
       <img width="1340" height="645" alt="image" src="https://github.com/user-attachments/assets/17348127-f310-431c-a7f0-1161582e7fd6" />
       <img width="1402" height="962" alt="image" src="https://github.com/user-attachments/assets/9f263222-b492-4863-8e11-8775f99315da" />

     - Backend deployment:

       <img width="1007" height="735" alt="image" src="https://github.com/user-attachments/assets/d10c9757-f007-4e97-b3a0-3c428fc0fa70" />
       <img width="1405" height="522" alt="image" src="https://github.com/user-attachments/assets/05d24d01-a62d-4270-967c-25a0f2f8e103" />
       <img width="1407" height="952" alt="image" src="https://github.com/user-attachments/assets/d6b5bd19-b6f7-4f16-b454-c6b8228847c4" />

Thanks
Author:
Name: Devendra Kumar








   
