//
//  VideosTableViewCell.h
//  HJYoutube
//
//  Created by Administrator on 6/21/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTItem.h"

@interface VideosTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

- (void)setCellWithItem:(YTItem *)item;
@end
