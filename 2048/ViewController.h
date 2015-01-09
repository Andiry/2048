//
//  ViewController.h
//  2048
//
//  Created by Andiry on 1/8/15.
//  Copyright (c) 2015 Andiry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <math.h>

#define NUMCOLORS 6

@interface ViewController : UIViewController {
    NSMutableArray *views;
    NSMutableArray *labels;
    NSMutableArray *colors;
    int free;
    int values[16]; // log format
}
@property (strong, nonatomic) IBOutlet UIView *view0;
@property (strong, nonatomic) IBOutlet UILabel *label0;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UIView *view3;
@property (strong, nonatomic) IBOutlet UILabel *label3;
@property (strong, nonatomic) IBOutlet UIView *view4;
@property (strong, nonatomic) IBOutlet UILabel *label4;
@property (strong, nonatomic) IBOutlet UIView *view5;
@property (strong, nonatomic) IBOutlet UILabel *label5;
@property (strong, nonatomic) IBOutlet UIView *view6;
@property (strong, nonatomic) IBOutlet UILabel *label6;
@property (strong, nonatomic) IBOutlet UIView *view7;
@property (strong, nonatomic) IBOutlet UILabel *label7;
@property (strong, nonatomic) IBOutlet UIView *view8;
@property (strong, nonatomic) IBOutlet UILabel *label8;
@property (strong, nonatomic) IBOutlet UIView *view9;
@property (strong, nonatomic) IBOutlet UILabel *label9;
@property (strong, nonatomic) IBOutlet UIView *view10;
@property (strong, nonatomic) IBOutlet UILabel *label10;
@property (strong, nonatomic) IBOutlet UIView *view11;
@property (strong, nonatomic) IBOutlet UILabel *label11;
@property (strong, nonatomic) IBOutlet UIView *view12;
@property (strong, nonatomic) IBOutlet UILabel *label12;
@property (strong, nonatomic) IBOutlet UIView *view13;
@property (strong, nonatomic) IBOutlet UILabel *label13;
@property (strong, nonatomic) IBOutlet UIView *view14;
@property (strong, nonatomic) IBOutlet UILabel *label14;
@property (strong, nonatomic) IBOutlet UIView *view15;
@property (strong, nonatomic) IBOutlet UILabel *label15;
- (IBAction)swipeRight:(id)sender;
- (IBAction)swipeLeft:(id)sender;
- (IBAction)swipeUp:(id)sender;
- (IBAction)swipeDown:(id)sender;

- (void)initViews;
- (void) insertRandomNumber;
- (void) mergeTiles:(int)from :(int)to;
- (void) blankTile:(int)tile;
- (void) assignValueToTile:(int)tile :(int)value;
- (void) processRow:(int)row :(int)direction;
- (void) processColumn:(int)column :(int)direction;

@end




