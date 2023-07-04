#!/usr/bin/bash
# このファイルがエラーで終わってしまうと .profile がリネームされないので注意する
# かといって全てを強制的に exit 0 するのもどうかと思うが…
# かといって function にするのも大げさ（規模にはよる）

/usr/bin/openssl aes-256-cbc -d -pbkdf2 -in config/postgresql/client.crt.bin -out config/postgresql/client.crt -k "$OPENSSL_DECRYPT_PASSWORD"

/usr/bin/openssl aes-256-cbc -d -pbkdf2 -in config/postgresql/client.key.bin -out config/postgresql/client.key -k "$OPENSSL_DECRYPT_PASSWORD"

/usr/bin/openssl aes-256-cbc -d -pbkdf2 -in config/postgresql/root.crt.bin -out config/postgresql/root.crt -k "$OPENSSL_DECRYPT_PASSWORD"

bin/rails db:create
bin/rails db:migrate

exit 0
