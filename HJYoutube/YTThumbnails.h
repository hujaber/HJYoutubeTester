//
//  YTThumbnails.h
//  HJYoutube
//
//  Created by Hussein Jaber on 21/6/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Default : NSObject

@property (nonatomic, strong) NSString *urlString;
@property (nonatomic) NSUInteger width;
@property (nonatomic) NSUInteger height;

- (instancetype)initWithJson:(NSDictionary *)json;
- (NSDictionary *)getOwnDictionary;
@end


@interface Medium : NSObject

@property (nonatomic, strong) NSString *urlString;
@property (nonatomic) NSUInteger width;
@property (nonatomic) NSUInteger height;
- (instancetype)initWithJson:(NSDictionary *)json;
- (NSDictionary *)getOwnDictionary;
@end

@interface High : NSObject

@property (nonatomic, strong) NSString *urlString;
@property (nonatomic) NSUInteger width;
@property (nonatomic) NSUInteger height;
- (instancetype)initWithJson:(NSDictionary *)json;
- (NSDictionary *)getOwnDictionary;

@end

@interface YTThumbnails : NSObject

@property (strong, nonatomic) Default *defaultThumbnail;
@property (strong, nonatomic) Medium *mediumThumbnail;
@property (strong, nonatomic) High *highThumbnail;
- (instancetype)initWithJson:(NSDictionary *)json;
- (NSDictionary *)getOwnDictionary;

@end
