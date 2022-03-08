#!/bin/sh

echo "############# Checking Resources ###########"

awslocal dynamodb list-global-tables --profile localstack 
awslocal dynamodb list-tables --profile localstack 
awslocal sqs list-queues --profile localstack
awslocal lambda list-functions --profile localstack

