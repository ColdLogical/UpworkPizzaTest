//
//  PizzaPlaceDisplayInteractor.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import <Foundation/Foundation.h>

// VIPER Protocols
#import "PizzaPlaceDisplayInteractorProtocols.h"
#import "PizzaPlaceDisplayPresenterProtocols.h"

@interface PizzaPlaceDisplayInteractor : NSObject <PizzaPlaceDisplayInteractorInput>

// VIPER Stack
@property (nonatomic, weak) id<PizzaPlaceDisplayInteractorOutput> presenter;

// Instance Variables

@end