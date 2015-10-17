//
//  PizzaPlaceDisplayWireframeProtocols.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

// Forward Class Declarations

// VIPER Module Constants

static NSString *kPizzaPlaceDisplayStoryboard = @"Main";
static NSString *kPizzaPlaceDisplayViewIdentifier = @"PizzaPlaceDisplayView";

// VIPER Interface for the module
@protocol PizzaPlaceDisplayDelegate <NSObject>

@end

// VIPER Interface for communication from Presenter -> Wireframe
@protocol PizzaPlaceDisplayWireframeInterface <NSObject>

@end