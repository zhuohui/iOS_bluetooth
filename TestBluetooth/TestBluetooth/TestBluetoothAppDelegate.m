//
//  TestBluetoothAppDelegate.m
//  TestBluetooth
//
//  Created by zhaoxy on 11-10-11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TestBluetoothAppDelegate.h"

#import "TestBluetoothViewController.h"

@implementation TestBluetoothAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
     
#if TARGET_IPHONE_SIMULATOR
   // exit( EXIT_SUCCESS ) ;
#else
    /* this works in iOS 4.2.3 */
    //Class BluetoothManager = objc_getClass( "BluetoothManager" ) ;
   // id btCont = [BluetoothManager sharedInstance] ;
    //[self performSelector:@selector(toggle:) withObject:btCont afterDelay:1.0f] ;
#endif
    pMusicPage = [NSArray arrayWithObjects:@"no", @"qqmusic://", @"music:", @"neteasemusic://",nil];
    [pMusicPage retain];
    return YES ;
}

#if TARGET_IPHONE_SIMULATOR
#else
- (void)toggle:(id)btCont
{
 //  BOOL currentState = [btCont enabled] ;
   [btCont setEnabled: self.bBlueSet] ;
    //[btCont setPowered:!currentState] ;
    if(_bBlueSet)
    {
        [self OpenMusic];
    }
   
    
}
#endif


-(void)ctrlBluetooth:(BOOL)bSet
{
    Class BluetoothManager = objc_getClass( "BluetoothManager" ) ;
    id btCont = [BluetoothManager sharedInstance] ;
    //[self performSelector:@selector(toggle:) withObject:btCont bset afterDelay:1.0f] ;
    NSLog(@"set %d", bSet);
    self.bBlueSet = bSet;
#if TARGET_IPHONE_SIMULATOR
 
    [self OpenMusic];
    if (bSet)
    {
   
    UIAlertView *alert;
    
    alert = [[[UIAlertView alloc] initWithTitle:@"开始启动\n请稍等..." message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: nil] autorelease];
    
    [alert show];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    // Adjust the indicator so it is up a few pixels from the bottom of the alert
    indicator.center = CGPointMake(alert.bounds.size.width / 2, alert.bounds.size.height - 50);
    [indicator startAnimating];
    [alert addSubview:indicator];
    [indicator release];
    
    [alert dismissWithClickedButtonIndex:0 animated:YES];
    
    }
#else
        
    [self performSelector:@selector(toggle:) withObject:btCont afterDelay:1.0f] ;
    if(bSet)
    {
        UIAlertView *alert;
        
        alert = [[[UIAlertView alloc] initWithTitle:@"开始启动\n请稍等..." message:nil delegate:self cancelButtonTitle:nil otherButtonTitles: nil] autorelease];
        
        [alert show];
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        // Adjust the indicator so it is up a few pixels from the bottom of the alert
        indicator.center = CGPointMake(alert.bounds.size.width / 2, alert.bounds.size.height - 50);
        [indicator startAnimating];
        [alert addSubview:indicator];
        [indicator release];
        
        [alert dismissWithClickedButtonIndex:0 animated:YES];
        
        }
    
#endif
    
   // [btCont setEnabled:bSet];
}

-(void)OpenMusic
{
    NSInteger row = [_viewController getSelMusic];
    
    NSString *pPath = [pMusicPage objectAtIndex:row];
    
    NSLog(@"select row:%d, value:%@", row, pPath);
    
    NSString* strIdentifier = pPath;//@"qqmusic://";
    BOOL isExsit = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:strIdentifier]];
    if(isExsit) {
        NSLog(@"App %@ installed", strIdentifier);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strIdentifier]];
    }
}


- (IBAction)StartBt:(id)sender
    {

     [self ctrlBluetooth:YES];
    }

- (IBAction)StopBt:(id)sender {
    [self ctrlBluetooth:NO];
}




- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


- (void)dealloc
{
    [_window release];
    [_viewController release];
    [pMusicPage release];
    [super dealloc];
}

@end
