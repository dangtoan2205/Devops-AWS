Hướng dẫn SSH bằng key pair lên Instance Ubuntu trên AWS

## 1
![image](https://github.com/user-attachments/assets/87a5070e-7155-45b4-abbf-6ae2376cef1e)

Chuột phải vào file .pem -> Chọn Properties 

## 2
![image](https://github.com/user-attachments/assets/a3cebb5b-1468-4f78-8dd9-bcd13db23b7d)

Chọn tab Security -> chọn Advanced

## 3
![image](https://github.com/user-attachments/assets/323cacf5-674e-4925-ab40-8f1b219ef91f)

Bấm chọn Disable inheritance

![image](https://github.com/user-attachments/assets/7c3b3b02-8ccd-4b28-b35c-0aa2fe646a30)

Bấm chọn 

```
Convert inherited permissions into explicit permissions on this object.
```
## 4
![image](https://github.com/user-attachments/assets/ebf2bcfe-6d4d-4509-8c9d-b7016f93d5c1)

Nhấn chọn user -> Remove hết

![image](https://github.com/user-attachments/assets/a41aeb87-616a-4091-9b58-bcda50fb801f)

## 5
![image](https://github.com/user-attachments/assets/a4a21966-43bd-4f74-a834-0cc5ce2cb74d)

Chọn Add 

![image](https://github.com/user-attachments/assets/21482e8a-04fa-4174-8456-2dc158d12f4a)

Chọn Select a principal

![image](https://github.com/user-attachments/assets/82a68978-ba5b-4efe-8570-05d18184f642)

Nhập tên User của máy

Bấm chọn OK

![image](https://github.com/user-attachments/assets/ea0e4843-ebd8-4ed7-814d-3927d9bb9ed7)

Chọn Full control

Chọn Ok

Chọn Apply -> OK -> OK


## 6
```
ssh -i "C:\Users\Toan\test.pem" ubuntu@<Địa chỉ IP của instance>
```
