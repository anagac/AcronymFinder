//
//  SearchViewController.m
//  AcronymFinder
//
//  Created by Andres Aguilar on 1/21/17.
//  Copyright © 2017 Andres Aguilar. All rights reserved.
//

#import "SearchViewController.h"
#import "UIColor+ProjectColors.h"
#import "AlertManager.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "AcronymSearchModel.h"

@interface SearchViewController () <AcronymSearchModelDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *noResultsLabel;

@property (strong, nonatomic) AcronymSearchModel *searchModel;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupDisplay];
    [self setupModel];
}

- (void) setupDisplay {
    self.title = @"Acronym Finder";
    self.noResultsLabel.hidden = YES;
    
    [self.searchBar setBarTintColor:[UIColor projectBlue]];
    self.searchBar.backgroundImage = [UIImage new];
    self.searchBar.barStyle = UIBarStyleBlack;
    self.searchBar.tintColor = [UIColor whiteColor];
    self.searchBar.translucent = NO;
    self.searchBar.opaque = YES;
}

- (void) setupModel {
    self.searchModel = [AcronymSearchModel new];
    self.searchModel.delegate = self;
    [self.searchModel setupTableViewDelegate:self.tableView];
    [self.searchModel setupSearchBarDelegate:self.searchBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AcronymSearchModelDelegate
- (void)showProgressHud {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)hideProgressHud {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)reloadTable {
    [self.tableView reloadData];
}

- (void)hideKeyboard {
    [self.searchBar resignFirstResponder];
}

- (void)toggleNoResultsVisibility:(BOOL)hidden {
    self.noResultsLabel.hidden = hidden;
}

- (void)showErrorMessage {
    [[AlertManager sharedManager] showAlertInViewController:self withTitle:@"Request Error" messageBody:@"There was an error with the request, try again later."];
}

#pragma mark - Tap Recognizer
- (IBAction)viewTapped:(UITapGestureRecognizer *)sender {
    [self hideKeyboard];
}

@end
