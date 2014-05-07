//
//  TestBluetoothViewController.h
//  TestBluetooth
//
//  Created by zhaoxy on 11-10-11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestBluetoothViewController : UIViewController
{
    NSArray *pickerArray;
 
}

-(NSInteger)getSelMusic;

@property (retain, nonatomic) IBOutlet UIView *bkview;
@property (nonatomic,retain) IBOutlet UIPickerView *musicPickerView;
@property (retain, nonatomic) IBOutlet UIButton *startbt;

@end
