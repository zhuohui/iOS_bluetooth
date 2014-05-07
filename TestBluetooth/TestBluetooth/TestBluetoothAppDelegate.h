//
//  TestBluetoothAppDelegate.h
//  TestBluetooth
//
//  Created by zhaoxy on 11-10-11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestBluetoothViewController;

@interface TestBluetoothAppDelegate : NSObject <UIApplicationDelegate>
{
    NSArray *pMusicPage;
}

-(void)ctrlBluetooth:(BOOL)bset;

- (IBAction)StartBt:(id)sender;

- (IBAction)StopBt:(id)sender;

@property BOOL bBlueSet;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TestBluetoothViewController *viewController;




@end
