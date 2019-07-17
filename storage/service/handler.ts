import { APIGatewayProxyHandler } from 'aws-lambda';
import { RDSDataService } from 'aws-sdk';
import 'source-map-support/register';


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
  const tenantId = 
  const params = {
    resourceArn: 'arn:aws:rds:us-east-1:825465353745:cluster:tenant-management', /* required */
    secretArn: 'arn:aws:secretsmanager:us-east-1:825465353745:secret:test/tenant-management/db-7iV4iC', /* required */
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
      '14bc7cf1-ae68-4621-b88e-8a0c7706b04d',
      'NovaTeam',
      'premium',
      '14bc7cf1-ae68-4621-b88e-8a0c7706b04d',
      'admin'
    );`, /* required */
  };
  rdsDataService.executeStatement(params, function (err, data) {
    if (err) console.log(err, err.stack); // an error occurred
    else console.log(data);           // successful response
  });

  return {
    statusCode: 200,
    body: JSON.stringify({
      message: 'Go Serverless Webpack (Typescript) v1.0! Your function executed successfully!',
      input: event,
    }, null, 2),
  }
}
