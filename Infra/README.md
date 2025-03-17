# Infrastructure as Code (IaC) with Terraform

## Overview

This repository contains scripts and configuration files for setting up and managing infrastructure using Terraform. It aims to automate the provisioning of cloud resources, ensuring consistency and repeatability across environments.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Directory Structure](#directory-structure)
- [Key Files](#key-files)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before you begin, ensure you have met the following requirements:

- [Terraform](https://www.terraform.io/downloads.html) installed on your machine.
- Access to a cloud provider (e.g., AWS, GCP, Azure) with necessary permissions.
- Basic understanding of Terraform and infrastructure management.

## Getting Started

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```

2. **Initialize Terraform:**

   Run the following command to initialize your Terraform environment:

   ```bash
   terraform init
   ```

3. **Configure your variables:**

   Update the `var.tf` file with your specific configurations such as region, instance types, and other parameters.

4. **Apply the configuration:**

   To create the infrastructure, run:

   ```bash
   terraform apply
   ```

   Review the planned actions and confirm to proceed.

## Directory Structure

```
.
├── backend.tf          # Backend configuration for state management
├── instance.tf         # EC2 instance configuration
├── jenkins-setup.sh    # Jenkins installation script
├── providers.tf        # Provider configurations
├── sec-group.tf        # Security group settings
├── sonarqube-setup.sh  # SonarQube installation script
├── var.tf              # Variable definitions
└── vpc.tf              # VPC configuration
```

## Key Files

- **`backend.tf`**: Configuration for the Terraform backend to manage state files.
- **`instance.tf`**: Defines EC2 instances and their properties.
- **`providers.tf`**: Specifies the cloud providers used in the project.
- **`sec-group.tf`**: Configures security groups for controlling access to resources.
- **`var.tf`**: Contains variable definitions for customization.
- **`jenkins-setup.sh`**: Script to automate Jenkins installation.
- **`sonarqube-setup.sh`**: Script to automate SonarQube installation.
- **`vpc.tf`**: Defines the Virtual Private Cloud settings.

## Usage

Follow the steps in the "Getting Started" section to provision the infrastructure. For any updates or changes, modify the relevant `.tf` files and re-run `terraform apply`.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
