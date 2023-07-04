#!/usr/bin/bash

/usr/bin/echo "Hello, World!" > /tmp/this_is_a_prove_that_deploy_release_task_by_procfile

cd tmp || exit
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
cd aws/dist || exit

AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} ./aws s3 cp /tmp/this_is_a_prove_that_deploy_release_task_by_procfile s3://${AWS_BUCKET_NAME} --region ap-northeast-1

exit 0
