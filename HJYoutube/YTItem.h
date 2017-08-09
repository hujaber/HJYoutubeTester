//
//  YTItem.h
//  HJYoutube
//
//  Created by Hussein Jaber on 21/6/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTItemId.h"
#import "YTSnippet.h"

@interface YTItem : NSObject

@property (strong, nonatomic) NSString *eTag;
@property (strong, nonatomic) NSString *kind;

@property (strong, nonatomic) YTItemId *itemId;
@property (strong, nonatomic) YTSnippet *snippet;

- (instancetype)initWithJson:(NSDictionary *)json;
- (NSDictionary *)getOwnDictionary;
@end
