const AWS = require("aws-sdk");
const { faker } = require("@faker-js/faker");

AWS.config.update({ region: process.env.AWS_REGION });

const SQS = new AWS.SQS({ apiVersion: "2012-11-05" });

exports.handler = (event, context) => {
  SQS.sendMessage(
    {
      MessageAttributes: {
        Email: {
          DataType: "String",
          StringValue: faker.internet.email(),
        },
        Author: {
          DataType: "String",
          StringValue: faker.name.findName(),
        },
        Phone: {
          DataType: "String",
          StringValue: faker.phone.phoneNumber(),
        },
      },
      MessageBody: faker.random.words(),
      QueueUrl: process.env.MESSAGE_QUEUE_URL,
    },
    (err, data) => {
      if (err) {
        console.log("SQS ERROR", err);
      } else {
        console.log("SQS OK", data.MessageId);
      }
    }
  );
};
