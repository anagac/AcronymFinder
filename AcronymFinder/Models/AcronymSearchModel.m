//
//  AcronymSearchModel.m
//  AcronymFinder
//
//  Created by Andres Aguilar on 1/22/17.
//  Copyright © 2017 Andres Aguilar. All rights reserved.
//

#import "AcronymSearchModel.h"
#import "AcronymTableViewDataSource.h"
#import "AcronymRESTModel.h"

@interface AcronymSearchModel() <AcronymRestModelDelegate, UISearchBarDelegate>

@property (strong, nonatomic) AcronymTableViewDataSource *tableDataSource;
@property (strong, nonatomic) AcronymRESTModel *acronymRest;

@end

@implementation AcronymSearchModel

- (id) init {
    self = [super init];
    if(self) {
        _acronymRest = [AcronymRESTModel new];
        _acronymRest.delegate = self;
    }
    return self;
}

- (void)setupTableViewDelegate:(UITableView *)tableView {
    self.tableDataSource = [AcronymTableViewDataSource new];
    tableView.delegate = self.tableDataSource;
    tableView.dataSource = self.tableDataSource;
}

- (void)setupSearchBarDelegate:(UISearchBar *)searchBar {
    searchBar.delegate = self;
}

- (void) clearResults {
    [self.delegate toggleNoResultsVisibility:YES];
    [self.tableDataSource setNewAcronymList:@[]];
    [self.delegate reloadTable];
}

#pragma mark - AcronymRestModelDelegate
- (void)acronymRestModelDidRetrieveMeanings:(NSArray *)meanings {
    if(meanings.count == 0) {
        [self.delegate toggleNoResultsVisibility:NO];
    }else {
        [self.delegate toggleNoResultsVisibility:YES];
    }
    [self.tableDataSource setNewAcronymList:meanings];
    [self.delegate reloadTable];
    [self.delegate hideProgressHud];
}

-(void)acronymRestModelDidFailWithError:(NSError *)error {
    [self.delegate hideProgressHud];
    [self.delegate showErrorMessage];
}

#pragma mark - SearchBar Delegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if(searchText.length == 0) {
        [self clearResults];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.delegate hideKeyboard];
    [self.delegate showProgressHud];
    [self.acronymRest getMeaningsForAcronym:searchBar.text];
}

@end
