#!/bin/sh

echo "########### Creating Cloudformation Queue ###########"

awslocal cloudformation validate-template --profile localstack \
    --template-body file://queue/template.yaml 

awslocal cloudformation deploy --profile localstack \
    --capabilities CAPABILITY_IAM \
    --template-file queue/template.yaml \
    --region ${REGION} \
    --stack-name ${STACK_NAME}-queue \
    --no-fail-on-empty-changeset \
    --parameter-overrides \
        MessageQueueName=${QUEUE_MESSAGE_NAME}

awslocal cloudformation describe-stacks --profile localstack \
    --stack-name ${STACK_NAME}-queue