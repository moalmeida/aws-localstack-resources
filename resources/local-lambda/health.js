// const AWS = require('aws-sdk');

exports.handler = function(event, context) {
    console.log(event);
    return {
        statusCode: 200,
        body: JSON.stringify({"running": "OK"})
    };
};
