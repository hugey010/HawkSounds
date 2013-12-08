//
//  HUSoundCell.h
//  HawkSounds
//
//  Created by Hugey on 12/8/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface HUSoundCell : UITableViewCell

@property (nonatomic, strong) AVAudioPlayer *player;

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *playPauseButton;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


-(void)setupWithDictionary:(NSDictionary*)data;

- (IBAction)playPauseButtonPressed:(id)sender;
- (IBAction)sliderValueChanged:(id)sender;

@end
