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

long grid[16];
UILabel * labelGrid[16];

@implementation ViewController
- (IBAction)testButton:(UIButton *)sender {
    [self createBoard];
    [self displayBoard];
}

- (void)createBoard {
    for(int i = 0; i < 16; i++) grid[i] = 0;
    grid[rand()%16] = ((rand() % 2)+1) * 2;
    grid[rand()%16] = ((rand() % 2)+1) * -2;
}

- (void) displayBoard {
    int i = 0;
    for(UILabel * label in self.labelArray) {
        label.text = [NSString stringWithFormat:@"%ld", grid[i]];
        i++;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
