//
//  PizzaPlaceDisplayPresenter.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import <Foundation/Foundation.h>

// VIPER Protocols
#import "PizzaPlaceDisplayInteractorProtocols.h"
#import "PizzaPlaceDisplayPresenterProtocols.h"
#import "PizzaPlaceDisplayViewProtocols.h"
#import "PizzaPlaceDisplayWireframeProtocols.h"

@class PizzaPlace;

@interface PizzaPlaceDisplayPresenter : NSObject <PizzaPlaceDisplayInteractorOutput, PizzaPlaceDisplayRouting, PizzaPlaceDisplayPresenterInterface>

// VIPER References
@property (nonatomic, weak) id<PizzaPlaceDisplayInteractorInput> interactor;
@property (nonatomic, weak) id<PizzaPlaceDisplayViewInterface> view;
@property (nonatomic, weak) id<PizzaPlaceDisplayWireframeInterface> wireframe;

// Instance Variables
@property (nonatomic, strong) PizzaPlace *pizzaPlace;

@end