//
//  BTNextViewController.m
//  BTTimer_Example
//
//  Created by joly on 2020/11/25.
//  Copyright © 2020 lingfeng33. All rights reserved.
//

#import "BTNextViewController.h"
#import <BTTimer-umbrella.h>

@interface BTNextViewController ()

@property(nonatomic,strong) CADisplayLink * link;
@property(nonatomic,strong) dispatch_source_t timer;
@end

@implementation BTNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"暂停" style:UIBarButtonItemStylePlain target:self action:@selector(stopTimer:)];
    
//    CADisplayLink * link = [CADisplayLink displayLinkWithTarget:self selector:@selector(beginTaget:)];
//    self.link = link;
//    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    //BTProxy * proxy = [BTProxy proxyWithTransformObject:self];
    
    
    _timer  = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(_timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(_timer, ^{
        
        NSLog(@"-----");
    });
    dispatch_resume(_timer);
}

- (void)stopTimer:(UIBarButtonItem *)item {
    
    dispatch_cancel(_timer);
    dispatch_source_set_cancel_handler(_timer, ^{
        [self.navigationController popViewControllerAnimated:YES];
    });
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)didMoveToParentViewController:(UIViewController *)parent {
    
    if (parent == nil) {
        
        [self.link invalidate];
        self.link = nil;
    }
}

/// 开始了
/// @param link CADisplayLink
- (void)beginTaget:(CADisplayLink *)link {
    
    NSLog(@"--------%f",link.timestamp);
}

- (void)dealloc {
    
    NSLog(@"%s",__func__);
}

@end
