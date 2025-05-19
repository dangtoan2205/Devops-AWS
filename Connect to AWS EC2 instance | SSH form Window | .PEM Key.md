How to Connect to AWS EC2 instance | SSH form Window | .PEM Key.md
-----------------------------

## Step 1:

EC2 -> Add `Key Pairs`

Name -> RSA -> .pem -> download 

## Step 2

```
terraform init
```

```
terraform plan
```

```
terraform apply
```

`terraform destroy`

## Step 3:

CMD -> Run Administrator

```
ssh -i D:\AWS\1\key-ssh.pem ec2-user@54.234.46.144
```

## Step 4:

EC2 -> Instance -> Instance project -> Serurity group-> Edit Inbound rules

![image](https://github.com/user-attachments/assets/794402bd-0ed9-4d32-ae37-63a6cf25770d)
