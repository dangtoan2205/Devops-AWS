CI /CD
_ _ _ _ _ 


## Step 1:
- Tạo project `demo_ci` và file `index.html`.
- Khởi tạo unitest với các test case.
- Tạo repo mới trên github.
- Chạy câu lệnh sau để git init sang repo `demo_ci`

```
echo "# demo_ci" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/dangtoan2205/demo_ci.git
git push -u origin main
```

```
git add .
git commit -m"upload project"
git push
```

## Step 2:
- Cấu hình CI/CD -> Actions
- Dự án hiện tại đang chạy là Laravel
![image](https://github.com/user-attachments/assets/39b43b58-07a4-422d-b985-4ee6b362bb8b)

< Chọn Laravel >

< Chọn Configure >

Github sẽ tự tạo cho mình 1 file `laravel.yam` như sau:

```
#Tên workflows
name: Laravel

#Sự kiện nào xảy ra thì nó sẽ chạy workflow này
on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

#Định nghĩa các công việc để nó tự động chạy
jobs:
  #Tên job
  laravel-tests:

    #Máy ảo để workflow chạy
    runs-on: ubuntu-latest

    #Các bước thực hiện để chạy dự án này
    steps:
    - uses: shivammathur/setup-php@15c43e89cdef867065b0213be354c2841860869e
      with:
        php-version: '8.0'
    - uses: actions/checkout@v4
    - name: Copy .env
      run: php -r "file_exists('.env') || copy('.env.example', '.env');"
    - name: Install Dependencies
      #run: composer install -q --no-ansi --no-interaction --no-scripts --no-progress --prefer-dis
      run: composer update
    - name: Generate key
      run: php artisan key:generate
    - name: Directory Permissions
      run: chmod -R 777 storage bootstrap/cache
    - name: Create Database
      run: |
        mkdir -p database
        touch database/database.sqlite
    - name: Execute tests (Unit and Feature tests) via PHPUnit/Pest
      env:
        DB_CONNECTION: sqlite
        DB_DATABASE: database/database.sqlite
      run: php artisan test
```

- Vào project `demo_ci"
```
git pull
```


## Step 4:
Kiểm tra git action hoạt động hay chưa.

- Checkout sang 1 nhánh mới.

```
git checkout -b update2512
```

- Sửa file README.md

- Đẩy lên nhánh `update2512` trên github

```
git add .
git commit -m"add update2512"
git push --set-upstream origin update2512
```

- Sau khi làm mới lại github ta thấy có 1 request từ `update212`
![image](https://github.com/user-attachments/assets/4b6ee8b2-34f2-47b1-a7e4-6328a1b8abe8)

- Sau khi click vào ta sẽ tạo ra 1 cái pull request vào main
![image](https://github.com/user-attachments/assets/4086be7b-6562-49be-b7d5-9ccb09d31b3b)

- Sau khi tạo xong thì sang tab Actions ta sẽ thấy file cấu hình CI github đã được chạy
- ![image](https://github.com/user-attachments/assets/c8d396ad-9ef6-4a38-9405-20c350413e55)
































