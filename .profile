./heroku_release_script.sh

# $ heroku run bash する度に実行されることを防ぎ、デプロイ時だけ実行されるようにする
mv .profile .profile.bak
