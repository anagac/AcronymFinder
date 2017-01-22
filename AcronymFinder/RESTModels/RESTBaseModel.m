//
//  RESTBaseModel.m
//  AcronymFinder
//
//  Created by Andres Aguilar on 1/21/17.
//  Copyright © 2017 Andres Aguilar. All rights reserved.
//

#import "RESTBaseModel.h"

NSString *const BaseUrl = @"https://www.nactem.ac.uk/software/acromine/";

@interface RESTBaseModel ()


@end

@implementation RESTBaseModel

- (id) initWithJSONSetup {
    self = [super init];
    if(self) {
        [self jsonSetup];
    }
    return self;
}

- (void) jsonSetup {
    NSURL *baseURL = [NSURL URLWithString:BaseUrl];
    
    self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
}

@end
