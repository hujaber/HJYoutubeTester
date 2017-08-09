//
//  UserDefaultsHelper.m
//  HJYoutube
//
//  Created by Administrator on 6/22/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import "UserDefaultsHelper.h"

NSString *const kVidArrayKey = @"userDefaultsVideosArray";

@implementation UserDefaultsHelper

+ (BOOL)addVideoToFavorites:(YTItem *)item {
    NSDictionary *itemDictionary = [item getOwnDictionary];
    if ([self getVideosArray]) {
        for (NSDictionary *vidz in [self getVideosArray]) {
            YTItem *prot = [[YTItem alloc] initWithJson:vidz];
            if ([prot.itemId.videoId isEqualToString:item.itemId.videoId]) {
                return NO;
            }
        }
        NSMutableArray *existingArray = [[self getVideosArray] mutableCopy];
        [existingArray addObject:itemDictionary];
        [self saveVideosArray:existingArray];
        return YES;
    } else {
        NSMutableArray *newArray = [NSMutableArray new];
        [newArray addObject:itemDictionary];
        [self saveVideosArray:newArray];
        return YES;
    }
}

+ (NSArray *)getVideosArray {
    return [[NSUserDefaults standardUserDefaults] objectForKey:kVidArrayKey];
}

+ (void)saveVideosArray:(NSArray *)vidArray {
    [[NSUserDefaults standardUserDefaults] setObject:vidArray forKey:kVidArrayKey];
}


@end
