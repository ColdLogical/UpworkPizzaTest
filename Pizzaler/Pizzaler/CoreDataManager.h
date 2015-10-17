//
//  CoreDataManager.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>

@class PizzaPlace;

@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


+(instancetype)sharedInstance;

-(NSURL *)applicationDocumentsDirectory;
-(PizzaPlace *)existingOrNewPizzaPlaceWithEniroId:(NSString *)eniroId;
-(void)saveContext;

@end
