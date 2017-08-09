//
//  YTSnippet.m
//  HJYoutube
//
//  Created by Hussein Jaber on 21/6/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import "YTSnippet.h"

@implementation YTSnippet

- (instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.publishedAt = [json objectForKey:@"publishedAt"];
        self.channelId = [json objectForKey:@"channelId"];
        self.title = [json objectForKey:@"title"];
        self.snippetDescription = [json objectForKey:@"description"];
        self.thumbnails = [[YTThumbnails alloc] initWithJson:json[@"thumbnails"]];
        self.channelTitle = [json objectForKey:@"channelTitle"];
        self.liveBroadcastContent = [json objectForKey:@"liveBroadcastContent"];
    }
    return self;
}


- (NSDictionary *)getOwnDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:self.publishedAt forKey:@"publishedAt"];
    [dict setObject:self.channelId forKey:@"channelId"];
    [dict setObject:self.title forKey:@"title"];
    [dict setObject:self.snippetDescription forKey:@"description"];
    [dict setObject:self.channelTitle forKey:@"channelTitle"];
    [dict setObject:self.liveBroadcastContent forKey:@"liveBroadcastContent"];
    [dict setObject:[self.thumbnails getOwnDictionary] forKey:@"thumbnails"];
    return [dict copy];
}

@end
