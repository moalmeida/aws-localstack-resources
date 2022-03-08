#!/bin/sh

echo "########### Creating Cloudformation Table ###########"

awslocal cloudformation validate-template --profile localstack \
    --template-body file://table/template.yaml

awslocal cloudformation deploy --profile localstack \
    --capabilities CAPABILITY_IAM \
    --template-file table/template.yaml \
    --region ${REGION} \
    --stack-name ${STACK_NAME}-table \
    --no-fail-on-empty-changeset \
    --parameter-overrides \
        MessageTableName=${TABLE_MESSAGE_NAME}

awslocal cloudformation describe-stacks --profile localstack \
    --stack-name ${STACK_NAME}-table