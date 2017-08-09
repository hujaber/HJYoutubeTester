//
//  FavoritesViewController.m
//  HJYoutube
//
//  Created by Administrator on 6/22/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import "FavoritesViewController.h"
#import "UserDefaultsHelper.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "PlayerViewController.h"

@interface FavoritesViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *tableValues;
@property (strong, nonatomic) YTItem *selectedItem;

@end

NSString *const kCellID = @"FavCell";
NSString *const kSegueToPlayerID = @"seguePlayer";

@implementation FavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self setupValues];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupValues];
}

- (void)setupValues {
    NSMutableArray *itemsArray = [NSMutableArray new];
    NSArray *vidsArray = [UserDefaultsHelper getVideosArray];
    if (vidsArray.count) {
        for (NSDictionary *item in vidsArray) {
            YTItem *vidItem = [[YTItem alloc] initWithJson:item];
            [itemsArray addObject:vidItem];
        }
    }
    self.tableValues = [itemsArray copy];
    [self.tableView reloadData];
}

- (void)setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - TableView
#pragma mark DataSource 

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableValues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    YTItem *item = self.tableValues[indexPath.row];
    cell.textLabel.text = item.snippet.title;
    cell.textLabel.numberOfLines = 0;
    [cell.textLabel sizeToFit];
    [cell.imageView setShowActivityIndicatorView:YES];
    [cell.imageView setIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:item.snippet.thumbnails.mediumThumbnail.urlString] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

    }];
    return cell;
}

#pragma mark Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedItem = self.tableValues[indexPath.row];
    [self performSegueWithIdentifier:kSegueToPlayerID sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kSegueToPlayerID]) {
        PlayerViewController *vc = (PlayerViewController *)segue.destinationViewController;
        vc.videoId = self.selectedItem.itemId.videoId;
        vc.selectedItem = self.selectedItem;
    }
}

@end
