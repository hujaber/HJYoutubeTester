//
//  YTItemId.h
//  HJYoutube
//
//  Created by Hussein Jaber on 21/6/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTItemId : NSObject

@property (nonatomic, strong) NSString *kind;
@property (nonatomic, strong) NSString *videoId;

- (instancetype)initWithJson:(NSDictionary *)json;
- (NSDictionary *)getOwnDictionary;
@end
