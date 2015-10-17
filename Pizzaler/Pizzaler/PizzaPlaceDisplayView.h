//
//  PizzaPlaceDisplayView.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import <UIKit/UIKit.h>

// VIPER Protocols
#import "PizzaPlaceDisplayViewProtocols.h"
#import "PizzaPlaceDisplayPresenterProtocols.h"

@interface PizzaPlaceDisplayView: UIViewController <PizzaPlaceDisplayViewInterface>

// VIPER Stack
@property (nonatomic, weak) id<PizzaPlaceDisplayPresenterInterface> presenter;

// Outlets
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@property (nonatomic, weak) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *phoneLabel;

// Instance Variables

@end