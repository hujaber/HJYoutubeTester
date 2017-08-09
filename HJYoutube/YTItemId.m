//
//  YTItemId.m
//  HJYoutube
//
//  Created by Hussein Jaber on 21/6/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import "YTItemId.h"

@implementation YTItemId

- (instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.kind = [json objectForKey:@"kind"];
        self.videoId = [json objectForKey:@"videoId"];
    }
    return self;
}

- (NSDictionary *)getOwnDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:self.kind forKey:@"kind"];
    [dict setObject:self.videoId forKey:@"videoId"];
    return [dict copy];
}

@end
