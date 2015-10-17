//
//  PlacesInteractor.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>

// VIPER Protocols
#import "PlacesInteractorProtocols.h"
#import "PlacesPresenterProtocols.h"

@interface PlacesInteractor : NSObject <
        PlacesInteractorInput,
        CLLocationManagerDelegate
        >

// VIPER Stack
@property (nonatomic, weak) id<PlacesInteractorOutput> presenter;

// Instance Variables
@property (nonatomic, strong) CLLocationManager *locationManager;

@property (nonatomic, readwrite) BOOL searchingForPizzaPlaces;

@end