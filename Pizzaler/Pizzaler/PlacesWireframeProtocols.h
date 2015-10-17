//
//  PlacesWireframeProtocols.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

// Forward Class Declarations
@class PizzaPlace;

// VIPER Module Constants

static NSString *kPlacesNavigationControllerIdentifier = @"PlacesNavigationController";
static NSString *kPlacesStoryboard = @"Main";
static NSString *kPlacesViewIdentifier = @"PlacesView";

// VIPER Interface for the module
@protocol PlacesDelegate <NSObject>

@end

// VIPER Interface for communication from Presenter -> Wireframe
@protocol PlacesWireframeInterface <NSObject>

-(void)presentPizzaPlaceViewWithPizzaPlace:(PizzaPlace *)pizzaPlace;

@end