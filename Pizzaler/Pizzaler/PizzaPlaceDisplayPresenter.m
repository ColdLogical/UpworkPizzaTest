//
//  PizzaPlaceDisplayPresenter.m
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import "PizzaPlaceDisplayPresenter.h"

#import "PizzaPlace.h"

@interface PizzaPlaceDisplayPresenter()

@end

@implementation PizzaPlaceDisplayPresenter

#pragma mark - Operational

#pragma mark - Interactor Output

#pragma mark - Presenter Interface

#pragma mark - Routing
-(void)presentingPizzaPlace:(PizzaPlace *)pizzaPlace {
        self.pizzaPlace = pizzaPlace;
        
        [self.view showName:pizzaPlace.name];
        [self.view showDescription:pizzaPlace.companyText];
        [self.view showPhone:pizzaPlace.phoneNumber];
        [self.view showAddress:pizzaPlace.address];
}

@end