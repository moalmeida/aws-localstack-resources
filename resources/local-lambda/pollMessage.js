const AWS = require("aws-sdk");

AWS.config.update({ region: process.env.AWS_REGION });

var DDB = new AWS.DynamoDB({ apiVersion: "2012-08-10" });

exports.handler = function (event, context) {
  console.info(JSON.stringify(event));
  // DDB.putItem(
  //   {
  //     TableName: process.env.MESSAGE_TABLE_NAME,
  //     Item: {
  //       CUSTOMER_ID: { N: "001" },
  //       CUSTOMER_NAME: { S: "Richard Roe" },
  //     },
  //   },
  //   (err, data) => {
  //     if (err) {
  //       console.log("Error", err);
  //     } else {
  //       console.log("Success", data);
  //     }
  //   }
  // );
};
