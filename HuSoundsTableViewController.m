//
//  HuSoundsTableViewController.m
//  HawkSounds
//
//  Created by Hugey on 12/7/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import "HuSoundsTableViewController.h"
#import "HUSoundCell.h"

@interface HuSoundsTableViewController () {
    NSArray *records;
}

@end

@implementation HuSoundsTableViewController

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
    
    [self.navigationItem setTitle:@"Hawk Sounds"];
    
    records = @[
                @{@"name":@"Coopers Hawk",
                  @"sounds":@[
                        @{@"name":@"Distress", @"filename":@"Coopers_Hawk_Distress"},
                        @{@"name":@"Chick", @"filename":@"Coopers_Hawk_Chick"},
                        @{@"name":@"Food", @"filename":@"Coopers_Hawk_Food"},
                        @{@"name":@"Alarm", @"filename":@"Cooper_Hawk_Alarm"},
                        @{@"name":@"Near Nest", @"filename":@"Cooper_Hawk_Near_Nest"}
                    ]
                  },
                @{@"name":@"Sharp Shinned Hawk",
                  @"sounds":@[
                          @{@"name":@"Various", @"filename":@"Sharp_Shinned_Various"},
                          @{@"name":@"Squeaky", @"filename":@"Sharp_Shinned_Squeaky"},
                          @{@"name":@"Alarm Call", @"filename":@"Sharp_Shinned_Alarm_Call"}
                    ]
                  },
                @{@"name":@"Red Tailed Hawk",
                  @"sounds":@[
                        @{@"name":@"Scolding Call", @"filename":@"Red_Tailed_Hawk_Scolding_Call"},
                        @{@"name":@"Chick", @"filename":@"Red_Tailed_Hawk_Chick"},
                        @{@"name":@"Adult Scream", @"filename":@"Red_Tailed_Hawk_Adult_Scream"},
                        @{@"name":@"Scream", @"filename":@"Red_Tailed_Hawk_Scream"}
                    ]
                  }
                ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [records count];;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSDictionary *singleBird = records[section];
    NSArray *sounds = singleBird[@"sounds"];
    return [sounds count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return records[section][@"name"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"HawkCell";
    HUSoundCell *cell = (HUSoundCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell setupWithDictionary:records[indexPath.section][@"sounds"][indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end