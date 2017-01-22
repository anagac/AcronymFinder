//
//  AcronymRESTModel.m
//  AcronymFinder
//
//  Created by Andres Aguilar on 1/21/17.
//  Copyright © 2017 Andres Aguilar. All rights reserved.
//

#import "AcronymRESTModel.h"

NSString *const UrlPath = @"dictionary.py";

@implementation AcronymRESTModel

- (id) init {
    self = [super initWithJSONSetup];
    return self;
}

-(void) getMeaningsForAcronym:(NSString *)acronym {
   
    NSDictionary *parameters = @{@"sf":acronym};
    
    [self.sessionManager
     GET:UrlPath
     parameters: parameters
     success:^(NSURLSessionDataTask *task, id responseObject) {
         NSArray *meanings = [self parseResponse:responseObject];
         if([self.delegate respondsToSelector:@selector(acronymRestModelDidRetrieveMeanings:)]) {
             [self.delegate acronymRestModelDidRetrieveMeanings:meanings];
         }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if([self.delegate respondsToSelector:@selector(acronymRestModelDidFailWithError:)]) {
            [self.delegate acronymRestModelDidFailWithError:error];
        }
    }];
    
}

- (NSArray *)parseResponse: (id) response {
    NSMutableArray *results = [NSMutableArray new];
    NSError *error;
    NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableContainers error:&error];
    if(responseArray.count>0) {
        NSDictionary *responseDict = responseArray[0];
        NSArray *meaningsArray = [responseDict objectForKey:@"lfs"];
        for(NSInteger i=0;i<meaningsArray.count; i++) {
            NSDictionary *entryDict = meaningsArray[i];
            NSString *meaning = [entryDict objectForKey:@"lf"];
            [results addObject:meaning];
        }
    }
    return [results copy];
}

@end
