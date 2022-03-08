BUCKET_NAME=message
BUCKET_KEY=function.zip

#!/bin/sh

echo "########### Creating Cloudformation Bucket ###########"

awslocal cloudformation validate-template --profile localstack \
    --template-body file://bucket/template.yaml

awslocal cloudformation deploy --profile localstack \
    --capabilities CAPABILITY_IAM \
    --template-file bucket/template.yaml \
    --region ${REGION} \
    --stack-name ${STACK_NAME}-bucket \
    --no-fail-on-empty-changeset \
    --parameter-overrides \
        MessageBucketName=${BUCKET_NAME}

awslocal cloudformation describe-stacks --profile localstack \
    --stack-name ${STACK_NAME}-bucket

echo "########### Put Object Bucket ###########"

# zip -qr ${BUCKET_KEY} ./lambda

awslocal s3api put-object --profile localstack \
    --bucket ${REGION}-${BUCKET_NAME} \
    --key ${BUCKET_KEY} \
    --body lambda/${BUCKET_KEY}

awslocal s3api list-objects --profile localstack \
    --bucket ${REGION}-${BUCKET_NAME} 
