//
//  ViewController.m
//  自定义KVO
//
//  Created by 马文帅 on 2017/10/16.
//  Copyright © 2017年 mawenshuai. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "NSObject+Extension.h"

@interface ViewController ()
@property (nonatomic, strong) Student *s;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    _s = [[Student alloc] init];
    
    //使用自定义方法实现kvo监听
    [_s ws_addObserver:self forKeyPath:@"score" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"old=%@ new=%@", change[NSKeyValueChangeOldKey], change[NSKeyValueChangeNewKey]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static NSInteger num = 0;
    _s.score = @(num++);
}

@end
