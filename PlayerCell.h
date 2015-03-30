//
//  PlayerCell.h
//  Storyboards_Demo
//
//  Created by Transuner on 15-3-20.
//  Copyright (c) 2015年 广州传讯信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *ratingImageView;
@end
