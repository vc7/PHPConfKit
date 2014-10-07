//
//  PCKSynchronizer.h
//  PHPConfKit
//
//  Created by vincent on 2014/08/27.
//  Copyright (c) 2014年 Vincent Chen. All rights reserved.
//

#import "AFHTTPSessionManager.h"

typedef void (^PCKSynchronizerSuccess)(NSURLSessionDataTask *task, id responseObject); //! @typedef PCKSynchronizerSuccess the success block callback
typedef void (^PCKSynchronizerFailure)(NSURLSessionDataTask *task, NSError *error);    //! @typedef PCKSynchronizerFailure the falure block callback

@interface PCKSynchronizer : AFHTTPSessionManager

/*! Shared singleton instance
 @return the synchronizer instance
 */
+ (PCKSynchronizer *)sharedSynchronizer;

/*! Check remote data version with success and failure block callback
 @param success Success block to pass the checked results out.
 @param failure Failure block to pass error message out.
 */
- (void)checkRemoteDataVersionWithSuccess:(PCKSynchronizerSuccess)success failure:(PCKSynchronizerFailure)failure;

/*! Start to synchronize and update the local database
 @param success Success block to pass the update results out.
 @param failure Failure block to pass error message out.
 */
- (void)updateLocalDataWithSuccess:(PCKSynchronizerFailure)success failure:(PCKSynchronizerFailure)failure;

/*! Fetch the session data arrays with success and failure block callback
 @param success Success block will return an array with 2 session arrays, 0 is R0, 1 is R2.
 @param failure Failure block to pass error message out.
 */
- (void)fetchSessionsWithSuccess:(PCKSynchronizerSuccess)success failure:(PCKSynchronizerFailure)failure;
- (void)fetchVenuesWithSuccess:(PCKSynchronizerSuccess)success failure:(PCKSynchronizerFailure)failure;
- (void)fetchSponsorsSuccess:(PCKSynchronizerSuccess)success failure:(PCKSynchronizerFailure)failure;
- (void)fetchConfInfoWithSuccess:(PCKSynchronizerSuccess)success failure:(PCKSynchronizerFailure)failure;

@end
