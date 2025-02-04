//
// Copyright 2010-2023 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSChimeSDKIdentityResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSChimeSDKIdentityResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSChimeSDKIdentityResources

+ (instancetype)sharedInstance {
    static AWSChimeSDKIdentityResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSChimeSDKIdentityResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2021-04-20\",\
    \"endpointPrefix\":\"identity-chime\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"Amazon Chime SDK Identity\",\
    \"serviceId\":\"Chime SDK Identity\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"chime\",\
    \"uid\":\"chime-sdk-identity-2021-04-20\"\
  },\
  \"operations\":{\
    \"CreateAppInstance\":{\
      \"name\":\"CreateAppInstance\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/app-instances\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateAppInstanceRequest\"},\
      \"output\":{\"shape\":\"CreateAppInstanceResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates an Amazon Chime SDK messaging <code>AppInstance</code> under an AWS account. Only SDK messaging customers use this API. <code>CreateAppInstance</code> supports idempotency behavior as described in the AWS API Standard.</p> <p>identity</p>\"\
    },\
    \"CreateAppInstanceAdmin\":{\
      \"name\":\"CreateAppInstanceAdmin\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/app-instances/{appInstanceArn}/admins\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateAppInstanceAdminRequest\"},\
      \"output\":{\"shape\":\"CreateAppInstanceAdminResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Promotes an <code>AppInstanceUser</code> or <code>AppInstanceBot</code> to an <code>AppInstanceAdmin</code>. The promoted entity can perform the following actions. </p> <ul> <li> <p> <code>ChannelModerator</code> actions across all channels in the <code>AppInstance</code>.</p> </li> <li> <p> <code>DeleteChannelMessage</code> actions.</p> </li> </ul> <p>Only an <code>AppInstanceUser</code> and <code>AppInstanceBot</code> can be promoted to an <code>AppInstanceAdmin</code> role.</p>\"\
    },\
    \"CreateAppInstanceBot\":{\
      \"name\":\"CreateAppInstanceBot\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/app-instance-bots\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateAppInstanceBotRequest\"},\
      \"output\":{\"shape\":\"CreateAppInstanceBotResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a bot under an Amazon Chime <code>AppInstance</code>. The request consists of a unique <code>Configuration</code> and <code>Name</code> for that bot.</p>\"\
    },\
    \"CreateAppInstanceUser\":{\
      \"name\":\"CreateAppInstanceUser\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/app-instance-users\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateAppInstanceUserRequest\"},\
      \"output\":{\"shape\":\"CreateAppInstanceUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Creates a user under an Amazon Chime <code>AppInstance</code>. The request consists of a unique <code>appInstanceUserId</code> and <code>Name</code> for that user.</p>\"\
    },\
    \"DeleteAppInstance\":{\
      \"name\":\"DeleteAppInstance\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/app-instances/{appInstanceArn}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteAppInstanceRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes an <code>AppInstance</code> and all associated data asynchronously.</p>\"\
    },\
    \"DeleteAppInstanceAdmin\":{\
      \"name\":\"DeleteAppInstanceAdmin\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/app-instances/{appInstanceArn}/admins/{appInstanceAdminArn}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteAppInstanceAdminRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Demotes an <code>AppInstanceAdmin</code> to an <code>AppInstanceUser</code> or <code>AppInstanceBot</code>. This action does not delete the user.</p>\"\
    },\
    \"DeleteAppInstanceBot\":{\
      \"name\":\"DeleteAppInstanceBot\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/app-instance-bots/{appInstanceBotArn}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteAppInstanceBotRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes an <code>AppInstanceBot</code>.</p>\"\
    },\
    \"DeleteAppInstanceUser\":{\
      \"name\":\"DeleteAppInstanceUser\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/app-instance-users/{appInstanceUserArn}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteAppInstanceUserRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Deletes an <code>AppInstanceUser</code>.</p>\"\
    },\
    \"DeregisterAppInstanceUserEndpoint\":{\
      \"name\":\"DeregisterAppInstanceUserEndpoint\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/app-instance-users/{appInstanceUserArn}/endpoints/{endpointId}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeregisterAppInstanceUserEndpointRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Deregisters an <code>AppInstanceUserEndpoint</code>.</p>\"\
    },\
    \"DescribeAppInstance\":{\
      \"name\":\"DescribeAppInstance\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/app-instances/{appInstanceArn}\"\
      },\
      \"input\":{\"shape\":\"DescribeAppInstanceRequest\"},\
      \"output\":{\"shape\":\"DescribeAppInstanceResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns the full details of an <code>AppInstance</code>.</p>\"\
    },\
    \"DescribeAppInstanceAdmin\":{\
      \"name\":\"DescribeAppInstanceAdmin\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/app-instances/{appInstanceArn}/admins/{appInstanceAdminArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeAppInstanceAdminRequest\"},\
      \"output\":{\"shape\":\"DescribeAppInstanceAdminResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns the full details of an <code>AppInstanceAdmin</code>.</p>\"\
    },\
    \"DescribeAppInstanceBot\":{\
      \"name\":\"DescribeAppInstanceBot\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/app-instance-bots/{appInstanceBotArn}\"\
      },\
      \"input\":{\"shape\":\"DescribeAppInstanceBotRequest\"},\
      \"output\":{\"shape\":\"DescribeAppInstanceBotResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"NotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>The <code>AppInstanceBot's</code> information.</p>\"\
    },\
    \"DescribeAppInstanceUser\":{\
      \"name\":\"DescribeAppInstanceUser\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/app-instance-users/{appInstanceUserArn}\"\
      },\
      \"input\":{\"shape\":\"DescribeAppInstanceUserRequest\"},\
      \"output\":{\"shape\":\"DescribeAppInstanceUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns the full details of an <code>AppInstanceUser</code>.</p>\"\
    },\
    \"DescribeAppInstanceUserEndpoint\":{\
      \"name\":\"DescribeAppInstanceUserEndpoint\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/app-instance-users/{appInstanceUserArn}/endpoints/{endpointId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"DescribeAppInstanceUserEndpointRequest\"},\
      \"output\":{\"shape\":\"DescribeAppInstanceUserEndpointResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns the full details of an <code>AppInstanceUserEndpoint</code>.</p>\"\
    },\
    \"GetAppInstanceRetentionSettings\":{\
      \"name\":\"GetAppInstanceRetentionSettings\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/app-instances/{appInstanceArn}/retention-settings\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetAppInstanceRetentionSettingsRequest\"},\
      \"output\":{\"shape\":\"GetAppInstanceRetentionSettingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Gets the retention settings for an <code>AppInstance</code>.</p>\"\
    },\
    \"ListAppInstanceAdmins\":{\
      \"name\":\"ListAppInstanceAdmins\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/app-instances/{appInstanceArn}/admins\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListAppInstanceAdminsRequest\"},\
      \"output\":{\"shape\":\"ListAppInstanceAdminsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of the administrators in the <code>AppInstance</code>.</p>\"\
    },\
    \"ListAppInstanceBots\":{\
      \"name\":\"ListAppInstanceBots\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/app-instance-bots\"\
      },\
      \"input\":{\"shape\":\"ListAppInstanceBotsRequest\"},\
      \"output\":{\"shape\":\"ListAppInstanceBotsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all <code>AppInstanceBots</code> created under a single <code>AppInstance</code>.</p>\"\
    },\
    \"ListAppInstanceUserEndpoints\":{\
      \"name\":\"ListAppInstanceUserEndpoints\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/app-instance-users/{appInstanceUserArn}/endpoints\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListAppInstanceUserEndpointsRequest\"},\
      \"output\":{\"shape\":\"ListAppInstanceUserEndpointsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all the <code>AppInstanceUserEndpoints</code> created under a single <code>AppInstanceUser</code>.</p>\"\
    },\
    \"ListAppInstanceUsers\":{\
      \"name\":\"ListAppInstanceUsers\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/app-instance-users\"\
      },\
      \"input\":{\"shape\":\"ListAppInstanceUsersRequest\"},\
      \"output\":{\"shape\":\"ListAppInstanceUsersResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>List all <code>AppInstanceUsers</code> created under a single <code>AppInstance</code>.</p>\"\
    },\
    \"ListAppInstances\":{\
      \"name\":\"ListAppInstances\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/app-instances\"\
      },\
      \"input\":{\"shape\":\"ListAppInstancesRequest\"},\
      \"output\":{\"shape\":\"ListAppInstancesResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists all Amazon Chime <code>AppInstance</code>s created under a single AWS account.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/tags\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Lists the tags applied to an Amazon Chime SDK identity resource.</p>\"\
    },\
    \"PutAppInstanceRetentionSettings\":{\
      \"name\":\"PutAppInstanceRetentionSettings\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/app-instances/{appInstanceArn}/retention-settings\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"PutAppInstanceRetentionSettingsRequest\"},\
      \"output\":{\"shape\":\"PutAppInstanceRetentionSettingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Sets the amount of time in days that a given <code>AppInstance</code> retains data.</p>\"\
    },\
    \"PutAppInstanceUserExpirationSettings\":{\
      \"name\":\"PutAppInstanceUserExpirationSettings\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/app-instance-users/{appInstanceUserArn}/expiration-settings\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"PutAppInstanceUserExpirationSettingsRequest\"},\
      \"output\":{\"shape\":\"PutAppInstanceUserExpirationSettingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Sets the number of days before the <code>AppInstanceUser</code> is automatically deleted.</p> <note> <p>A background process deletes expired <code>AppInstanceUsers</code> within 6 hours of expiration. Actual deletion times may vary.</p> <p>Expired <code>AppInstanceUsers</code> that have not yet been deleted appear as active, and you can update their expiration settings. The system honors the new settings.</p> </note>\"\
    },\
    \"RegisterAppInstanceUserEndpoint\":{\
      \"name\":\"RegisterAppInstanceUserEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/app-instance-users/{appInstanceUserArn}/endpoints\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"RegisterAppInstanceUserEndpointRequest\"},\
      \"output\":{\"shape\":\"RegisterAppInstanceUserEndpointResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Registers an endpoint under an Amazon Chime <code>AppInstanceUser</code>. The endpoint receives messages for a user. For push notifications, the endpoint is a mobile device used to receive mobile push notifications for a user.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tags?operation=tag-resource\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Applies the specified tags to the specified Amazon Chime SDK identity resource.</p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/tags?operation=untag-resource\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Removes the specified tags from the specified Amazon Chime SDK identity resource.</p>\"\
    },\
    \"UpdateAppInstance\":{\
      \"name\":\"UpdateAppInstance\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/app-instances/{appInstanceArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateAppInstanceRequest\"},\
      \"output\":{\"shape\":\"UpdateAppInstanceResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates <code>AppInstance</code> metadata.</p>\"\
    },\
    \"UpdateAppInstanceBot\":{\
      \"name\":\"UpdateAppInstanceBot\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/app-instance-bots/{appInstanceBotArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateAppInstanceBotRequest\"},\
      \"output\":{\"shape\":\"UpdateAppInstanceBotResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates the name and metadata of an <code>AppInstanceBot</code>.</p>\"\
    },\
    \"UpdateAppInstanceUser\":{\
      \"name\":\"UpdateAppInstanceUser\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/app-instance-users/{appInstanceUserArn}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateAppInstanceUserRequest\"},\
      \"output\":{\"shape\":\"UpdateAppInstanceUserResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates the details of an <code>AppInstanceUser</code>. You can update names and metadata.</p>\"\
    },\
    \"UpdateAppInstanceUserEndpoint\":{\
      \"name\":\"UpdateAppInstanceUserEndpoint\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/app-instance-users/{appInstanceUserArn}/endpoints/{endpointId}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateAppInstanceUserEndpointRequest\"},\
      \"output\":{\"shape\":\"UpdateAppInstanceUserEndpointResponse\"},\
      \"errors\":[\
        {\"shape\":\"BadRequestException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ForbiddenException\"},\
        {\"shape\":\"ThrottledClientException\"},\
        {\"shape\":\"UnauthorizedClientException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceFailureException\"}\
      ],\
      \"documentation\":\"<p>Updates the details of an <code>AppInstanceUserEndpoint</code>. You can update the name and <code>AllowMessage</code> values.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AllowMessages\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ALL\",\
        \"NONE\"\
      ]\
    },\
    \"AppInstance\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the messaging instance.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name of an <code>AppInstance</code>.</p>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which an <code>AppInstance</code> was created. In epoch milliseconds.</p>\"\
        },\
        \"LastUpdatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time an <code>AppInstance</code> was last updated. In epoch milliseconds.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata of an <code>AppInstance</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of an <code>AppInstance</code>, an instance of an Amazon Chime SDK messaging application.</p>\"\
    },\
    \"AppInstanceAdmin\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Admin\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The <code>AppInstanceAdmin</code> data.</p>\"\
        },\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code> for which the user is an administrator.</p>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which an administrator was created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The name and ARN of the admin for the <code>AppInstance</code>.</p>\"\
    },\
    \"AppInstanceAdminList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AppInstanceAdminSummary\"}\
    },\
    \"AppInstanceAdminSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Admin\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The details of the <code>AppInstanceAdmin</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of the details of an <code>AppInstanceAdmin</code>.</p>\"\
    },\
    \"AppInstanceBot\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceBotArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the AppInstanceBot.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the AppInstanceBot.</p>\"\
        },\
        \"Configuration\":{\
          \"shape\":\"Configuration\",\
          \"documentation\":\"<p>The data processing instructions for an AppInstanceBot.</p>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the <code>AppInstanceBot</code> was created.</p>\"\
        },\
        \"LastUpdatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the <code>AppInstanceBot</code> was last updated.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata for an AppInstanceBot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>An Amazon Lex V2 chat bot created under an <code>AppInstance</code>.</p>\"\
    },\
    \"AppInstanceBotList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AppInstanceBotSummary\"}\
    },\
    \"AppInstanceBotSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceBotArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the AppInstanceBot.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the AppInstanceBox.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata of the AppInstanceBot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>High-level information about an AppInstanceBot.</p>\"\
    },\
    \"AppInstanceList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AppInstanceSummary\"}\
    },\
    \"AppInstanceRetentionSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChannelRetentionSettings\":{\
          \"shape\":\"ChannelRetentionSettings\",\
          \"documentation\":\"<p>The length of time in days to retain the messages in a channel.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of the data-retention settings for an <code>AppInstance</code>.</p>\"\
    },\
    \"AppInstanceSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The <code>AppInstance</code> ARN.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name of the <code>AppInstance</code>.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata of the <code>AppInstance</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of the data for an <code>AppInstance</code>.</p>\"\
    },\
    \"AppInstanceUser\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"UserName\",\
          \"documentation\":\"<p>The name of the <code>AppInstanceUser</code>.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata of the <code>AppInstanceUser</code>.</p>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the <code>AppInstanceUser</code> was created.</p>\"\
        },\
        \"LastUpdatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the <code>AppInstanceUser</code> was last updated.</p>\"\
        },\
        \"ExpirationSettings\":{\
          \"shape\":\"ExpirationSettings\",\
          \"documentation\":\"<p>The interval after which an <code>AppInstanceUser</code> is automatically deleted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of an <code>AppInstanceUser</code>.</p>\"\
    },\
    \"AppInstanceUserEndpoint\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"SensitiveChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\"\
        },\
        \"EndpointId\":{\
          \"shape\":\"SensitiveString64\",\
          \"documentation\":\"<p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SensitiveString1600\",\
          \"documentation\":\"<p>The name of the <code>AppInstanceUserEndpoint</code>.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"AppInstanceUserEndpointType\",\
          \"documentation\":\"<p>The type of the <code>AppInstanceUserEndpoint</code>.</p>\"\
        },\
        \"ResourceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the resource to which the endpoint belongs.</p>\"\
        },\
        \"EndpointAttributes\":{\
          \"shape\":\"EndpointAttributes\",\
          \"documentation\":\"<p>The attributes of an <code>Endpoint</code>.</p>\"\
        },\
        \"CreatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which an <code>AppInstanceUserEndpoint</code> was created.</p>\"\
        },\
        \"LastUpdatedTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which an <code>AppInstanceUserEndpoint</code> was last updated.</p>\"\
        },\
        \"AllowMessages\":{\
          \"shape\":\"AllowMessages\",\
          \"documentation\":\"<p>Boolean that controls whether the <code>AppInstanceUserEndpoint</code> is opted in to receive messages. <code>ALL</code> indicates the endpoint will receive all messages. <code>NONE</code> indicates the endpoint will receive no messages.</p>\"\
        },\
        \"EndpointState\":{\
          \"shape\":\"EndpointState\",\
          \"documentation\":\"<p>A read-only field that represents the state of an <code>AppInstanceUserEndpoint</code>. Supported values:</p> <ul> <li> <p> <code>ACTIVE</code>: The <code>AppInstanceUserEndpoint</code> is active and able to receive messages. When <code>ACTIVE</code>, the <code>EndpointStatusReason</code> remains empty.</p> </li> <li> <p> <code>INACTIVE</code>: The <code>AppInstanceUserEndpoint</code> is inactive and can't receive message. When <code>INACTIVE</code>, the corresponding reason will be conveyed through <code>EndpointStatusReason</code>.</p> </li> <li> <p> <code>INVALID_DEVICE_TOKEN</code> indicates that an <code>AppInstanceUserEndpoint</code> is <code>INACTIVE</code> due to invalid device token</p> </li> <li> <p> <code>INVALID_PINPOINT_ARN</code> indicates that an <code>AppInstanceUserEndpoint</code> is <code>INACTIVE</code> due to an invalid pinpoint ARN that was input through the <code>ResourceArn</code> field.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>An endpoint under an Amazon Chime <code>AppInstanceUser</code> that receives messages for a user. For push notifications, the endpoint is a mobile device used to receive mobile push notifications for a user.</p>\"\
    },\
    \"AppInstanceUserEndpointSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"SensitiveChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\"\
        },\
        \"EndpointId\":{\
          \"shape\":\"SensitiveString64\",\
          \"documentation\":\"<p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"SensitiveString1600\",\
          \"documentation\":\"<p>The name of the <code>AppInstanceUserEndpoint</code>.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"AppInstanceUserEndpointType\",\
          \"documentation\":\"<p>The type of the <code>AppInstanceUserEndpoint</code>.</p>\"\
        },\
        \"AllowMessages\":{\
          \"shape\":\"AllowMessages\",\
          \"documentation\":\"<p>BBoolean that controls whether the <code>AppInstanceUserEndpoint</code> is opted in to receive messages. <code>ALL</code> indicates the endpoint will receive all messages. <code>NONE</code> indicates the endpoint will receive no messages.</p>\"\
        },\
        \"EndpointState\":{\
          \"shape\":\"EndpointState\",\
          \"documentation\":\"<p>A read-only field that represent the state of an <code>AppInstanceUserEndpoint</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of the details of an <code>AppInstanceUserEndpoint</code>.</p>\"\
    },\
    \"AppInstanceUserEndpointSummaryList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AppInstanceUserEndpointSummary\"}\
    },\
    \"AppInstanceUserEndpointType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"APNS\",\
        \"APNS_SANDBOX\",\
        \"GCM\"\
      ]\
    },\
    \"AppInstanceUserList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AppInstanceUserSummary\"}\
    },\
    \"AppInstanceUserSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"UserName\",\
          \"documentation\":\"<p>The name of an <code>AppInstanceUser</code>.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata of the <code>AppInstanceUser</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Summary of the details of an <code>AppInstanceUser</code>.</p>\"\
    },\
    \"BadRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The input parameters don't match the service's restrictions.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ChannelRetentionSettings\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RetentionDays\":{\
          \"shape\":\"RetentionDays\",\
          \"documentation\":\"<p>The time in days to retain the messages in a channel.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of the retention settings for a channel.</p>\"\
    },\
    \"ChimeArn\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":5,\
      \"pattern\":\"arn:[a-z0-9-\\\\.]{1,63}:[a-z0-9-\\\\.]{0,63}:[a-z0-9-\\\\.]{0,63}:[a-z0-9-\\\\.]{0,63}:[^/].{0,1023}\"\
    },\
    \"ClientRequestToken\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":2,\
      \"pattern\":\"[-_a-zA-Z0-9]*\"\
    },\
    \"Configuration\":{\
      \"type\":\"structure\",\
      \"required\":[\"Lex\"],\
      \"members\":{\
        \"Lex\":{\
          \"shape\":\"LexConfiguration\",\
          \"documentation\":\"<p>The configuration for an Amazon Lex V2 bot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that contains configuration data.</p>\"\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request could not be processed because of conflict in the current state of the resource.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"CreateAppInstanceAdminRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceAdminArn\",\
        \"AppInstanceArn\"\
      ],\
      \"members\":{\
        \"AppInstanceAdminArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the administrator of the current <code>AppInstance</code>.</p>\"\
        },\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceArn\"\
        }\
      }\
    },\
    \"CreateAppInstanceAdminResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceAdmin\":{\
          \"shape\":\"Identity\",\
          \"documentation\":\"<p>The ARN and name of the administrator, the ARN of the <code>AppInstance</code>, and the created and last-updated timestamps. All timestamps use epoch milliseconds.</p>\"\
        },\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the of the admin for the <code>AppInstance</code>.</p>\"\
        }\
      }\
    },\
    \"CreateAppInstanceBotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceArn\",\
        \"ClientRequestToken\",\
        \"Configuration\"\
      ],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code> request.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The user's name.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The request metadata. Limited to a 1KB string in UTF-8.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique ID for the client making the request. Use different tokens for different <code>AppInstanceBots</code>.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tags assigned to the <code>AppInstanceBot</code>.</p>\"\
        },\
        \"Configuration\":{\
          \"shape\":\"Configuration\",\
          \"documentation\":\"<p>Configuration information about the Amazon Lex V2 V2 bot.</p>\"\
        }\
      }\
    },\
    \"CreateAppInstanceBotResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceBotArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppinstanceBot</code>.</p>\"\
        }\
      }\
    },\
    \"CreateAppInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Name\",\
        \"ClientRequestToken\"\
      ],\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name of the <code>AppInstance</code>.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata of the <code>AppInstance</code>. Limited to a 1KB string in UTF-8.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique ID of the request. Use different tokens to create different <code>AppInstances</code>.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags assigned to the <code>AppInstance</code>.</p>\"\
        }\
      }\
    },\
    \"CreateAppInstanceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the <code>AppInstance</code>.</p>\"\
        }\
      }\
    },\
    \"CreateAppInstanceUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceArn\",\
        \"AppInstanceUserId\",\
        \"Name\",\
        \"ClientRequestToken\"\
      ],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code> request.</p>\"\
        },\
        \"AppInstanceUserId\":{\
          \"shape\":\"UserId\",\
          \"documentation\":\"<p>The user ID of the <code>AppInstance</code>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"UserName\",\
          \"documentation\":\"<p>The user's name.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The request's metadata. Limited to a 1KB string in UTF-8.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique ID of the request. Use different tokens to request additional <code>AppInstances</code>.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags assigned to the <code>AppInstanceUser</code>.</p>\"\
        },\
        \"ExpirationSettings\":{\
          \"shape\":\"ExpirationSettings\",\
          \"documentation\":\"<p>Settings that control the interval after which the <code>AppInstanceUser</code> is automatically deleted.</p>\"\
        }\
      }\
    },\
    \"CreateAppInstanceUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The user's ARN.</p>\"\
        }\
      }\
    },\
    \"DeleteAppInstanceAdminRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceAdminArn\",\
        \"AppInstanceArn\"\
      ],\
      \"members\":{\
        \"AppInstanceAdminArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>'s administrator.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceAdminArn\"\
        },\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceArn\"\
        }\
      }\
    },\
    \"DeleteAppInstanceBotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AppInstanceBotArn\"],\
      \"members\":{\
        \"AppInstanceBotArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceBot</code> being deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceBotArn\"\
        }\
      }\
    },\
    \"DeleteAppInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AppInstanceArn\"],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceArn\"\
        }\
      }\
    },\
    \"DeleteAppInstanceUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AppInstanceUserArn\"],\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the user request being deleted.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceUserArn\"\
        }\
      }\
    },\
    \"DeregisterAppInstanceUserEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceUserArn\",\
        \"EndpointId\"\
      ],\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"SensitiveChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceUserArn\"\
        },\
        \"EndpointId\":{\
          \"shape\":\"SensitiveString64\",\
          \"documentation\":\"<p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"endpointId\"\
        }\
      }\
    },\
    \"DescribeAppInstanceAdminRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceAdminArn\",\
        \"AppInstanceArn\"\
      ],\
      \"members\":{\
        \"AppInstanceAdminArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceAdmin</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceAdminArn\"\
        },\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceArn\"\
        }\
      }\
    },\
    \"DescribeAppInstanceAdminResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceAdmin\":{\
          \"shape\":\"AppInstanceAdmin\",\
          \"documentation\":\"<p>The ARN and name of the <code>AppInstanceUser</code>, the ARN of the <code>AppInstance</code>, and the created and last-updated timestamps. All timestamps use epoch milliseconds.</p>\"\
        }\
      }\
    },\
    \"DescribeAppInstanceBotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AppInstanceBotArn\"],\
      \"members\":{\
        \"AppInstanceBotArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceBot</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceBotArn\"\
        }\
      }\
    },\
    \"DescribeAppInstanceBotResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceBot\":{\
          \"shape\":\"AppInstanceBot\",\
          \"documentation\":\"<p>The detials of the <code>AppInstanceBot</code>.</p>\"\
        }\
      }\
    },\
    \"DescribeAppInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AppInstanceArn\"],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceArn\"\
        }\
      }\
    },\
    \"DescribeAppInstanceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstance\":{\
          \"shape\":\"AppInstance\",\
          \"documentation\":\"<p>The ARN, metadata, created and last-updated timestamps, and the name of the <code>AppInstance</code>. All timestamps use epoch milliseconds.</p>\"\
        }\
      }\
    },\
    \"DescribeAppInstanceUserEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceUserArn\",\
        \"EndpointId\"\
      ],\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"SensitiveString1600\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceUserArn\"\
        },\
        \"EndpointId\":{\
          \"shape\":\"SensitiveString64\",\
          \"documentation\":\"<p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"endpointId\"\
        }\
      }\
    },\
    \"DescribeAppInstanceUserEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceUserEndpoint\":{\
          \"shape\":\"AppInstanceUserEndpoint\",\
          \"documentation\":\"<p>The full details of an <code>AppInstanceUserEndpoint</code>: the <code>AppInstanceUserArn</code>, ID, name, type, resource ARN, attributes, allow messages, state, and created and last updated timestamps. All timestamps use epoch milliseconds.</p>\"\
        }\
      }\
    },\
    \"DescribeAppInstanceUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AppInstanceUserArn\"],\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceUserArn\"\
        }\
      }\
    },\
    \"DescribeAppInstanceUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceUser\":{\
          \"shape\":\"AppInstanceUser\",\
          \"documentation\":\"<p>The name of the <code>AppInstanceUser</code>.</p>\"\
        }\
      }\
    },\
    \"EndpointAttributes\":{\
      \"type\":\"structure\",\
      \"required\":[\"DeviceToken\"],\
      \"members\":{\
        \"DeviceToken\":{\
          \"shape\":\"NonEmptySensitiveString1600\",\
          \"documentation\":\"<p>The device token for the GCM, APNS, and APNS_SANDBOX endpoint types.</p>\"\
        },\
        \"VoipDeviceToken\":{\
          \"shape\":\"NonEmptySensitiveString1600\",\
          \"documentation\":\"<p>The VOIP device token for the APNS and APNS_SANDBOX endpoint types.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The attributes of an <code>Endpoint</code>.</p>\"\
    },\
    \"EndpointState\":{\
      \"type\":\"structure\",\
      \"required\":[\"Status\"],\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"EndpointStatus\",\
          \"documentation\":\"<p>Enum that indicates the Status of an <code>AppInstanceUserEndpoint</code>.</p>\"\
        },\
        \"StatusReason\":{\
          \"shape\":\"EndpointStatusReason\",\
          \"documentation\":\"<p>The reason for the <code>EndpointStatus</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A read-only field that represents the state of an <code>AppInstanceUserEndpoint</code>. Supported values:</p> <ul> <li> <p> <code>ACTIVE</code>: The <code>AppInstanceUserEndpoint</code> is active and able to receive messages. When <code>ACTIVE</code>, the <code>EndpointStatusReason</code> remains empty.</p> </li> <li> <p> <code>INACTIVE</code>: The <code>AppInstanceUserEndpoint</code> is inactive and can't receive message. When INACTIVE, the corresponding reason will be conveyed through EndpointStatusReason.</p> </li> <li> <p> <code>INVALID_DEVICE_TOKEN</code> indicates that an <code>AppInstanceUserEndpoint</code> is <code>INACTIVE</code> due to invalid device token</p> </li> <li> <p> <code>INVALID_PINPOINT_ARN</code> indicates that an <code>AppInstanceUserEndpoint</code> is <code>INACTIVE</code> due to an invalid pinpoint ARN that was input through the <code>ResourceArn</code> field.</p> </li> </ul>\"\
    },\
    \"EndpointStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVE\",\
        \"INACTIVE\"\
      ]\
    },\
    \"EndpointStatusReason\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INVALID_DEVICE_TOKEN\",\
        \"INVALID_PINPOINT_ARN\"\
      ]\
    },\
    \"ErrorCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"BadRequest\",\
        \"Conflict\",\
        \"Forbidden\",\
        \"NotFound\",\
        \"PreconditionFailed\",\
        \"ResourceLimitExceeded\",\
        \"ServiceFailure\",\
        \"AccessDenied\",\
        \"ServiceUnavailable\",\
        \"Throttled\",\
        \"Throttling\",\
        \"Unauthorized\",\
        \"Unprocessable\",\
        \"VoiceConnectorGroupAssociationsExist\",\
        \"PhoneNumberAssociationsExist\"\
      ]\
    },\
    \"ExpirationCriterion\":{\
      \"type\":\"string\",\
      \"enum\":[\"CREATED_TIMESTAMP\"]\
    },\
    \"ExpirationDays\":{\
      \"type\":\"integer\",\
      \"max\":5475,\
      \"min\":1\
    },\
    \"ExpirationSettings\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ExpirationDays\",\
        \"ExpirationCriterion\"\
      ],\
      \"members\":{\
        \"ExpirationDays\":{\
          \"shape\":\"ExpirationDays\",\
          \"documentation\":\"<p>The period in days after which an <code>AppInstanceUser</code> will be automatically deleted.</p>\"\
        },\
        \"ExpirationCriterion\":{\
          \"shape\":\"ExpirationCriterion\",\
          \"documentation\":\"<p>Specifies the conditions under which an <code>AppInstanceUser</code> will expire.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Determines the interval after which an <code>AppInstanceUser</code> is automatically deleted.</p>\"\
    },\
    \"ForbiddenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The client is permanently forbidden from making the request.</p>\",\
      \"error\":{\"httpStatusCode\":403},\
      \"exception\":true\
    },\
    \"GetAppInstanceRetentionSettingsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AppInstanceArn\"],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceArn\"\
        }\
      }\
    },\
    \"GetAppInstanceRetentionSettingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceRetentionSettings\":{\
          \"shape\":\"AppInstanceRetentionSettings\",\
          \"documentation\":\"<p>The retention settings for the <code>AppInstance</code>.</p>\"\
        },\
        \"InitiateDeletionTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp representing the time at which the specified items are retained, in Epoch Seconds.</p>\"\
        }\
      }\
    },\
    \"Identity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Arn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN in an Identity.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name in an Identity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The details of a user or bot.</p>\"\
    },\
    \"LexBotAliasArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":15,\
      \"pattern\":\"arn:aws:lex:[a-z]{2}-[a-z]+-\\\\d{1}:\\\\d{12}:bot-alias/[A-Z0-9]{10}/[A-Z0-9]{10}\"\
    },\
    \"LexConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RespondsTo\",\
        \"LexBotAliasArn\",\
        \"LocaleId\"\
      ],\
      \"members\":{\
        \"RespondsTo\":{\
          \"shape\":\"RespondsTo\",\
          \"documentation\":\"<p>Determines whether the Amazon Lex V2 bot responds to all standard messages. Control messages are not supported.</p>\"\
        },\
        \"LexBotAliasArn\":{\
          \"shape\":\"LexBotAliasArn\",\
          \"documentation\":\"<p>The ARN of the Amazon Lex V2 bot's alias. The ARN uses this format: <code>arn:aws:lex:REGION:ACCOUNT:bot-alias/MYBOTID/MYBOTALIAS</code> </p>\"\
        },\
        \"LocaleId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the Amazon Lex V2 bot's language and locale. The string must match one of the supported locales in Amazon Lex V2. All of the intents, slot types, and slots used in the bot must have the same locale. For more information, see <a href=\\\"https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html\\\">Supported languages</a> in the <i>Amazon Lex V2 Developer Guide</i>.</p>\"\
        },\
        \"WelcomeIntent\":{\
          \"shape\":\"LexIntentName\",\
          \"documentation\":\"<p>The name of the welcome intent configured in the Amazon Lex V2 bot.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The configuration for an Amazon Lex V2 bot.</p>\"\
    },\
    \"LexIntentName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"^([A-Za-z]_?)+$\"\
    },\
    \"ListAppInstanceAdminsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AppInstanceArn\"],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceArn\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of administrators that you want to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token returned from previous API requests until the number of administrators is reached.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        }\
      }\
    },\
    \"ListAppInstanceAdminsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\"\
        },\
        \"AppInstanceAdmins\":{\
          \"shape\":\"AppInstanceAdminList\",\
          \"documentation\":\"<p>The information for each administrator.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token returned from previous API requests until the number of administrators is reached.</p>\"\
        }\
      }\
    },\
    \"ListAppInstanceBotsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AppInstanceArn\"],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"app-instance-arn\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of requests to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested bots are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        }\
      }\
    },\
    \"ListAppInstanceBotsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the AppInstance.</p>\"\
        },\
        \"AppInstanceBots\":{\
          \"shape\":\"AppInstanceBotList\",\
          \"documentation\":\"<p>The information for each requested <code>AppInstanceBot</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested bots are returned.</p>\"\
        }\
      }\
    },\
    \"ListAppInstanceUserEndpointsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AppInstanceUserArn\"],\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"SensitiveChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceUserArn\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of endpoints that you want to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested endpoints are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        }\
      }\
    },\
    \"ListAppInstanceUserEndpointsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceUserEndpoints\":{\
          \"shape\":\"AppInstanceUserEndpointSummaryList\",\
          \"documentation\":\"<p>The information for each requested <code>AppInstanceUserEndpoint</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested endpoints are returned.</p>\"\
        }\
      }\
    },\
    \"ListAppInstanceUsersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AppInstanceArn\"],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"app-instance-arn\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of requests that you want returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested users are returned.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        }\
      }\
    },\
    \"ListAppInstanceUsersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\"\
        },\
        \"AppInstanceUsers\":{\
          \"shape\":\"AppInstanceUserList\",\
          \"documentation\":\"<p>The information for each requested <code>AppInstanceUser</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API calls until all requested users are returned.</p>\"\
        }\
      }\
    },\
    \"ListAppInstancesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"MaxResults\":{\
          \"shape\":\"MaxResults\",\
          \"documentation\":\"<p>The maximum number of <code>AppInstance</code>s that you want to return.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"max-results\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API requests until you reach the maximum number of <code>AppInstances</code>.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"next-token\"\
        }\
      }\
    },\
    \"ListAppInstancesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstances\":{\
          \"shape\":\"AppInstanceList\",\
          \"documentation\":\"<p>The information for each <code>AppInstance</code>.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token passed by previous API requests until the maximum number of <code>AppInstance</code>s is reached.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceARN\"],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the resource.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"arn\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag key-value pairs.</p>\"\
        }\
      }\
    },\
    \"MaxResults\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"Metadata\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":0,\
      \"pattern\":\".*\",\
      \"sensitive\":true\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":0,\
      \"pattern\":\".*\",\
      \"sensitive\":true\
    },\
    \"NonEmptyResourceName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0009\\\\u000A\\\\u000D\\\\u0020-\\\\u007E\\\\u0085\\\\u00A0-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\u10000-\\\\u10FFFF]*\",\
      \"sensitive\":true\
    },\
    \"NonEmptySensitiveString1600\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":1,\
      \"pattern\":\".*\",\
      \"sensitive\":true\
    },\
    \"NotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>One or more of the resources in the request does not exist in the system.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"PutAppInstanceRetentionSettingsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceArn\",\
        \"AppInstanceRetentionSettings\"\
      ],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceArn\"\
        },\
        \"AppInstanceRetentionSettings\":{\
          \"shape\":\"AppInstanceRetentionSettings\",\
          \"documentation\":\"<p>The time in days to retain data. Data type: number.</p>\"\
        }\
      }\
    },\
    \"PutAppInstanceRetentionSettingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceRetentionSettings\":{\
          \"shape\":\"AppInstanceRetentionSettings\",\
          \"documentation\":\"<p>The time in days to retain data. Data type: number.</p>\"\
        },\
        \"InitiateDeletionTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the API deletes data.</p>\"\
        }\
      }\
    },\
    \"PutAppInstanceUserExpirationSettingsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"AppInstanceUserArn\"],\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceUserArn\"\
        },\
        \"ExpirationSettings\":{\
          \"shape\":\"ExpirationSettings\",\
          \"documentation\":\"<p>Settings that control the interval after which an <code>AppInstanceUser</code> is automatically deleted.</p>\"\
        }\
      }\
    },\
    \"PutAppInstanceUserExpirationSettingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\"\
        },\
        \"ExpirationSettings\":{\
          \"shape\":\"ExpirationSettings\",\
          \"documentation\":\"<p>Settings that control the interval after which an <code>AppInstanceUser</code> is automatically deleted.</p>\"\
        }\
      }\
    },\
    \"RegisterAppInstanceUserEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceUserArn\",\
        \"Type\",\
        \"ResourceArn\",\
        \"EndpointAttributes\",\
        \"ClientRequestToken\"\
      ],\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"SensitiveChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceUserArn\"\
        },\
        \"Name\":{\
          \"shape\":\"SensitiveString1600\",\
          \"documentation\":\"<p>The name of the <code>AppInstanceUserEndpoint</code>.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"AppInstanceUserEndpointType\",\
          \"documentation\":\"<p>The type of the <code>AppInstanceUserEndpoint</code>. Supported types:</p> <ul> <li> <p> <code>APNS</code>: The mobile notification service for an Apple device.</p> </li> <li> <p> <code>APNS_SANDBOX</code>: The sandbox environment of the mobile notification service for an Apple device.</p> </li> <li> <p> <code>GCM</code>: The mobile notification service for an Android device.</p> </li> </ul> <p>Populate the <code>ResourceArn</code> value of each type as <code>PinpointAppArn</code>.</p>\"\
        },\
        \"ResourceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the resource to which the endpoint belongs.</p>\"\
        },\
        \"EndpointAttributes\":{\
          \"shape\":\"EndpointAttributes\",\
          \"documentation\":\"<p>The attributes of an <code>Endpoint</code>.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestToken\",\
          \"documentation\":\"<p>The unique ID assigned to the request. Use different tokens to register other endpoints.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"AllowMessages\":{\
          \"shape\":\"AllowMessages\",\
          \"documentation\":\"<p>Boolean that controls whether the AppInstanceUserEndpoint is opted in to receive messages. <code>ALL</code> indicates the endpoint receives all messages. <code>NONE</code> indicates the endpoint receives no messages.</p>\"\
        }\
      }\
    },\
    \"RegisterAppInstanceUserEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"SensitiveChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\"\
        },\
        \"EndpointId\":{\
          \"shape\":\"SensitiveString64\",\
          \"documentation\":\"<p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>\"\
        }\
      }\
    },\
    \"ResourceLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request exceeds the resource limit.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"ResourceName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"[\\\\u0009\\\\u000A\\\\u000D\\\\u0020-\\\\u007E\\\\u0085\\\\u00A0-\\\\uD7FF\\\\uE000-\\\\uFFFD\\\\u10000-\\\\u10FFFF]*\",\
      \"sensitive\":true\
    },\
    \"RespondsTo\":{\
      \"type\":\"string\",\
      \"enum\":[\"STANDARD_MESSAGES\"]\
    },\
    \"RetentionDays\":{\
      \"type\":\"integer\",\
      \"max\":5475,\
      \"min\":1\
    },\
    \"SensitiveChimeArn\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":5,\
      \"pattern\":\"arn:[a-z0-9-\\\\.]{1,63}:[a-z0-9-\\\\.]{0,63}:[a-z0-9-\\\\.]{0,63}:[a-z0-9-\\\\.]{0,63}:[^/].{0,1023}\",\
      \"sensitive\":true\
    },\
    \"SensitiveString1600\":{\
      \"type\":\"string\",\
      \"max\":1600,\
      \"min\":0,\
      \"pattern\":\".*\",\
      \"sensitive\":true\
    },\
    \"SensitiveString64\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":0,\
      \"pattern\":\".*\",\
      \"sensitive\":true\
    },\
    \"ServiceFailureException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The service encountered an unexpected error.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"ServiceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The service is currently unavailable.</p>\",\
      \"error\":{\"httpStatusCode\":503},\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"String\":{\"type\":\"string\"},\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Key\",\
        \"Value\"\
      ],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The key in a tag.</p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p>The value in a tag.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A tag object containing a key-value pair.</p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceARN\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The resource ARN.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag key-value pairs.</p>\"\
        }\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"ThrottledClientException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The client exceeded its request rate limit.</p>\",\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"UnauthorizedClientException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Code\":{\"shape\":\"ErrorCode\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The client is not currently authorized to make the request.</p>\",\
      \"error\":{\"httpStatusCode\":401},\
      \"exception\":true\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceARN\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceARN\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The resource ARN.</p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The tag keys.</p>\"\
        }\
      }\
    },\
    \"UpdateAppInstanceBotRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceBotArn\",\
        \"Name\",\
        \"Metadata\"\
      ],\
      \"members\":{\
        \"AppInstanceBotArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceBot</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceBotArn\"\
        },\
        \"Name\":{\
          \"shape\":\"ResourceName\",\
          \"documentation\":\"<p>The name of the <code>AppInstanceBot</code>.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata of the <code>AppInstanceBot</code>.</p>\"\
        }\
      }\
    },\
    \"UpdateAppInstanceBotResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceBotArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceBot</code>.</p>\"\
        }\
      }\
    },\
    \"UpdateAppInstanceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceArn\",\
        \"Name\",\
        \"Metadata\"\
      ],\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceArn\"\
        },\
        \"Name\":{\
          \"shape\":\"NonEmptyResourceName\",\
          \"documentation\":\"<p>The name that you want to change.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata that you want to change.</p>\"\
        }\
      }\
    },\
    \"UpdateAppInstanceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstance</code>.</p>\"\
        }\
      }\
    },\
    \"UpdateAppInstanceUserEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceUserArn\",\
        \"EndpointId\"\
      ],\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"SensitiveChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceUserArn\"\
        },\
        \"EndpointId\":{\
          \"shape\":\"SensitiveString64\",\
          \"documentation\":\"<p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"endpointId\"\
        },\
        \"Name\":{\
          \"shape\":\"SensitiveString1600\",\
          \"documentation\":\"<p>The name of the <code>AppInstanceUserEndpoint</code>.</p>\"\
        },\
        \"AllowMessages\":{\
          \"shape\":\"AllowMessages\",\
          \"documentation\":\"<p>Boolean that controls whether the <code>AppInstanceUserEndpoint</code> is opted in to receive messages. <code>ALL</code> indicates the endpoint will receive all messages. <code>NONE</code> indicates the endpoint will receive no messages.</p>\"\
        }\
      }\
    },\
    \"UpdateAppInstanceUserEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"SensitiveChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\"\
        },\
        \"EndpointId\":{\
          \"shape\":\"SensitiveString64\",\
          \"documentation\":\"<p>The unique identifier of the <code>AppInstanceUserEndpoint</code>.</p>\"\
        }\
      }\
    },\
    \"UpdateAppInstanceUserRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"AppInstanceUserArn\",\
        \"Name\",\
        \"Metadata\"\
      ],\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"appInstanceUserArn\"\
        },\
        \"Name\":{\
          \"shape\":\"UserName\",\
          \"documentation\":\"<p>The name of the <code>AppInstanceUser</code>.</p>\"\
        },\
        \"Metadata\":{\
          \"shape\":\"Metadata\",\
          \"documentation\":\"<p>The metadata of the <code>AppInstanceUser</code>.</p>\"\
        }\
      }\
    },\
    \"UpdateAppInstanceUserResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AppInstanceUserArn\":{\
          \"shape\":\"ChimeArn\",\
          \"documentation\":\"<p>The ARN of the <code>AppInstanceUser</code>.</p>\"\
        }\
      }\
    },\
    \"UserId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"[A-Za-z0-9]([A-Za-z0-9\\\\:\\\\-\\\\_\\\\.\\\\@]{0,62}[A-Za-z0-9])?\",\
      \"sensitive\":true\
    },\
    \"UserName\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\".*\\\\S.*\",\
      \"sensitive\":true\
    }\
  },\
  \"documentation\":\"<p>The Amazon Chime SDK Identity APIs in this section allow software developers to create and manage unique instances of their messaging applications. These APIs provide the overarching framework for creating and sending messages. For more information about the identity APIs, refer to <a href=\\\"https://docs.aws.amazon.com/chime/latest/APIReference/API_Operations_Amazon_Chime_SDK_Identity.html\\\">Amazon Chime SDK identity</a>.</p>\"\
}\
";
}

@end
