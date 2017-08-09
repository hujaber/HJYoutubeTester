//
//  Requests.m
//  HJYoutube
//
//  Created by Hussein Jaber on 21/6/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import "Requests.h"
#import <AFNetworking.h>


static NSString *const baseURL = @"";
static NSString *const APIKey = @"AIzaSyDeNsz7Lo0qsUzytQy-iP8Msd_LIWONjT8";

@implementation Requests

+ (void)getRequestWithURL:(NSString *)urlString parameters:(NSDictionary *)parameters headers:(NSDictionary *)headers completionBlock:(void(^)(id responseObject, NSError *error, NSInteger httpStatusCode))block {
    NSError *error;
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlString parameters:parameters error:&error];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [[manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (block) {
            block(responseObject, error, httpResponse.statusCode);
        }
    }] resume];
}

+ (void)fetchVideosForSearchText:(NSString *)searchText completion:(void (^)(BOOL success, YTResponse *responseObject, NSError *error))block {
    NSString *urlString = [NSString stringWithFormat:@"https://www.googleapis.com/youtube/v3/search?part=snippet&q=%@&type=%@&key=%@&maxResults=20", searchText, @"video", APIKey];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self getRequestWithURL:urlString parameters:nil headers:nil completionBlock:^(id responseObject, NSError *error, NSInteger httpStatusCode) {
        if (httpStatusCode == 200 && !error) {
            YTResponse *response = [[YTResponse alloc] initWithJson:responseObject];
            if (block) {
                block(YES, response, nil);
            }
        } else {
            if (block) {
                block(NO, nil, error);
            }
        }
    }];
    
}



@end
