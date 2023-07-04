# $ heroku run bash するたびに実行されるので、書く内容には注意する
/usr/bin/openssl aes-256-cbc -d -pbkdf2 -in config/postgresql/client.crt.bin -out config/postgresql/client.crt -k "$OPENSSL_DECRYPT_PASSWORD"

/usr/bin/openssl aes-256-cbc -d -pbkdf2 -in config/postgresql/client.key.bin -out config/postgresql/client.key -k "$OPENSSL_DECRYPT_PASSWORD"

/usr/bin/openssl aes-256-cbc -d -pbkdf2 -in config/postgresql/root.crt.bin -out config/postgresql/root.crt -k "$OPENSSL_DECRYPT_PASSWORD"

RAILS_ENV=staging bin/rails db:create
RAILS_ENV=staging bin/rails db:migrate
