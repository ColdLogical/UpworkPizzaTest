//
//  PlacesPresenterProtocols.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

// Forward Class Declarations
@class CLLocation;

// VIPER Interface for communication from Interactor -> Presenter
@protocol PlacesInteractorOutput <NSObject>

-(void)foundCurrentLocation:(CLLocation *)currentLocation;
-(void)foundPizzaPlaces:(NSArray *)pizzaPlaces;
-(void)locationCannotBeDetermined;
-(void)pizzaPlaceSearchFailed;

@end

// VIPER Interface for communication from View -> Presenter
@protocol PlacesPresenterInterface <NSObject>

-(void)userSelectedPlaceWithEniroId:(NSString *)eniroId;
-(void)userTappedSearch;

@end

// VIPER Interface for communication from Wireframe -> Presenter
@protocol PlacesRouting <NSObject>

-(void)beganPresentingPlaces;

@end