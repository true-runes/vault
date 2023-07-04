#!/usr/bin/bash

/usr/bin/touch /tmp/this_is_a_prove_that_deploy_release_task_by_procfile

AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} aws s3 cp /tmp/this_is_a_prove_that_deploy_release_task_by_procfile s3://${AWS_BUCKET_NAME} --region ap-northeast-1
