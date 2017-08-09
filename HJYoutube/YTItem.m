//
//  YTItem.m
//  HJYoutube
//
//  Created by Hussein Jaber on 21/6/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import "YTItem.h"

@implementation YTItem

- (instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.kind = [json objectForKey:@"kind"];
        self.eTag = [json objectForKey:@"etag"];
        self.itemId = [[YTItemId alloc] initWithJson:json[@"id"]];
        self.snippet = [[YTSnippet alloc] initWithJson:json[@"snippet"]];
    }
    return self;
}

- (NSDictionary *)getOwnDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:self.kind forKey:@"kind"];
    [dict setObject:self.eTag forKey:@"etag"];
    [dict setObject:[self.itemId getOwnDictionary] forKey:@"id"];
    [dict setObject:[self.snippet getOwnDictionary] forKey:@"snippet"];

    return [dict copy];
}

@end
