//
//  YTResponse.m
//  HJYoutube
//
//  Created by Hussein Jaber on 21/6/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import "YTResponse.h"
#import "YTItem.h"

@implementation YTResponse

- (instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.kind = [json objectForKey:@"kind"];
        self.eTag = [json objectForKey:@"etag"];
        self.nextPageToken = [json objectForKey:@"nextPageToken"];
        self.regionCode = [json objectForKey:@"regionCode"];
        NSMutableArray *items = [NSMutableArray new];
        for (NSDictionary *itemDictionary in json[@"items"]) {
            YTItem *item = [[YTItem alloc] initWithJson:itemDictionary];
            [items addObject:item];
        }
        
        self.items = [items copy];
    }
    
    return self;
}

@end
