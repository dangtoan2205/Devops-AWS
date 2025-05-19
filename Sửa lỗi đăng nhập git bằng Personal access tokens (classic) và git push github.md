# how-to-fix


## Step 1:
Win + R

## Step 2:
```
control /name Microsoft.CredentialManager
```
![image](https://github.com/user-attachments/assets/4946f047-817f-45e5-83dc-ad6e4ad6ffe5)

## Step 3:
Chọn Windows Credentials </br>
![image](https://github.com/user-attachments/assets/1ade3705-3258-45a7-88b8-04c74d968067)

## Step 4:
![image](https://github.com/user-attachments/assets/81660e7f-e592-4e51-8bf3-566ca7c838f8)

Remove tài khoản github cũ </br>
![image](https://github.com/user-attachments/assets/a7182b2e-e083-4008-9080-4e93fdb93aac)



Ubuntu
_ _ _ _ _ 

## Step 1
Github -> Settings -> Developer settings -> Personal access tokens

![image](https://github.com/user-attachments/assets/4ae88cc6-737b-4e3e-b68f-4f7633799909)


## Step 2
Tokens (classic) -> Generate new token -> Generate new token (classic)

![image](https://github.com/user-attachments/assets/aa27b748-1dd1-4ac3-97d1-018b124c50a7)

## Step 3
Đặt tên token

![image](https://github.com/user-attachments/assets/b8380222-0307-41cf-914b-91e8bd1d8e64)

Lựa chọn thời gian

![image](https://github.com/user-attachments/assets/13d0f5e7-9ce6-485b-b78b-5a587c40be68)

Chọn các quyền

![image](https://github.com/user-attachments/assets/63e4e931-0459-467c-bea2-c104dfe354ac)

Chọn -> Generate token

![image](https://github.com/user-attachments/assets/5609b30f-7179-4e6d-a8a0-25ce67f56571)

## Step 4
Sao chép token vừa được tạo

![image](https://github.com/user-attachments/assets/89f0a5df-2d3d-4046-abcf-1a9beab2c911)

CMD

```
git remote set-url origin https://<token>@github.com/<name_github>/<repo>
```

```
 git remote set-url origin https://ghp_afafasgagasgasgasadfasf@github.com/toandn/demo_ci
```

![image](https://github.com/user-attachments/assets/466b04fc-3111-4b01-9229-befcd0469612)


```
git add .

git commit -m"add"

git push origin main
```




