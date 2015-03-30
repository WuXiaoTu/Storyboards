//
//  GamePickerViewController.h
//  Storyboards_Demo
//
//  Created by Transuner on 15-3-20.
//  Copyright (c) 2015年 广州传讯信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  GamePickerViewController;

@protocol GamePickerViewControllerDelegate <NSObject>

- (void) gamePickerViewController:(GamePickerViewController*)controller didSelectGame:(NSString*)game;

@end
@interface GamePickerViewController : UITableViewController


@property (nonatomic,weak)id <GamePickerViewControllerDelegate>delegate;

@property (nonatomic,strong) NSString * game;

@end
