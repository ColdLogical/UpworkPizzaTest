//
//  PlacesWireframe.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// VIPER Protocols
#import "PlacesPresenterProtocols.h"
#import "PlacesWireframeProtocols.h"

#import "PizzaPlaceDisplayWireframe.h"

// VIPER Forward Declarations
@class PlacesInteractor;
@class PlacesPresenter;
@class PlacesView;

@interface PlacesWireframe : NSObject <PlacesWireframeInterface>

// VIPER Stack
@property (nonatomic, strong) PlacesInteractor *moduleInteractor;
@property (nonatomic, strong) UINavigationController *moduleNavigationController;
@property (nonatomic, strong) PlacesPresenter *modulePresenter;
@property (nonatomic, strong) PlacesView *moduleView;
@property (nonatomic, weak) id<PlacesRouting> presenter;

// Instance Variables
@property (nonatomic, weak) id<PlacesDelegate> delegate;
@property (nonatomic, strong) PizzaPlaceDisplayWireframe *pizzaPlaceDisplayModule;

// Instance Methods
+ (UIStoryboard *)storyboard;

-(void)presentAsRootViewControllerOnWindow:(UIWindow *)window;

@end