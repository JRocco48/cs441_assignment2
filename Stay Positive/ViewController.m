//
//  ViewController.m
//  Stay Positive
//
//  Created by John Rocco on 2/6/19.
//  Copyright © 2019 John Rocco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (retain, nonatomic) IBOutletCollection(UILabel) NSArray * labelArray;
@property (strong, nonatomic) IBOutlet UIButton *testButton;

@property (strong, nonatomic) IBOutlet UILabel *pos15;
@property (strong, nonatomic) IBOutlet UILabel *pos14;
@property (strong, nonatomic) IBOutlet UILabel *pos13;
@property (strong, nonatomic) IBOutlet UILabel *pos12;
@property (strong, nonatomic) IBOutlet UILabel *pos11;
@property (strong, nonatomic) IBOutlet UILabel *pos10;
@property (strong, nonatomic) IBOutlet UILabel *pos9;
@property (strong, nonatomic) IBOutlet UILabel *pos8;
@property (strong, nonatomic) IBOutlet UILabel *pos7;
@property (strong, nonatomic) IBOutlet UILabel *pos6;
@property (strong, nonatomic) IBOutlet UILabel *pos5;
@property (strong, nonatomic) IBOutlet UILabel *pos4;
@property (strong, nonatomic) IBOutlet UILabel *pos3;
@property (strong, nonatomic) IBOutlet UILabel *pos2;
@property (strong, nonatomic) IBOutlet UILabel *pos1;
@property (strong, nonatomic) IBOutlet UILabel *pos0;

@end

int grid[16];
UILabel * labelGrid[16];

@implementation ViewController

- (void)createBoard {
    for(int i = 0; i < 16; i++) grid[i] = 0;
    [self round];
}

- (void)displayBoard {
    int i = 0;
    for(UILabel * label in self.labelArray) {
        if(grid[i] != 0) {
            label.text = [NSString stringWithFormat:@"%d", grid[i]];
        } else {
            label.text = @"";
        }
        i++;
    }
}

- (void)round {
    bool zeroCheck = false;
    for(int i = 0; i < 16; i++) {
        if(grid[i] == 0) zeroCheck = true;
    }
    if(zeroCheck == false) return;
    
    int val = rand()%16;
    while(grid[val] != 0) val = rand()%16;
    int posVneg = 1;
    if(rand()%2 == 1) posVneg = -1;
    grid[val] = posVneg;
}

- (void)moveLine:(int*) a b:(int*) b c:(int*) c d:(int*) d {
    
    //move line of numbers to fill in blank spots
    if((*c) == 0) {
        (*c) = (*d);
        (*d) = 0;
    }
    if((*b) == 0) {
        (*b) = (*c);
        (*c) = (*d);
        (*d) = 0;
    }
    if((*a) == 0) {
        (*a) = (*b);
        (*b) = (*c);
        (*c) = (*d);
        (*d) = 0;
    }
    
    //combine numbers that are adjacent and equal
    if(abs(*a) == abs(*b)) {
        (*a) += (*b);
        (*b) = 0;
    }else if(abs(*b) == abs(*c)) {
        (*b) += (*c);
        (*c) = 0;
    } else if (abs(*c) == abs(*d)){
        (*c) = (*d);
        (*d) = 0;
    }
}

- (IBAction)swipeRight:(UISwipeGestureRecognizer *)sender {
    [self moveLine: &grid[3] b:&grid[2] c:&grid[1] d:&grid[0]];
    [self moveLine: &grid[7] b:&grid[6] c:&grid[5] d:&grid[4]];
    [self moveLine: &grid[11] b:&grid[10] c:&grid[9] d:&grid[8]];
    [self moveLine: &grid[15] b:&grid[14] c:&grid[13] d:&grid[12]];
    [self round];
    [self displayBoard];
}

- (IBAction)swipeLeft:(UISwipeGestureRecognizer *)sender {
    [self moveLine: &grid[0] b:&grid[1] c:&grid[2] d:&grid[3]];
    [self moveLine: &grid[4] b:&grid[5] c:&grid[6] d:&grid[7]];
    [self moveLine: &grid[8] b:&grid[9] c:&grid[10] d:&grid[11]];
    [self moveLine: &grid[12] b:&grid[13] c:&grid[14] d:&grid[15]];
    [self round];
    [self displayBoard];
}

- (IBAction)swipeDown:(UISwipeGestureRecognizer *)sender {
    [self moveLine: &grid[12] b:&grid[8] c:&grid[4] d:&grid[0]];
    [self moveLine: &grid[13] b:&grid[9] c:&grid[5] d:&grid[1]];
    [self moveLine: &grid[14] b:&grid[10] c:&grid[6] d:&grid[2]];
    [self moveLine: &grid[15] b:&grid[11] c:&grid[7] d:&grid[3]];
    [self round];
    [self displayBoard];
}

- (IBAction)swipeUp:(UISwipeGestureRecognizer *)sender {
    [self moveLine: &grid[0] b:&grid[4] c:&grid[8] d:&grid[12]];
    [self moveLine: &grid[1] b:&grid[5] c:&grid[9] d:&grid[13]];
    [self moveLine: &grid[2] b:&grid[6] c:&grid[10] d:&grid[14]];
    [self moveLine: &grid[3] b:&grid[7] c:&grid[11] d:&grid[15]];
    [self round];
    [self displayBoard];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createBoard];
    [self displayBoard];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
