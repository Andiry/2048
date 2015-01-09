//
//  ViewController.m
//  2048
//
//  Created by Andiry on 1/8/15.
//  Copyright (c) 2015 Andiry. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    views = [[NSMutableArray alloc] init];
    labels = [[NSMutableArray alloc] init];
    colors = [[NSMutableArray alloc] init];

    [views insertObject:self.view0 atIndex:0];
    [views insertObject:self.view1 atIndex:1];
    [views insertObject:self.view2 atIndex:2];
    [views insertObject:self.view3 atIndex:3];
    [views insertObject:self.view4 atIndex:4];
    [views insertObject:self.view5 atIndex:5];
    [views insertObject:self.view6 atIndex:6];
    [views insertObject:self.view7 atIndex:7];
    [views insertObject:self.view8 atIndex:8];
    [views insertObject:self.view9 atIndex:9];
    [views insertObject:self.view10 atIndex:10];
    [views insertObject:self.view11 atIndex:11];
    [views insertObject:self.view12 atIndex:12];
    [views insertObject:self.view13 atIndex:13];
    [views insertObject:self.view14 atIndex:14];
    [views insertObject:self.view15 atIndex:15];
    
    [labels insertObject:self.label0 atIndex:0];
    [labels insertObject:self.label1 atIndex:1];
    [labels insertObject:self.label2 atIndex:2];
    [labels insertObject:self.label3 atIndex:3];
    [labels insertObject:self.label4 atIndex:4];
    [labels insertObject:self.label5 atIndex:5];
    [labels insertObject:self.label6 atIndex:6];
    [labels insertObject:self.label7 atIndex:7];
    [labels insertObject:self.label8 atIndex:8];
    [labels insertObject:self.label9 atIndex:9];
    [labels insertObject:self.label10 atIndex:10];
    [labels insertObject:self.label11 atIndex:11];
    [labels insertObject:self.label12 atIndex:12];
    [labels insertObject:self.label13 atIndex:13];
    [labels insertObject:self.label14 atIndex:14];
    [labels insertObject:self.label15 atIndex:15];
    
    [colors insertObject:[UIColor redColor] atIndex:0];
    [colors insertObject:[UIColor yellowColor] atIndex:1];
    [colors insertObject:[UIColor orangeColor] atIndex:2];
    [colors insertObject:[UIColor greenColor] atIndex:3];
    [colors insertObject:[UIColor blueColor] atIndex:4];
    [colors insertObject:[UIColor purpleColor] atIndex:5];
    
    [self initViews];
   
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) blankTile:(int)tile {
    UIView *view;
    UILabel *label;
    
    view = [views objectAtIndex:tile];
    view.backgroundColor = [UIColor whiteColor];
    label = [labels objectAtIndex:tile];
    label.text = @"";
    label.hidden = YES;
    values[tile] = 0;
}

- (void) initViews {
    int i;
    
    for (i = 0; i < 16; i++) {
        [self blankTile:i];
    }

    free = 16;

    [self insertRandomNumber];
    [self insertRandomNumber];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertRandomNumber {
    if (free == 0) {
        [self initViews];
        return;
    }
    
    int index = arc4random() % free;
    int i, j = 0;
    int value;
    UIView *view;
    UILabel *label;
    
    for (i = 0; i < 16; i++) {
        label = [labels objectAtIndex:i];
        if (label.hidden == NO)
            continue;
        
        if (j != index) {
            j++;
        } else {
            view = [views objectAtIndex:i];
            value = arc4random() % 2 + 1;
 //           NSLog(@"%d %d\n", value, (int)pow(2, value));
            
            label.text = [[NSString alloc] initWithFormat:@"%d", (int)pow(2, value)];
            label.hidden = NO;
            view.backgroundColor = [colors objectAtIndex:value];
            values[i] = value;
            
            free--;
            return;
        }
    }
}

- (void)processRow:(int)row :(int)direction {
    int i = row * 4;
    int j;
    
    if (direction == 1) {
        for (j = 0; j < 3; j++) {
            [self mergeTiles:i+2 :i+3];
            [self mergeTiles:i+1 :i+2];
            [self mergeTiles:i :i+1];
        }
    } else {
        for (j = 0; j < 3; j++) {
            [self mergeTiles:i+1 :i];
            [self mergeTiles:i+2 :i+1];
            [self mergeTiles:i+3 :i+2];
        }
    }
    
}

- (void)processColumn:(int)column :(int)direction {
    int i = column;
    int j;
    
    if (direction == 1) {
        for (j = 0; j < 3; j++) {
            [self mergeTiles:i+8 :i+12];
            [self mergeTiles:i+4 :i+8];
            [self mergeTiles:i+0 :i+4];
        }
    } else {
        for (j = 0; j < 3; j++) {
            [self mergeTiles:i+4 :i];
            [self mergeTiles:i+8 :i+4];
            [self mergeTiles:i+12 :i+8];
        }
    }
    
}
- (IBAction)swipeRight:(id)sender {
    int i;
    
    for (i = 0; i < 4; i++) {
        [self processRow:i :1];
    }

    [self insertRandomNumber];
}

- (void)assignValueToTile:(int)tile :(int)value {
    UIView *view;
    UILabel *label;
    
    view = [views objectAtIndex:tile];
    label = [labels objectAtIndex:tile];
    
    label.text = [[NSString alloc] initWithFormat:@"%d", (int)pow(2, value)];
    label.hidden = NO;
    view.backgroundColor = [colors objectAtIndex: value % NUMCOLORS];
    values[tile] = value;
}

- (void)mergeTiles:(int)from :(int)to {
    int value;
    
    if (values[from] == 0)
        return;
    
    if (values[to] == 0) {
        // Swap two tiles
        value = values[from];
        [self assignValueToTile:to :value];
        [self blankTile:from];
        return;
    }
    
    if (values[from] == values[to]) {
        // Merge two tiles
        value = values[to];
        value++;
        [self assignValueToTile:to :value];
        [self blankTile:from];
        free++;
    }
}

- (IBAction)swipeLeft:(id)sender {
    int i;
    
    for (i = 0; i < 4; i++) {
        [self processRow:i :0];
    }
    
    [self insertRandomNumber];
}

- (IBAction)swipeUp:(id)sender {
    int i;
    
    for (i = 0; i < 4; i++) {
        [self processColumn:i :0];
    }
    
    [self insertRandomNumber];
}

- (IBAction)swipeDown:(id)sender {
    int i;
    
    for (i = 0; i < 4; i++) {
        [self processColumn:i :1];
    }
    
    [self insertRandomNumber];
}
@end
