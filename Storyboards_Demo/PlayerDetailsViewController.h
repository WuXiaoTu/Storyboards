//
//  PlayerDetailsViewController.h
//  Storyboards_Demo
//
//  Created by Transuner on 15-3-20.
//  Copyright (c) 2015年 广州传讯信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "GamePickerViewController.h"
@class PlayerDetailsViewController;

@protocol PlayerDetailsViewControllerDelegate <NSObject>

- (void) playerDetailsViewControllerDidCancel:(PlayerDetailsViewController*)controller;
- (void) playerDetailsViewController:(PlayerDetailsViewController*)controller didAddPlayer:(Player*)player;
@end

@interface PlayerDetailsViewController : UITableViewController<GamePickerViewControllerDelegate>

@property (nonatomic,weak)id <PlayerDetailsViewControllerDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *done;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITableViewCell *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (weak, nonatomic) IBOutlet UILabel *LabelOne;

@end
