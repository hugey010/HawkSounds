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
    
    UIImageView *hawkImageView;
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
    
    [self setupHawkBird];
    
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
                  },
                @{@"name":@"Ferruginous Hawk",
                  @"sounds":@[
                          @{@"name":@"Call", @"filename":@"ferriginous_call"}
                    ]
                  },
                @{@"name":@"American Kestrel",
                  @"sounds":@[
                          @{@"name":@"Klee", @"filename":@"kestrel_klee"},
                          @{@"name":@"Chatter", @"filename":@"american_kestrel_chatter"}
                    ]
                  },
                @{@"name":@"American Bald Eagle",
                  @"sounds":@[
                          @{@"name":@"Chatter", @"filename":@"bald_eagle_chatter"},
                          @{@"name":@"Low Kuk", @"filename":@"bald_eagle_lowkuk"},
                          @{@"name":@"Peal", @"filename":@"bald_eagle_peal"},
                          @{@"name":@"Juvenile Peal", @"filename":@"bald_eagle_juvenile_peal"},
                          @{@"name":@"Juvenile Begging", @"filename":@"bald_eagle_juvenile_begging"}
                    ]
                  },
                @{@"name":@"Osprey (Sea Hawk)",
                  @"sounds":@[
                          @{@"name":@"Call", @"filename":@"osprey"}
                          ]
                  },
                @{@"name":@"Merlin (Lady Hawk)",
                  @"sounds":@[
                          @{@"name":@"Typical", @"filename":@"merlin"}
                          ]
                  },
                @{@"name":@"Generic Hawks",
                  @"sounds":@[
                          @{@"name":@"Screech Echo", @"filename":@"hawk_screeching"},
                          @{@"name":@"Screech 2", @"filename":@"generic_hawk_1"},
                          @{@"name":@"Another Screech", @"filename":@"generic_hawk_2"},
                          @{@"name":@"Screech Valley", @"filename":@"hawk_screeching_valley"}
                          ]
                  },
                ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [records count];;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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

-(void)setupHawkBird {
    UIImage *image = [UIImage imageNamed:@"spreadeagle_400.png"];
    hawkImageView = [[UIImageView alloc] initWithImage:image]; //initWithFrame:CGRectMake(0, 0, 400, 400)];
    hawkImageView.transform = CGAffineTransformMakeRotation(190.0 * M_PI / 180.0);
    [hawkImageView setFrame:CGRectMake(-400, -400, 400, 400)];
    [self.navigationController.view addSubview:hawkImageView];
    
    [self performSelector:@selector(doHawkBirdAnimation) withObject:nil afterDelay:((arc4random()%500) / 100.0f)];
}

-(void)doHawkBirdAnimation {
    [hawkImageView setFrame:CGRectMake(-400, -400, 400, 400)];
    [self.navigationController.view bringSubviewToFront:hawkImageView];

    [UIView animateWithDuration:5.0 animations:^{
        [hawkImageView setFrame:CGRectMake(400, 400, 400, 400)];

    }];
    
    [self performSelector:@selector(doHawkBirdAnimation) withObject:nil afterDelay:((arc4random()%1000) / 100.0f) + 8];

}

@end
