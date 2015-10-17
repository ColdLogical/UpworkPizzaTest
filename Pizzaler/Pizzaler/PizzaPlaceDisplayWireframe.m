//
//  PizzaPlaceDisplayWireframe.m
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import "PizzaPlaceDisplayWireframe.h"

// VIPER
#import "PizzaPlaceDisplayInteractor.h"
#import "PizzaPlaceDisplayPresenter.h"
#import "PizzaPlaceDisplayView.h"

@interface PizzaPlaceDisplayWireframe ()

@end

@implementation PizzaPlaceDisplayWireframe

#pragma mark - Init
-(instancetype)init {
        self = [super init];
        
        if (self) {
                PizzaPlaceDisplayInteractor *i = self.moduleInteractor;
                PizzaPlaceDisplayPresenter *p = self.modulePresenter;
                PizzaPlaceDisplayView *v = self.moduleView;
                
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
-(PizzaPlaceDisplayInteractor *)moduleInteractor {
        if(_moduleInteractor != nil) {
                return _moduleInteractor ;
        }
        
        _moduleInteractor = [PizzaPlaceDisplayInteractor new];
        
        return _moduleInteractor;
}

-(PizzaPlaceDisplayPresenter *)modulePresenter {
        if(_modulePresenter != nil) {
                return _modulePresenter;
        }
        
        _modulePresenter = [PizzaPlaceDisplayPresenter new];
        
        return _modulePresenter;
}

-(PizzaPlaceDisplayView *)moduleView {
        if(_moduleView != nil) {
                return _moduleView;
        }
        
        _moduleView = [[PizzaPlaceDisplayWireframe storyboard] instantiateViewControllerWithIdentifier:kPizzaPlaceDisplayViewIdentifier];
        
        return _moduleView;
}

+(UIStoryboard *)storyboard {
        return [UIStoryboard storyboardWithName:kPizzaPlaceDisplayStoryboard bundle:[NSBundle mainBundle]];
}

#pragma mark - Operational
-(void)pushOntoNavigationController:(UINavigationController *)navigationController pizzaPlace:(PizzaPlace *)pizzaPlace {
        [navigationController pushViewController:self.moduleView animated:true];
        [self.presenter presentingPizzaPlace:pizzaPlace];
}

#pragma mark - Wireframe Interface

@end