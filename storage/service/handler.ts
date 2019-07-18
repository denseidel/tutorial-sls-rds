import { APIGatewayProxyHandler } from 'aws-lambda';
import { RDSDataService } from 'aws-sdk';
import 'source-map-support/register';
import { v4 as uuid } from 'uuid';



const rdsDataService = new RDSDataService();


export const getTenant: APIGatewayProxyHandler = async (event, _context) => {
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: 'Go Serverless Webpack (Typescript) v1.0! Your function executed successfully!',
      input: event,
    }, null, 2),
  };
}

export const createTenant: APIGatewayProxyHandler = async (event, _context) => {
  const { tenantName, plan }: { tenantName: string, plan: string, userId: string, userRole: string } = JSON.parse(event.body)
  const userId = 'header.userid.from.token'
  const userRole = 'admin'
  const tenantId = uuid()
  const params = {
    includeResultMetadata: true,
    resourceArn: 'arn:aws:rds:us-east-1:825465353745:cluster:tenant-management', /* required */
    secretArn: 'arn:aws:secretsmanager:us-east-1:825465353745:secret:rds-db-credentials/cluster-KWKHBFDPJVS2GNCPHIJEXD46CM/adminx-f1ityo', /* required */
    sql: `insert into
    tenant_management.tenants (
      tenantId,
      tenantName,
      plan,
      userId,
      userRole
    )
  values
    (
      '${tenantId}',
      '${tenantName}',
      '${plan}',
      '${userId}',
      '${userRole}'
    );`, /* required */
  };
  try {
    const dbResult = await rdsDataService.executeStatement(params).promise();
    console.log(dbResult);
    return {
      statusCode: 200,
      body: JSON.stringify({
        dbResult: dbResult
      }, null, 2),
    }
  } catch (e) {
    console.log(e)
    return {
      statusCode: 500,
      body: JSON.stringify({
        error: e
      })
    }
  }


  // rdsDataService.executeStatement(params, function (err, data) {
  //   if (err) console.log(err, err.stack); // an error occurred
  //   else console.log(data);           // successful response
  // });
}
