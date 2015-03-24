//
//  ViewController.m
//  SampleBroadcasterOSX
//
//  Created by James Wen on 3/24/15.
//  Copyright (c) 2015 videocore. All rights reserved.
//

#import "ViewController.h"

#import <VideoCore/api/OSX/VCSimpleSession.h>

@interface ViewController () <VCSessionDelegate>
@property (nonatomic, retain) VCSimpleSession* session;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _session = [[VCSimpleSession alloc] initWithVideoSize:CGSizeMake(1280, 720) frameRate:30 bitrate:1000000 useInterfaceOrientation:NO];
    
    [self.previewView addSubview:_session.previewView];
    _session.previewView.frame = self.previewView.bounds;
    _session.delegate = self;
}


- (IBAction)btnConnectTouch:(id)sender {
    
    switch(_session.rtmpSessionState) {
        case VCSessionStateNone:
        case VCSessionStatePreviewStarted:
        case VCSessionStateEnded:
        case VCSessionStateError:
            [_session startRtmpSessionWithURL:@"rtmp://192.168.1.151/live" andStreamKey:@"myStream"];
            break;
        default:
            [_session endRtmpSession];
            break;
    }
}

- (void) connectionStatusChanged:(VCSessionState) state
{
    switch(state) {
        case VCSessionStateStarting:
            [self.previewButton setTitle:@"Connecting"];
            break;
        case VCSessionStateStarted:
            [self.previewButton setTitle:@"Disconnect"];
            break;
        default:
            [self.previewButton setTitle:@"Connect"];
            break;
    }
}

- (IBAction)recordBtnPressed:(id)sender {
    NSLog(@"recordBtn Pressed");
}

@end
