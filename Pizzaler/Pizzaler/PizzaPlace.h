//
//  PizzaPlace.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface PizzaPlace : NSManagedObject

-(void)updateWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

#import "PizzaPlace+CoreDataProperties.h"
