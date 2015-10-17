//
//  PizzaPlaceDisplayView.m
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import "PizzaPlaceDisplayView.h"

@interface PizzaPlaceDisplayView()

@end

@implementation PizzaPlaceDisplayView

#pragma mark - Operational

#pragma mark - View Interface
-(void)showAddress:(NSString *)address {
        self.addressLabel.text = address;
}

-(void)showDescription:(NSString *)description {
        self.descriptionLabel.text = description;
}

-(void)showName:(NSString *)name {
        self.nameLabel.text = name;
}

-(void)showPhone:(NSString *)phone {
        self.phoneLabel.text = phone;
}

@end