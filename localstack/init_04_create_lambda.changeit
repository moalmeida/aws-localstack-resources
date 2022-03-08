BUCKET_NAME=${REGION}-message
BUCKET_KEY=function.zip

#!/bin/sh

echo "########### Creating Cloudformation Lambda ###########"

awslocal cloudformation validate-template --profile localstack \
    --template-body file://lambda/template.yaml

awslocal cloudformation deploy --profile localstack \
    --capabilities CAPABILITY_IAM \
    --template-file lambda/template.yaml \
    --region ${REGION} \
    --stack-name ${STACK_NAME}-lambda \
    --no-fail-on-empty-changeset \
    --parameter-overrides \
        BucketUri=${BUCKET_NAME} \
        BucketKey=${BUCKET_KEY} \
        HealthFunctionName=${FUNCTION_HEALTH_NAME} \
        GenerateMessageFunctionName=${FUNCION_MESSAGE_GENERATE_NAME} \
        PollMessageFunctionName=${FUNCION_MESSAGE_POLL_NAME} \
        ListMessageFunctionName=${FUNCION_MESSAGE_LIST_NAME} \
        MessageQueueArn=${FUNCION_QUEUE_MESSAGE_ARN} \
        MessageQueueUrl=${FUNCION_QUEUE_MESSAGE_URL} \
        MessageTableName=${FUNCION_TABLE_MESSAGE_ARN}

awslocal cloudformation describe-stacks --profile localstack \
    --stack-name ${STACK_NAME}-lambda
