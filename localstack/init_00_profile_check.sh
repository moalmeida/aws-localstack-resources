#!/bin/sh

echo "########### Creating profile ###########"

aws configure set aws_access_key_id ACCESS_KEY_ID --profile localstack
aws configure set aws_secret_access_key SECRET_ACCESS_KEY --profile localstack
aws configure set region us-east-1 --profile localstack

export AWS_PROFILE="localstack"
export AWS_PAGER=


echo "########### Checking Resources ##########"

awslocal dynamodb list-global-tables --profile localstack 
awslocal dynamodb list-tables --profile localstack 
awslocal sqs list-queues --profile localstack
awslocal lambda list-functions --profile localstack

