//
//  ViewController.m
//  SplashScreen
//
//  Created by Efrain Ayllon on 6/29/16.
//  Copyright © 2016 Efrain Ayllon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self firstTimeView];
    
    
}

-(void) firstTimeView {
    
    
    if (![@"1" isEqualToString:[[NSUserDefaults standardUserDefaults]
                                objectForKey:@"aValue"]]) {
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"aValue"];
        [[NSUserDefaults standardUserDefaults] synchronize];{
        
        UIView *splashScreen = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        splashScreen.backgroundColor = [UIColor greenColor];
        
        splashScreen.alpha = 1.0f;
        //  Fades out after X seconds
        [UIView animateWithDuration:0.5 delay:2.0 options:0 animations:^{
            // Changes Alpha value to 0
            splashScreen.alpha = 0.0f;
        } completion:^(BOOL finished) {
            // Once the animation is completed and view is transparent, view hides
            splashScreen.hidden = YES;
        }];
        
        [self.view addSubview:splashScreen];
        NSLog(@"Hello!");
        
        }
    }





}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
