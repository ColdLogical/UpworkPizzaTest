//
//  PlacesViewProtocols.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

// VIPER Interface for communication from Presenter -> View
@protocol PlacesViewInterface <NSObject>

-(void)showLocationCannotBeFound;
-(void)showNoPizzaPlacesFound;
-(void)showPizzaPlaces:(NSArray *)places;
-(void)showPizzaPlacesSearchFailed;

@end