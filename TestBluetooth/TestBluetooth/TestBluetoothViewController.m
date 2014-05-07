//
//  TestBluetoothViewController.m
//  TestBluetooth
//
//  Created by zhaoxy on 11-10-11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "TestBluetoothViewController.h"



@implementation TestBluetoothViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

-(NSString*)getCfgPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString * path=[documentsDirectory stringByAppendingPathComponent:@"bluetoothcfg.txt"];
    return path;
}

- (NSString *) readFromFile:(NSString *)filepath{
    if ([[NSFileManager defaultManager] fileExistsAtPath:filepath]){
        NSString *content = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:nil];
        return content;
    } else {
        return nil;
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // UIImage *image = [UIImage imageNamed:@"bk.jpg"];
  // self.bkview.backgroundColor = [UIColor colorWithPatternImage: image];
  //  NSString *image_btnormal = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"nono.bundle/images/button_normal.png"];
  //  [_startbt setBackgroundImage:[UIImage imageWithContentsOfFile:image_btnormal] forState:UIControlStateNormal];
     
  //  [_startbt setBackgroundImage:[UIImage imageNamed:@"button_pushed.png"] forState:UIControlStateSelected];
   
    NSString *image_url = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"nono.bundle/images/cbk.jpg"];
    self.bkview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:image_url]];
    pickerArray = [NSArray arrayWithObjects:@"不选择",@"QQ音乐",@"系统音乐",@"网易音乐", nil];
    [pickerArray retain];
   _musicPickerView.delegate = self;
   _musicPickerView.dataSource = self;
  
    //_musicPickerView.frame = CGRectMake(0, 480, 320, 216);
    
    NSString * path= [self getCfgPath];
    NSString *str_row = [self readFromFile:path];
    NSInteger row = [str_row intValue];
    [_musicPickerView selectRow:row inComponent:(0) animated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    _musicPickerView.delegate = nil;
    _musicPickerView.dataSource = nil;
    [pickerArray release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}

-(void)saveSelect:(NSInteger)row
{
    NSString *strSel = [[NSString alloc] initWithFormat:@"%d", row];
    
    NSString * path= [self getCfgPath];
   
    //NSString *str = [[NSString alloc] initWithString:strSel];
    
    [strSel writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];


}

-(NSInteger)getSelMusic{
    NSInteger row = [_musicPickerView selectedRowInComponent:0];
    NSLog(@"select row:%d", row);
    [self saveSelect:row];
    
    return row;
    //NSString *strSel = [pickerArray objectAtIndex:row];
    //NSLog(@"select value:%@", strSel);
    //return strSel;
}


- (void)dealloc {
    [_musicPickerView release];
    [_bkview release];
    [_startbt release];
    [super dealloc];
}
@end
