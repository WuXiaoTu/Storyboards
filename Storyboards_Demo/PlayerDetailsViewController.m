//
//  PlayerDetailsViewController.m
//  Storyboards_Demo
//
//  Created by Transuner on 15-3-20.
//  Copyright (c) 2015年 广州传讯信息科技有限公司. All rights reserved.
//

#import "PlayerDetailsViewController.h"
@interface PlayerDetailsViewController ()
{
    NSString  *_game;
}
@end

@implementation PlayerDetailsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        NSLog(@"init PlayerDetailsViewController");
        
        _game = @"Chess";
    }
    return self;
}
- (void)dealloc
{
    NSLog(@"dealloc PlayerDetailsViewController");
}
- (IBAction)cancel:(id)sender {
    
    [self.delegate playerDetailsViewControllerDidCancel:self];
}
- (IBAction)done:(id)sender {
    
    Player * player = [[Player alloc]init];
    player.name = self.nameTextField.text;
    player.game = _game;
    player.rating = 1;
    
    [self.delegate playerDetailsViewController:self didAddPlayer:player];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.LabelOne.text = _game;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.nameTextField becomeFirstResponder];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickGame"]) {
        
        GamePickerViewController * gamePickerViewController = segue.destinationViewController;
        
        gamePickerViewController.delegate = self;
        gamePickerViewController.game = _game;
        
    }
}
- (void)gamePickerViewController:(GamePickerViewController *)controller didSelectGame:(NSString *)game
{
    _game = game;
    
    self.LabelOne.text = _game;
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


@end
