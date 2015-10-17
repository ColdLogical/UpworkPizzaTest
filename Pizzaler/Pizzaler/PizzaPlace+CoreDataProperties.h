//
//  PizzaPlace+CoreDataProperties.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PizzaPlace.h"

NS_ASSUME_NONNULL_BEGIN

@interface PizzaPlace (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *phoneNumber;
@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSString *companyText;
@property (nullable, nonatomic, retain) NSString *eniroId;

@end

NS_ASSUME_NONNULL_END
