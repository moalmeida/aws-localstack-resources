const AWS = require('aws-sdk');

AWS.config.update({ region: process.env.AWS_REGION });

var DDB = new AWS.DynamoDB({apiVersion: '2012-08-10'});

exports.handler = function(event, context) {
    console.log(event);
    return {
        statusCode: 200,
        body: JSON.stringify({"running": "OK"})
    };
};