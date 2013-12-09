//
//  HUSoundCell.m
//  HawkSounds
//
//  Created by Hugey on 12/8/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import "HUSoundCell.h"

@interface HUSoundCell() {
    //NSURL *url;
    NSTimeInterval audioDurationSeconds;
    NSTimeInterval currentPlayTime;
    NSTimer *timer;

}

@end

@implementation HUSoundCell

-(void)dealloc {
    self.player.delegate = nil;
}

-(void)setupWithDictionary:(NSDictionary *)data {
    currentPlayTime = 0;
    [self.slider setValue:0];
    [self.timeLabel setText:@"0:00"];
    [self.playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
    
    self.label.text = data[@"name"];
    NSString *filename = data[@"filename"];
    NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@"mp3"];
    NSURL *url = [NSURL URLWithString:path];
    
    NSError *error = nil;
    self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [self.player prepareToPlay];
    audioDurationSeconds = self.player.duration;
    self.player.delegate = self;
}

- (IBAction)playPauseButtonPressed:(id)sender {
    
    if (self.player.isPlaying) {
        // already playing
        [self.player pause];
        [timer invalidate];
        [self.playPauseButton setTitle:@"Play" forState:UIControlStateNormal];

    } else {
        [self.player play];
        timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
        [self.playPauseButton setTitle:@"Pause" forState:UIControlStateNormal];

    }
}

-(void)updateTime {
    int minutes = self.player.currentTime / 60;
    int seconds = (int)self.player.currentTime % 60;
    [self.timeLabel setText:[NSString stringWithFormat:@"%d:%02d", minutes, seconds]];
    
    self.slider.value = self.player.currentTime / audioDurationSeconds;
    
}

- (IBAction)sliderValueChanged:(id)sender {
    
    currentPlayTime = self.slider.value * audioDurationSeconds;
    [self.player setCurrentTime:currentPlayTime];

    int minutes = currentPlayTime / 60;
    int seconds = (int)currentPlayTime % 60;
    [self.timeLabel setText:[NSString stringWithFormat:@"%d:%02d", minutes, seconds]];
    
}

#pragma AVAudioPlayerDelegate methods
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    [timer invalidate];
    [self.playPauseButton setTitle:@"Play" forState:UIControlStateNormal];
    self.slider.value = 0;
}

@end
