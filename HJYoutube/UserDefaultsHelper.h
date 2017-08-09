//
//  UserDefaultsHelper.h
//  HJYoutube
//
//  Created by Administrator on 6/22/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTItem.h"


@interface UserDefaultsHelper : NSObject

+ (BOOL)addVideoToFavorites:(YTItem *)item;
+ (NSArray *)getVideosArray;

@end
