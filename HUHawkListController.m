//
//  HUHawkListController.m
//  HawkSounds
//
//  Created by Hugey on 12/7/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import "HUHawkListController.h"
@import AVFoundation;

@interface HUHawkListController () {
    NSArray *records;
}

@end

@implementation HUHawkListController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.navigationItem setTitle:@"Hawk Sounds"];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Coopers_Hawk_Distress" ofType:@"mp3"];
    NSURL *url = [NSURL URLWithString:path];
    NSLog(@"url = %@", url);
    NSError *error = nil;
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    NSLog(@"error = %@", [error description]);
    
    
    
    [player play];
    
    records = @[@{@"name":@"goose"}];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [records count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"HawkCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UILabel *label = (UILabel*)[cell viewWithTag:21];
    label.text = [records[indexPath.row] objectForKey:@"name"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Cooper_Hawk_Distress" ofType:@"mp3"];
    NSURL *url = [NSURL URLWithString:path];
    NSError *error = nil;
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    NSLog(@"error = %@", [error description]);
    
    
    
    [player play];
}

@end
