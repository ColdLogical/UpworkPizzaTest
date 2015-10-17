//
//  PlacesView.h
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import <UIKit/UIKit.h>

// VIPER Protocols
#import "PlacesViewProtocols.h"
#import "PlacesPresenterProtocols.h"

@interface PlacesView: UITableViewController <
        PlacesViewInterface,
        UITableViewDataSource,
        UITableViewDelegate
        >

// VIPER Stack
@property (nonatomic, weak) id<PlacesPresenterInterface> presenter;

// Outlets

// Instance Variables
@property (nonatomic, strong) NSArray *places;

@end