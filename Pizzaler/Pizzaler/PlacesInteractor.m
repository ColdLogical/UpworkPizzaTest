//
//  PlacesInteractor.m
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import "PlacesInteractor.h"

#import <CoreLocation/CoreLocation.h>

#import "CoreDataManager.h"
#import "PizzaPlace.h"

static const NSString *kEniroAPIKey = @"5656760558506197971";
static const NSString *kEniroProfile = @"ColdLogic";

@interface PlacesInteractor()

@end

@implementation PlacesInteractor

#pragma mark - Lazy Loaders
-(CLLocationManager *)locationManager {
        if(_locationManager == nil) {
                _locationManager = [CLLocationManager new];
                _locationManager.delegate = self;
                
                CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
                if(status != kCLAuthorizationStatusDenied && status != kCLAuthorizationStatusRestricted) {
                        if(status == kCLAuthorizationStatusNotDetermined) {
                                [_locationManager requestWhenInUseAuthorization];
                        }
                } else {
                        [self locationRestricted];
                }
        }
        
        return _locationManager;
}

#pragma mark - Operational
-(void)locationRestricted {
        [self.presenter locationCannotBeDetermined];
}

-(void)parseSearchJSON:(NSDictionary *)jsonDictionary {
        if(jsonDictionary) {
                NSArray *adverts = jsonDictionary[@"adverts"];
                
                if(adverts.count > 0) {
                        NSMutableArray *pizzaPlaces = [NSMutableArray new];
                        
                        for(NSDictionary *pizzaPlaceDictionary in adverts) {
                                NSString *eniroId = pizzaPlaceDictionary[@"eniroId"];
                                
                                PizzaPlace *p = [[CoreDataManager sharedInstance] existingOrNewPizzaPlaceWithEniroId:eniroId];
                                
                                [p updateWithDictionary:pizzaPlaceDictionary];
                                
                                [pizzaPlaces addObject:p];
                        }
                
                        
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"PizzaPlacesUpdated" object:nil];
                        
                        [self.presenter foundPizzaPlaces:[pizzaPlaces copy]];
                }
        }
}

-(void)searchFailed {
        [self.presenter pizzaPlaceSearchFailed];
}

#pragma mark - Interactor Input
-(void)findCurrentLocation {
        [self.locationManager startUpdatingLocation];
}

-(void)searchForPizzaPlacesAtLocation:(CLLocation *)location {
        if(!self.searchingForPizzaPlaces) {
                self.searchingForPizzaPlaces = true;
                NSString *latitudeLongitudeURLString = [NSString stringWithFormat:@"http://api.eniro.com/cs/search/basic?profile=%@&key=%@&country=se&version=1.1.3&latitude=%f&longitude=%f&search_word=pizza&from_list=1&to_list=5",
                                                        kEniroProfile,
                                                        kEniroAPIKey,
                                                        location.coordinate.latitude,
                                                        location.coordinate.longitude];
                
                NSURL *latitudeLongitudeURL = [NSURL URLWithString:latitudeLongitudeURLString];
                
                NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
                [[session dataTaskWithURL:latitudeLongitudeURL
                       completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                               self.searchingForPizzaPlaces = false;
                               if(data) {
                                       NSError *jsonError = nil;
                                       NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
                                       if(!jsonError) {
                                               [self parseSearchJSON:jsonDictionary];
                                       } else {
                                               [self searchFailed];
                                       }
                               }
                               
                               if(error) {
                                       [self searchFailed];
                               }
                       }
                ] resume];
                
        }
}

#pragma mark - Core Location Manager Delegate
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
        if([CLLocationManager locationServicesEnabled]) {
                self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
                self.locationManager.distanceFilter = kCLDistanceFilterNone;
                [self.locationManager startUpdatingLocation];
        }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
        CLLocation *currentLocation = manager.location;
        [self.locationManager stopUpdatingLocation];
        [self.presenter foundCurrentLocation:currentLocation];
}


@end