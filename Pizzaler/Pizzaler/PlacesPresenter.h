//
//  PlacesPresenter.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import <Foundation/Foundation.h>

// VIPER Protocols
#import "PlacesInteractorProtocols.h"
#import "PlacesPresenterProtocols.h"
#import "PlacesViewProtocols.h"
#import "PlacesWireframeProtocols.h"

@class CLLocation;

@interface PlacesPresenter : NSObject <PlacesInteractorOutput, PlacesRouting, PlacesPresenterInterface>

// VIPER References
@property (nonatomic, weak) id<PlacesInteractorInput> interactor;
@property (nonatomic, weak) id<PlacesViewInterface> view;
@property (nonatomic, weak) id<PlacesWireframeInterface> wireframe;

// Instance Variables
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) NSArray *pizzaPlaces;

@end