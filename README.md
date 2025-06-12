# Inception

## 📚 概要

Docker を用いて、仮想マシン内で複数のサービスを構築・管理することを通して、仮想化とインフラ構成のスキルを学ぶことが目的です。

## 🧱 プロジェクト構成

本プロジェクトでは、以下のサービスを個別の Docker コンテナで構築します：

- **NGINX**（TLSv1.2 or TLSv1.3）
- **WordPress**（php-fpm）
- **MariaDB**
- **Docker Volumes**（WordPressデータとファイル保存用）
- **Docker Network**（すべてのサービス間通信）

## 📂 ディレクトリ構造

``` 
├── Makefile
├── README.md
└── srcs
    ├── docker-compose.yml
    └── requirements
        ├── mariadb
        │   ├── 50-server.cnf
        │   ├── Dockerfile
        │   ├── docker-entrypoint.sh
        │   └── my.conf
        ├── nginx
        │   ├── Dockerfile
        │   ├── ssl
        │   │   ├── crt.pem
        │   │   ├── passwd
        │   │   └── privkey.pem
        │   └── wordpress.conf
        └── wordpress
            ├── Dockerfile
            ├── php-fpm.conf
            ├── php.ini
            ├── wordpress
            └── wordpress.sh
```

## ⚙️ 使用技術

- Docker / Docker Compose
- Alpine / Debian ベースのイメージ
- TLS 暗号化（NGINX）
- MariaDB / WordPress
- Docker Volumes / Networks
- .envファイルとDocker secretsによるセキュリティ管理

## 🚀 セットアップ方法

1. 仮想マシンを準備（Linux推奨）。
3. `Makefile` を使ってプロジェクトをビルド：
    ```bash
    make
    ```
4. ローカルの `/etc/hosts` に以下を追加（IPはVMのものに応じて変更）：
    ```
    127.0.0.1 resaito.42.fr
    ```

5. ブラウザで https://resaito.42.fr にアクセスして確認。

## 🔒 セキュリティに関する注意

- コンテナは root 以外のユーザーで実行するのが推奨。
- `latest` タグの使用は禁止。
- パスワードは `.env`に保存し、Gitには追加しないこと。(今回は.envファイルを意図的に入れています。)


## 🧼 クリーンアップ

```bash
make down  # docker-compose down
make clean # ボリューム削除など必要に応じて
```
