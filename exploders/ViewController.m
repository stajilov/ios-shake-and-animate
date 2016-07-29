//
//  ViewController.m
//  exploders
//
//  Created by macbook on 10/03/2015.
//  Copyright (c) 2015 frankemerald. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *dotArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dotArray = [[NSMutableArray alloc] init];
  
    
    for(int i = 0; i <1000; i++)
    {
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        
        
        
        UIView *pointView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        pointView.backgroundColor = color;
        [self.view addSubview:pointView];
        [self.dotArray addObject:pointView];
    }
    
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
    [self.view addGestureRecognizer:singleTapGestureRecognizer];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer
{
    for (UIView *v in self.dotArray)
    {
        CGFloat fl = ( arc4random() % 300 / 256.0 );
        
        //NSInteger x = [self randomValueBetween:0 and:scr.size.width];
       // NSInteger y = [self randomValueBetween:0 and:scr.size.height];
        
        
        [UIView animateWithDuration:fl animations:^{
            v.frame = CGRectMake(0, 0, 10, 10);
        }];
    }
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        CGRect scr  = [[UIScreen mainScreen] bounds];
        NSLog(@"Shake detected");
        for (UIView *v in self.dotArray)
        {
            CGFloat fl = ( arc4random() % 300 / 256.0 );
            
            NSInteger x = [self randomValueBetween:0 and:scr.size.width];
            NSInteger y = [self randomValueBetween:0 and:scr.size.height];
            
            
            [UIView animateWithDuration:fl animations:^{
                v.frame = CGRectOffset(v.frame, x, y);
            }];
        }
    }
}



- (NSInteger)randomValueBetween:(NSInteger)min and:(NSInteger)max {
    return (NSInteger)(min + arc4random_uniform(max - min + 1));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
