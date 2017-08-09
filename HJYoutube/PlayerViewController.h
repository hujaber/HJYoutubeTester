//
//  PlayerViewController.h
//  HJYoutube
//
//  Created by Administrator on 6/21/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import "BaseViewController.h"
#import "YTItem.h"

@interface PlayerViewController : BaseViewController

@property (nonatomic, strong) NSString *videoId;
@property (nonatomic, strong) YTItem *selectedItem;

@end
