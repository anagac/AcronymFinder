//
//  TableViewDataSource.h
//  AcronymFinder
//
//  Created by Andres Aguilar on 1/21/17.
//  Copyright © 2017 Andres Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface AcronymTableViewDataSource : NSObject <UITableViewDelegate, UITableViewDataSource>

- (void) setNewAcronymList:(NSArray *)newList;

@end
