//
//  PlacesPresenter.m
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import "PlacesPresenter.h"

#import "PizzaPlace.h"
#import "PlacesViewObject.h"

@interface PlacesPresenter()

@end

@implementation PlacesPresenter

#pragma mark - Operational
-(void)callSearchForPizzaPlacesWithCurrentLocation {
        if(self.currentLocation == nil) {
                [self.interactor findCurrentLocation];
        } else {
                [self.interactor searchForPizzaPlacesAtLocation:self.currentLocation];
        }
}

#pragma mark - Interactor Output
-(void)foundCurrentLocation:(CLLocation *)currentLocation {
        self.currentLocation = currentLocation;
        [self callSearchForPizzaPlacesWithCurrentLocation];
}

-(void)foundPizzaPlaces:(NSArray *)pizzaPlaces {
        self.pizzaPlaces = pizzaPlaces;
        
        if(pizzaPlaces && pizzaPlaces.count > 0) {
                NSMutableArray *places = [NSMutableArray new];
                
                for(PizzaPlace *p in pizzaPlaces) {
                        PlacesViewObject *viewObject = [PlacesViewObject new];
                        
                        viewObject.eniroId = p.eniroId;
                        viewObject.placeName = p.name;
                        viewObject.phoneNumber = p.phoneNumber;
                        
                        [places addObject:viewObject];
                }
                
                NSSortDescriptor *nameDescriptor = [[NSSortDescriptor alloc] initWithKey:@"placeName" ascending:YES];
                
                NSArray *sortedPlaces = [places sortedArrayUsingDescriptors:@[nameDescriptor]];
                
                [self.view showPizzaPlaces:sortedPlaces];
        } else {
                [self.view showNoPizzaPlacesFound];
        }
}

-(void)locationCannotBeDetermined {
        [self.view showLocationCannotBeFound];
}

-(void)pizzaPlaceSearchFailed {
        [self.view showPizzaPlacesSearchFailed];
}

#pragma mark - Presenter Interface
-(void)userSelectedPlaceWithEniroId:(NSString *)eniroId {
        __block PizzaPlace *p = nil;
        
        [self.pizzaPlaces enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                PizzaPlace *pizzaPlace = (PizzaPlace *)obj;
                if([pizzaPlace.eniroId isEqualToString:eniroId]) {
                        p = obj;
                        *stop = true;
                }
        }];
        
        if(p) {
                [self.wireframe presentPizzaPlaceViewWithPizzaPlace:p];
        }
}

-(void)userTappedSearch {
        [self callSearchForPizzaPlacesWithCurrentLocation];
}

#pragma mark - Routing
-(void)beganPresentingPlaces {
        [self callSearchForPizzaPlacesWithCurrentLocation];
}

@end