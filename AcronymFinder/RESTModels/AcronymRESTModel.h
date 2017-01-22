//
//  AcronymRESTModel.h
//  AcronymFinder
//
//  Created by Andres Aguilar on 1/21/17.
//  Copyright © 2017 Andres Aguilar. All rights reserved.
//

#import "RESTBaseModel.h"

@protocol AcronymRestModelDelegate;

@interface AcronymRESTModel : RESTBaseModel

@property (weak, nonatomic) id<AcronymRestModelDelegate> delegate;
-(void) getMeaningsForAcronym:(NSString *)acronym;

@end


@protocol AcronymRestModelDelegate <NSObject>

- (void) acronymRestModelDidRetrieveMeanings:(NSArray *)meanings;
@optional
- (void) acronymRestModelDidFailWithError:(NSError *)error;

@end