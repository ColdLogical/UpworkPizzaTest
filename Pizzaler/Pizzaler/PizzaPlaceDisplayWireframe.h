//
//  PizzaPlaceDisplayWireframe.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// VIPER Protocols
#import "PizzaPlaceDisplayPresenterProtocols.h"
#import "PizzaPlaceDisplayWireframeProtocols.h"

// VIPER Forward Declarations
@class PizzaPlaceDisplayInteractor;
@class PizzaPlaceDisplayPresenter;
@class PizzaPlaceDisplayView;

@class PizzaPlace;

@interface PizzaPlaceDisplayWireframe : NSObject <PizzaPlaceDisplayWireframeInterface>

// VIPER Stack
@property (nonatomic, strong) PizzaPlaceDisplayInteractor *moduleInteractor;
@property (nonatomic, strong) PizzaPlaceDisplayPresenter *modulePresenter;
@property (nonatomic, strong) PizzaPlaceDisplayView *moduleView;
@property (nonatomic, weak) id<PizzaPlaceDisplayRouting> presenter;

// Instance Variables
@property (nonatomic, weak) id<PizzaPlaceDisplayDelegate> delegate;

// Instance Methods
+(UIStoryboard *)storyboard;

-(void)pushOntoNavigationController:(UINavigationController *)navigationController pizzaPlace:(PizzaPlace *)pizzaPlace;

@end