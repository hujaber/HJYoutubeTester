//
//  ViewController.m
//  HJYoutube
//
//  Created by Hussein Jaber on 21/6/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import "ViewController.h"
#import "Requests.h"
#import "YTItem.h"
#import "VideosTableViewCell.h"
#import "PlayerViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *videoItems;
@property (strong, nonatomic) YTItem *selectedItem;

@property (nonatomic, strong) UIBarButtonItem *searchItem;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

NSString *const kCellId = @"Cell";
NSString *const kSegueID = @"segueToPlayer";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTableView];
    [self fetchVideosWithText:nil];
    [self setupSearchButton];
    [self setupSearchBar];

}

- (void)setupTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorColor = [UIColor blackColor];
}

- (void)setupSearchButton {
    self.searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchButtonTapped:)];
    self.navigationItem.rightBarButtonItem = self.searchItem;
}

- (void)setupSearchBar {
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.showsCancelButton = YES;
    self.searchBar.delegate = self;
    self.searchBar.tintColor = [UIColor redColor];
}

- (void)fetchVideosWithText:(NSString *)searchText {
    [self showLoader];
    if (!searchText) {
        searchText = @"iOS";
    }
    [Requests fetchVideosForSearchText:searchText completion:^(BOOL success, YTResponse *responseObject, NSError *error) {
        [self hideLoader];
        if (success && !error) {
            self.videoItems = responseObject.items;
            [self.tableView reloadData];
        } else {
            [self showAlertWithTitle:@"" message:error.localizedDescription];
        }
    }];
}

- (void)searchButtonTapped:(id)sender {

    [UIView animateWithDuration:0.3 animations:^{
        // self.searchItem.alpha = 0.0f;
        
    } completion:^(BOOL finished) {
        
        self.navigationItem.rightBarButtonItem = nil;
        self.searchBar.alpha = 0.0;
        self.navigationItem.titleView = _searchBar;

        [UIView animateWithDuration:0.3
                         animations:^{
                             self.searchBar.alpha = 1.0;
                         } completion:^(BOOL finished) {
                             [_searchBar becomeFirstResponder];
                         }];
    }];
}



#pragma mark UISearchBarDelegate methods
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {

    [UIView animateWithDuration:0.5f animations:^{
        self.searchBar.alpha = 0.0;
    } completion:^(BOOL finished) {
        self.navigationItem.titleView = nil;
        self.navigationItem.rightBarButtonItem = self.searchItem;
//        [UIView animateWithDuration:0.5f animations:^ {
//         //   _searchButton.alpha = 1.0;
//        }];
    }];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar endEditing:YES];
    [searchBar resignFirstResponder];
    if (searchBar.text.length) {
        [self fetchVideosWithText:searchBar.text];
    }
}

#pragma mark - TableView
#pragma mark DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideosTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
    YTItem *item = self.videoItems[indexPath.row];
    [cell setCellWithItem:item];
    return cell;
}

#pragma mark Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedItem = self.videoItems[indexPath.row];
    [self performSegueWithIdentifier:kSegueID sender:self];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kSegueID]) {
        PlayerViewController *vc = (PlayerViewController *)segue.destinationViewController;
        vc.videoId = self.selectedItem.itemId.videoId;
        vc.selectedItem = self.selectedItem;
    }
}

@end
