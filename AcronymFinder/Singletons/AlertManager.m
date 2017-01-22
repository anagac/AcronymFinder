//
//  AlertManager.m
//  AcronymFinder
//
//  Created by Andres Aguilar on 1/22/17.
//  Copyright © 2017 Andres Aguilar. All rights reserved.
//

#import "AlertManager.h"

@implementation AlertManager

+ (id) sharedManager {
    static dispatch_once_t onceToken;
    static AlertManager *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AlertManager alloc] init];
    });
    return sharedInstance;
}

- (void) showAlertInViewController:(UIViewController*)viewController withTitle:(NSString *)title messageBody:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:@"Ok"
                               style:UIAlertActionStyleDefault
                               handler:nil];

    [alertController addAction:okAction];
    
    [viewController presentViewController:alertController animated:YES completion:nil];
    
}

@end
