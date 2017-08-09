//
//  PlayerViewController.m
//  HJYoutube
//
//  Created by Administrator on 6/21/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import "PlayerViewController.h"
#import <YTPlayerView.h>

@interface PlayerViewController ()<YTPlayerViewDelegate>
@property (weak, nonatomic) IBOutlet YTPlayerView *playerView;

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playerView.delegate = self;
    [self.playerView loadWithVideoId:self.videoId];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playVidz) name:@"play" object:nil];

}

- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state {
    if (state == kYTPlayerStatePaused && [UIApplication sharedApplication].applicationState != UIApplicationStateActive) {
        [playerView playVideo];
    }
}




- (void)playVidz {
    if (self.playerView.playerState == kYTPlayerStatePlaying) {
        [self.playerView playVideo];
    }
}
- (IBAction)addToFavorites:(UIButton *)sender {
    if ([UserDefaultsHelper addVideoToFavorites:self.selectedItem]) {
        [self showAlertWithTitle:@"" message:@"Added to favorites"];
    } else {
        [self showAlertWithTitle:@"" message:@"Already in favorites"];
    }
}


@end
