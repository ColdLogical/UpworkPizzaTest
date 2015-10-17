//
//  PlacesInteractorProtocols.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

// Forward Class Declarations
@class CLLocation;

// VIPER Interface for communication from Presenter to Interactor
@protocol PlacesInteractorInput <NSObject>

-(void)findCurrentLocation;
-(void)searchForPizzaPlacesAtLocation:(CLLocation *)location;

@end