//
//  PCKSynchronizer.m
//  PHPConfKit
//
//  Created by vincent on 2014/08/27.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import "PCKSynchronizer.h"

#import "PCKit.h"
#import "PCKDataSpecProtocol.h"

#import "CoreData+MagicalRecord.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface PCKSynchronizer ()

@property (nonatomic, strong) NSString *applicationId;
/*! hold the data spec instance. */
@property (nonatomic, weak) id <PCKDataSpec> dataSpec;

/*! A wrapper GET method to standardize the request form and required parameters.
 */
- (NSURLSessionDataTask *)GET:(NSString *)URLString success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end

@implementation PCKSynchronizer

#pragma mark - Object Lifecycle

+ (PCKSynchronizer *)sharedSynchronizer
{
    static PCKSynchronizer *sharedSynchronizer = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedSynchronizer = [[self alloc] init];
        
        sharedSynchronizer.applicationId = [PCKit getApplicationId];
        sharedSynchronizer.dataSpec = [PCKit getDataSpec];
        
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    });
    
    return sharedSynchronizer;
}

#pragma mark - Public Methods

- (void)checkRemoteDataVersionWithSuccess:(PCKSynchronizerSuccess)success failure:(PCKSynchronizerFailure)failure
{
    [self GET:self.dataSpec.dataVersion
      success:^(NSURLSessionDataTask *task, id responseObject) {
          if (responseObject) {
              /*
              NSLog(@"-- Version --");
              NSLog(@"vcode - %@",responseObject[@"feed"][@"entry"][0][@"gsx$vcode"][@"$t"]);  // vcode
              NSLog(@"vname - %@",responseObject[@"feed"][@"entry"][0][@"gsx$vname"][@"$t"]);  // vname
              NSLog(@"updatedAt - %@",responseObject[@"feed"][@"updated"][@"$t"]);
              NSLog(@"-- Version --");
              */
              
              NSDictionary *versionDictionary = @{@"code":[NSNumber numberWithInteger:[responseObject[@"feed"][@"entry"][0][@"gsx$vcode"][@"$t"] integerValue]],
                                                  @"name":responseObject[@"feed"][@"entry"][0][@"gsx$vname"][@"$t"],
                                                  @"updatedAt":responseObject[@"feed"][@"updated"][@"$t"]};
              
              success(task, versionDictionary);
          }
      }
      failure:failure];
}

- (void)updateLocalDataWithSuccess:(PCKSynchronizerFailure)success failure:(PCKSynchronizerFailure)failure
{
}

- (void)fetchSessionsWithSuccess:(PCKSynchronizerSuccess)success failure:(PCKSynchronizerFailure)failure
{
    __block NSMutableArray *responseArray = [NSMutableArray arrayWithCapacity:2];
    
    [self GET:self.dataSpec.sessionR0
      success:^(NSURLSessionDataTask *task, id responseObject) {
          responseArray[0] = responseObject[@"feed"][@"entry"];
          
          [self GET:self.dataSpec.sessionR2 success:^(NSURLSessionDataTask *task, id responseObject) {
              responseArray[1] = responseObject[@"feed"][@"entry"];
              
              success(task, responseArray);
              
          } failure:failure];
      } failure:failure];
}
- (void)fetchVenuesWithSuccess:(PCKSynchronizerSuccess)success failure:(PCKSynchronizerFailure)failure
{
    [self GET:self.dataSpec.venueMap success:^(NSURLSessionDataTask *task, id responseObject) {
        success(task, responseObject[@"feed"][@"entry"]);
    } failure:failure];
}
- (void)fetchSponsorsSuccess:(PCKSynchronizerSuccess)success failure:(PCKSynchronizerFailure)failure
{
    __block NSMutableArray *responseArray = [NSMutableArray arrayWithCapacity:4];
    
    [self GET:self.dataSpec.sponsorGold success:^(NSURLSessionDataTask *task, id responseObject) {

        responseArray[0] = responseObject[@"feed"][@"entry"];
        
        [self GET:self.dataSpec.sponsorSilver success:^(NSURLSessionDataTask *task, id responseObject) {
            
            responseArray[1] = responseObject[@"feed"][@"entry"];
            
            [self GET:self.dataSpec.sponsorDiamond success:^(NSURLSessionDataTask *task, id responseObject) {
                
                responseArray[2] = responseObject[@"feed"][@"entry"];
                
                [self GET:self.dataSpec.sponsorSpecialThanks success:^(NSURLSessionDataTask *task, id responseObject) {
                    
                    responseArray[3] = responseObject[@"feed"][@"entry"];
                    
                    success(task, responseArray);
                    
                } failure:failure];
            } failure:failure];
        } failure:failure];
    } failure:failure];
    
}
- (void)fetchConfInfoWithSuccess:(PCKSynchronizerSuccess)success failure:(PCKSynchronizerFailure)failure
{
    __block NSMutableArray *responseArray = [NSMutableArray arrayWithCapacity:4];
    
    [self GET:self.dataSpec.confBulletin success:^(NSURLSessionDataTask *task, id responseObject) {
        
        responseArray[0] = responseObject[@"feed"][@"entry"];
        
        [self GET:self.dataSpec.confAbout success:^(NSURLSessionDataTask *task, id responseObject) {
            
            responseArray[1] = responseObject[@"feed"][@"entry"];
            
            [self GET:self.dataSpec.confTeam success:^(NSURLSessionDataTask *task, id responseObject) {
                
                responseArray[2] = responseObject[@"feed"][@"entry"];
                
                [self GET:self.dataSpec.appTeam success:^(NSURLSessionDataTask *task, id responseObject) {
                    
                    responseArray[3] = responseObject[@"feed"][@"entry"];
                    
                    success(task, responseArray);
                    
                }failure:failure];
            }failure:failure];
        }failure:failure];
    } failure:failure];
}

#pragma mark - Custom GET Method

- (NSURLSessionDataTask *)GET:(NSString *)URLString success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    NSString *requestURLString = [NSString stringWithFormat:self.dataSpec.requestTemplate, self.applicationId, URLString];
    NSDictionary *requestParameters = @{ @"alt":@"json"};
    
    return [super GET:requestURLString parameters:requestParameters success:success failure:failure];
}

#pragma mark - Private Methods

@end
