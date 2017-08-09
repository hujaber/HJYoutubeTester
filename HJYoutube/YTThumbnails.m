//
//  YTThumbnails.m
//  HJYoutube
//
//  Created by Hussein Jaber on 21/6/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import "YTThumbnails.h"

@implementation YTThumbnails

- (instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.defaultThumbnail = [[Default alloc] initWithJson:json[@"default"]];
        self.mediumThumbnail = [[Medium alloc] initWithJson:json[@"medium"]];
        self.highThumbnail = [[High alloc] initWithJson:json[@"high"]];
    }
    return self;
}

- (NSDictionary *)getOwnDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:[self.defaultThumbnail getOwnDictionary] forKey:@"default"];
    [dict setObject:[self.mediumThumbnail getOwnDictionary] forKey:@"medium"];
    [dict setObject:[self.highThumbnail getOwnDictionary] forKey:@"high"];
    return [dict copy];
}


@end

@implementation Default

- (instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.urlString = [json objectForKey:@"url"];
        self.width = [[json objectForKey:@"width"] integerValue];
        self.height = [[json objectForKey:@"height"] integerValue];
    }
    return self;
}

- (NSDictionary *)getOwnDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:self.urlString forKey:@"url"];
    [dict setObject:[NSString stringWithFormat:@"%lu", self.width] forKey:@"width"];
    [dict setObject:[NSString stringWithFormat:@"%lu", self.height] forKey:@"height"];
    return [dict copy];
}

@end

@implementation High

- (instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.urlString = [json objectForKey:@"url"];
        self.width = [[json objectForKey:@"width"] integerValue];
        self.height = [[json objectForKey:@"height"] integerValue];
    }
    return self;
}

- (NSDictionary *)getOwnDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:self.urlString forKey:@"url"];
    [dict setObject:[NSString stringWithFormat:@"%lu", self.width] forKey:@"width"];
    [dict setObject:[NSString stringWithFormat:@"%lu", self.height] forKey:@"height"];
    return [dict copy];
}

@end

@implementation Medium

- (instancetype)initWithJson:(NSDictionary *)json {
    self = [super init];
    if (self) {
        self.urlString = [json objectForKey:@"url"];
        self.width = [[json objectForKey:@"width"] integerValue];
        self.height = [[json objectForKey:@"height"] integerValue];
    }
    return self;
}

- (NSDictionary *)getOwnDictionary {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:self.urlString forKey:@"url"];
    [dict setObject:[NSString stringWithFormat:@"%lu", self.width] forKey:@"width"];
    [dict setObject:[NSString stringWithFormat:@"%lu", self.height] forKey:@"height"];
    return [dict copy];
}

@end
