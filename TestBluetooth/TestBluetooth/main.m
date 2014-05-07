//
//  main.m
//  TestBluetooth
//
//  Created by zhaoxy on 11-10-11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestBluetoothAppDelegate.h"

int main(int argc, char *argv[])
{
    /*
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;
    */
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([TestBluetoothAppDelegate class]));
    }

}
