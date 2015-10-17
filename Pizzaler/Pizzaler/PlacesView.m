//
//  PlacesView.m
//  Pizzaler
//
//  Created by Cold Logic on 10/17/15.
//  Copyright © 2015 Cold and Logical. All rights reserved.
//

#import "PlacesView.h"

#import "PlacesViewObject.h"

@interface PlacesView()

@end

@implementation PlacesView

#pragma mark - Operational
-(IBAction)searchTapped:(id)sender {
        [self.presenter userTappedSearch];
}

#pragma mark - View Interface
-(void)showLocationCannotBeFound {
        
}

-(void)showNoPizzaPlacesFound {
        
}

-(void)showPizzaPlaces:(NSArray *)places {
        self.places = places;
        dispatch_async(dispatch_get_main_queue(), ^{
                [[self tableView] reloadData];
        });
}

-(void)showPizzaPlacesSearchFailed {
        
}

#pragma mark - TableView Data Source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PizzaPlaceCell"];
        
        PlacesViewObject *viewObject = self.places[indexPath.row];
        
        cell.textLabel.text = viewObject.placeName;
        cell.detailTextLabel.text = viewObject.phoneNumber;
        
        return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return self.places.count;
}

#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        PlacesViewObject *viewObject = self.places[indexPath.row];
        
        [self.presenter userSelectedPlaceWithEniroId:viewObject.eniroId];
}

@end