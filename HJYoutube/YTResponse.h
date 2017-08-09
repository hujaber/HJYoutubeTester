//
//  YTResponse.h
//  HJYoutube
//
//  Created by Hussein Jaber on 21/6/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTResponse : NSObject

@property (nonatomic, strong) NSString *kind;
@property (nonatomic, strong) NSString *eTag;
/**
 Send this as a parameter to get the contents of the next page of a query
 */
@property (nonatomic, strong) NSString *nextPageToken;
@property (nonatomic, strong) NSString *regionCode;
@property (nonatomic, strong) NSArray *items;

- (instancetype)initWithJson:(NSDictionary *)json;

@end
