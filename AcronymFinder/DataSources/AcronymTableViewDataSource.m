//
//  TableViewDataSource.m
//  AcronymFinder
//
//  Created by Andres Aguilar on 1/21/17.
//  Copyright © 2017 Andres Aguilar. All rights reserved.
//

#import "AcronymTableViewDataSource.h"

@interface AcronymTableViewDataSource()

@property (strong, nonatomic) NSArray *acronymList;

@end

@implementation AcronymTableViewDataSource

- (void) setNewAcronymList:(NSArray *)newList {
    self.acronymList = [[NSArray alloc] initWithArray:newList];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.acronymList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *acronymResult = [self.acronymList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = acronymResult;
    
    return cell;
}



@end
