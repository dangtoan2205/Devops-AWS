Hướng dẫn đăng nhập tài khoản git trên ubuntu để thực hiện pull và push lên repo
--------

## 1. Tạo token

1/ Profile -> Settings -> Developer settings -> Personal access tokens -> Tokens (classic)

2/ Chọn Generate new token (classic)

![image](https://github.com/user-attachments/assets/b63fe29f-20c8-4dab-acff-b97e56d16c07)

3/ Đặt Note + các quyền thực thi

![image](https://github.com/user-attachments/assets/c7341c0e-0c84-42d5-bfd5-0edf7a096a12)

4/  Sử dụng Token thay cho mật khẩu

Khi chạy lệnh `git push`, thay vì nhập mật khẩu, bạn sử dụng token:

```
Username for 'https://github.com': vianhcodon20
Password for 'https://vianhcodon20@github.com': <your-personal-access-token>
```

5/ Lưu token trong Git để tránh nhập lại

```
git config --global credential.helper store
```
