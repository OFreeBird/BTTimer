//
//  BTViewController.m
//  BTTimer
//
//  Created by lingfeng33 on 11/25/2020.
//  Copyright (c) 2020 lingfeng33. All rights reserved.
//

#import "BTViewController.h"


@interface BTViewController ()

@end

@implementation BTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton * nextBtn = [[UIButton alloc]init];
    nextBtn.layer.cornerRadius = 10;
    nextBtn.layer.masksToBounds = YES;
    nextBtn.frame = CGRectMake(0, 0, 100, 40);
    nextBtn.center = self.view.center;
    nextBtn.backgroundColor = [UIColor orangeColor];
    [nextBtn setTitle:@"下一页" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextPage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    
}

- (void)nextPage:(UIButton *)sender {
    
    UIViewController * vc = [[NSClassFromString(@"BTNextViewController") alloc]init];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
