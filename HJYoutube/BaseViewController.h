//
//  BaseViewController.h
//  HJYoutube
//
//  Created by Administrator on 6/21/17.
//  Copyright © 2017 Hussein Jaber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserDefaultsHelper.h"

@interface BaseViewController : UIViewController

- (void)showLoader;
- (void)hideLoader;
- (void)showAlertWithTitle:(NSString *)title message:(NSString *)msg;

@end
