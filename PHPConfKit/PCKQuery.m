//
//  PCKQuery.m
//  PHPConfKit
//
//  Created by vincent on 2014/09/20.
//  Copyright (c) 2014 Vincent Chen. All rights reserved.
//

#import "PCKQuery.h"

#import <CoreData/CoreData.h>
#import "CoreData+MagicalRecord.h"

@implementation PCKQuery

#pragma mark - PCKQuery convenient initializers

+ (instancetype)query
{
    PCKQuery *query = [[PCKQuery alloc] init];
    
    return query;
}

+ (instancetype)queryWithEntityName:(NSString *)entityName
{
    PCKQuery *query = [[PCKQuery alloc] init];
    query.entityName = entityName;
    
    return query;
}

#pragma mark - Public Methods

- (PCKObject *)getFirstObject
{
    return nil;
}
- (void)getFirstObjectWithBlock:(PCKObjectResultBlock)block
{
    
}

- (NSArray *)findAll
{
    NSManagedObjectContext *managedObjectContext = [NSManagedObjectContext MR_defaultContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:self.entityName inManagedObjectContext:managedObjectContext];
    NSManagedObject *managedObject = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:managedObjectContext];
    
    return nil;
}
- (void)findAllWithBlock:(PCKArrayResultBlock)block
{
    
}

- (NSArray *)findObjects
{
    return nil;
}
- (void)findObjectsInBackgroundWithBlock:(PCKArrayResultBlock)block
{
    
}


@end
