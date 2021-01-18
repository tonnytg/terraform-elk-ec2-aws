#<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Deploy ELK with Packer and Terraform</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#packer">Build Packer</a></li>
        <li><a href="#terraform">Build Terraform</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#contributing">Contributing</a></li>
  </ol>
</details>


## Prerequisites
1. Será necessário ter o AWS Cli instalado e configurado
_For more examples, please refer to the [Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)_

2. Será necessário ter o Packer instalado
_For more examples, please refer to the [Documentation](https://www.packer.io/downloads)_

3. Será necessário ter o terraform instalado
_For more examples, please refer to the [Documentation](https://www.terraform.io/downloads.html)_


## Installation

#### Packer
1. To build EKL image using packer run below command
    ```
    cd packer
    packer build -var-file=vars.json elk-packer.json
    ```
    Get IAM ID to use on terraform.tfvars

2. To build EC2 image using packer run below command
    ```
    cd packer
    packer build -var-file=vars.json ec2-packer.json
    ```
    Get IAM ID to use on terraform.tfvars


#### Terraform

1. Edit terraform.tfvars with values for example:
    ```
        env             = "dev"
        key_pair_name   = "my-key-pair"                         # Choose an existing key pair

        cidr            = "10.0.0.0/16"                         # Decide your CIDR block
        azs             = ["us-east-1a", "us-east-1b"]
        private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
        public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

        elk_ami_id      = "ami-08707dbbaf59360c7"               # Get AMI ID after run $packer build
        elk_type        = "t2.medium"                           # 4G or greater than

        ec2_ami_id      = "ami-0144a621f6197f9a2"               # Get AMI ID after run $packer build
        ec2_type        = "t2.micro"                            # No hardware needed
    ```



- Run ``terraform init`` to initialize the module.
- You can now run ``terraform plan`` to see how it will work.
- You can now run ``terraform apply`` to deploy your infrastructure



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- CONTACT -->
## Contact

Antonio Thomacelli Gomes - [@tonnytg](https://twitter.com/tonnytg) - tonnytg@gmail.com

Project Link: [https://github.com/tonnytg](https://github.com/tonnytg)