//
//  PlayersViewController.m
//  Storyboards_Demo
//
//  Created by Transuner on 15-3-19.
//  Copyright (c) 2015年 广州传讯信息科技有限公司. All rights reserved.
//

#import "PlayersViewController.h"
#import "Player.h"
#import "PlayerCell.h"
#import "PlayerDetailsViewController.h"
@interface PlayersViewController ()<PlayerDetailsViewControllerDelegate>

@end

@implementation PlayersViewController
@synthesize players;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.players.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlayerCell * cell = (PlayerCell*)[tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
    
    Player * player = (self.players)[indexPath.row];
    cell.nameLabel.text = player.name;
    cell.gameLabel.text = player.game;
    cell.ratingImageView.image = [self imageForRating:player.rating];
    
    return cell;
}

- (UIImage *)imageForRating:(int)rating
{
    switch (rating) {
        case 1:
            return [UIImage imageNamed:@"1StarSmall"];
            break;
            case 2:
            return [UIImage imageNamed:@"2StarsSmall"];
            break;
            case 3:
            return [UIImage imageNamed:@"3StarsSmall"];
            break;
            case 4:
            return [UIImage imageNamed:@"4StarsSmall"];
            break;
            case 5:
            return [UIImage imageNamed:@"5StarsSmall"];
            break;
        default:
            break;
    }
    return nil;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddPlayer"]) {
        
        UINavigationController * navigat = segue.destinationViewController;
        
        PlayerDetailsViewController * playerDetailsViewController = [navigat viewControllers][0];
        
        playerDetailsViewController.delegate = self;
        
    }
}
- (void)playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)playerDetailsViewController:(PlayerDetailsViewController *)controller didAddPlayer:(Player *)player
{
    [self.players addObject:player];
    
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:self.players.count-1 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
