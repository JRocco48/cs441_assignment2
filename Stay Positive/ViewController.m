//
//  ViewController.m
//  Stay Positive
//
//  Created by John Rocco on 2/6/19.
//  Copyright © 2019 John Rocco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

NSInteger grid[16];

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createBoard {
    for(int i = 0; i < 16; i++) grid[i] = 0;
    int r = rand() % 16;
    grid[rand()%16] = (rand() % 2) * 2;
    grid[rand()%16] = (rand() % 2) * 2;

}


@end
