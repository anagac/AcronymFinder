//
//  RESTBaseModel.h
//  AcronymFinder
//
//  Created by Andres Aguilar on 1/21/17.
//  Copyright © 2017 Andres Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFHTTPSessionManager.h>

@interface RESTBaseModel : NSObject

- (id) initWithJSONSetup;

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end
