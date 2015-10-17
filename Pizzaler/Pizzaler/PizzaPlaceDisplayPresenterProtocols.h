//
//  PizzaPlaceDisplayPresenterProtocols.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

// Forward Class Declarations
@class PizzaPlace;

// VIPER Interface for communication from Interactor -> Presenter
@protocol PizzaPlaceDisplayInteractorOutput <NSObject>

@end

// VIPER Interface for communication from View -> Presenter
@protocol PizzaPlaceDisplayPresenterInterface <NSObject>

@end

// VIPER Interface for communication from Wireframe -> Presenter
@protocol PizzaPlaceDisplayRouting <NSObject>

-(void)presentingPizzaPlace:(PizzaPlace *)pizzaPlace;

@end