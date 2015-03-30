//
//  GamePickerViewController.m
//  Storyboards_Demo
//
//  Created by Transuner on 15-3-20.
//  Copyright (c) 2015年 广州传讯信息科技有限公司. All rights reserved.
//

#import "GamePickerViewController.h"

@interface GamePickerViewController ()
{
    NSArray *_games;
    
    NSUInteger _selectedIndex;
}
@end

@implementation GamePickerViewController

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
    
    _games = @[@"Angry Birds",@"Russian Roulette",@"Spin the Bottle",@"Texas Hold'em Poker",@"Tic-Tac-Toe"];
    
    _selectedIndex = [_games indexOfObject:self.game];
    
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
    return _games.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GameCell"];
    
    cell.textLabel.text = _games[indexPath.row];
    
    if (indexPath.row == _selectedIndex) {
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"_selectedIndex__%d",_selectedIndex);

    if (_selectedIndex!=NSNotFound) {
        
        UITableViewCell * cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:_selectedIndex inSection:0]];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    _selectedIndex = indexPath.row;
    
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    NSString * game = _games[indexPath.row];
    
    [self.delegate gamePickerViewController:self didSelectGame:game];
    
    
}

@end
