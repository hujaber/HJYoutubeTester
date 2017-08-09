//
//  YTSnippet.h
//  HJYoutube
//
//  Created by Hussein Jaber on 21/6/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTThumbnails.h"

@interface YTSnippet : NSObject

@property (strong, nonatomic) NSString *publishedAt;
@property (strong, nonatomic) NSString *channelId;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *snippetDescription;
@property (strong, nonatomic) NSString *channelTitle;
@property (strong, nonatomic) NSString *liveBroadcastContent;

@property (strong, nonatomic) YTThumbnails *thumbnails;

- (instancetype)initWithJson:(NSDictionary *)json;
- (NSDictionary *)getOwnDictionary;


@end
