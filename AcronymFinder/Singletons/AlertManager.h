//
//  AlertManager.h
//  AcronymFinder
//
//  Created by Andres Aguilar on 1/22/17.
//  Copyright © 2017 Andres Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertManager : NSObject

+ (id) sharedManager;
- (void) showAlertInViewController:(UIViewController*)viewController withTitle:(NSString *)title messageBody:(NSString *)message;

@end
