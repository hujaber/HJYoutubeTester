//
//  VideosTableViewCell.m
//  HJYoutube
//
//  Created by Administrator on 6/21/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import "VideosTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation VideosTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.numberOfLines = 1;
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.infoLabel.numberOfLines = 1;
    self.infoLabel.adjustsFontSizeToFitWidth = YES;
    self.thumbnailImageView.layer.cornerRadius = 5;
    self.thumbnailImageView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.thumbnailImageView.layer.borderWidth = 0.2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)setCellWithItem:(YTItem *)item {
    self.titleLabel.text = item.snippet.title;
    self.infoLabel.text = item.snippet.channelTitle;
    [self.thumbnailImageView setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.thumbnailImageView setShowActivityIndicatorView:YES];
    [self.thumbnailImageView sd_setImageWithURL:[NSURL URLWithString:item.snippet.thumbnails.highThumbnail.urlString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

    }];
}

@end
