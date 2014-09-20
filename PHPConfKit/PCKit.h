//
//  PCKit.h
//  PHPConfKit
//
//  Created by vincent on 2014/08/25.
//  Copyright (c) 2014 Vincent Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const kPCKDataStoreNamed = @"kPCKDataStoreNamed";

@protocol PCKDataSpec;

@interface PCKit : NSObject

/*!
 Sets the applicationId and date spec object of your application. The data spec object must conforms to the PCKDataSpec protocol to work perfectly.
 @param applicationId The application id for your Parse application.
 @param the data spec object
 */
+ (void)setApplicationId:(NSString *)applicationId dataSpec:(id <PCKDataSpec>)dataSpec;
+ (NSString *)getApplicationId;
+ (id <PCKDataSpec>)getDataSpec;

@end
