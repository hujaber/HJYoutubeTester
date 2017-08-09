//
//  Requests.h
//  HJYoutube
//
//  Created by Hussein Jaber on 21/6/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTResponse.h"

@interface Requests : NSObject

+ (void)fetchVideosForSearchText:(NSString *)searchText completion:(void (^)(BOOL success, YTResponse *responseObject, NSError *error))block;

@end
