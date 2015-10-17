//
//  PlacesWireframe.m
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import "PlacesWireframe.h"

// VIPER
#import "PlacesInteractor.h"
#import "PlacesPresenter.h"
#import "PlacesView.h"

@interface PlacesWireframe ()

@end

@implementation PlacesWireframe

#pragma mark - Init
-(instancetype)init {
        self = [super init];
        
        if (self) {
                PlacesInteractor *i = self.moduleInteractor;
                PlacesPresenter *p = self.modulePresenter;
                PlacesView *v = self.moduleView;
                
                i.presenter = p;
                
                p.interactor = i;
                p.view = v;
                p.wireframe = self;
                
                v.presenter = p;
                
                self.presenter = p;
        }
        
        return self;
}

#pragma mark - Lazy Loaders
-(PlacesInteractor *)moduleInteractor {
        if(_moduleInteractor != nil) {
                return _moduleInteractor ;
        }
        
        _moduleInteractor = [PlacesInteractor new];
        
        return _moduleInteractor;
}

-(PlacesPresenter *)modulePresenter {
        if(_modulePresenter != nil) {
                return _modulePresenter;
        }
        
        _modulePresenter = [PlacesPresenter new];
        
        return _modulePresenter;
}

-(UINavigationController *)moduleNavigationController {
        if(_moduleNavigationController != nil) {
                return _moduleNavigationController;
        }
        
        _moduleNavigationController = [[PlacesWireframe storyboard] instantiateViewControllerWithIdentifier:kPlacesNavigationControllerIdentifier];
 
        return _moduleNavigationController;
}

-(PlacesView *)moduleView {
        if(_moduleView != nil) {
                return _moduleView;
        }
        
        _moduleView = self.moduleNavigationController.viewControllers[0];
        
        return _moduleView;
}

-(PizzaPlaceDisplayWireframe *)pizzaPlaceDisplayModule {
        if(_pizzaPlaceDisplayModule == nil) {
                _pizzaPlaceDisplayModule = [PizzaPlaceDisplayWireframe new];
        }
        
        return _pizzaPlaceDisplayModule;
}

+(UIStoryboard *)storyboard {
        return [UIStoryboard storyboardWithName:kPlacesStoryboard bundle:[NSBundle mainBundle]];
}

#pragma mark - Operational
-(void)presentAsRootViewControllerOnWindow:(UIWindow *)window {
        window.rootViewController = self.moduleNavigationController;
        [window makeKeyAndVisible];
        
        [self.presenter beganPresentingPlaces];
}

#pragma mark - Wireframe Interface
-(void)presentPizzaPlaceViewWithPizzaPlace:(PizzaPlace *)pizzaPlace {
        [self.pizzaPlaceDisplayModule pushOntoNavigationController:self.moduleNavigationController pizzaPlace:pizzaPlace];
}

@end