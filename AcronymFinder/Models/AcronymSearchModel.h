//
//  AcronymSearchModel.h
//  AcronymFinder
//
//  Created by Andres Aguilar on 1/22/17.
//  Copyright © 2017 Andres Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol AcronymSearchModelDelegate;

@interface AcronymSearchModel : NSObject 

@property (weak, nonatomic) id<AcronymSearchModelDelegate> delegate;

- (void)setupTableViewDelegate:(UITableView *)tableView;
- (void)setupSearchBarDelegate:(UISearchBar *)searchBar;


@end

@protocol AcronymSearchModelDelegate <NSObject>

- (void)showProgressHud;
- (void)hideProgressHud;
- (void)reloadTable;
- (void)hideKeyboard;
- (void)toggleNoResultsVisibility:(BOOL)hidden;
- (void)showErrorMessage;


@end