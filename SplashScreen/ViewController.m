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
    
    splashScreen = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    splashScreen.backgroundColor = [UIColor colorWithRed:45/255.0 green:62/255.0 blue:79/255.0 alpha:1.0];
    
    
    splashText = [[UILabel alloc]initWithFrame:CGRectMake(145,313, 125, 40)];
    [splashText setText:@"Label"];
    [splashText setTextColor:[UIColor whiteColor]];
    [splashScreen addSubview:splashText];

    [self fadeUIViewOut];
    
    
}





-(void) fadeUIViewOut {

    
    
    if (![@"1" isEqualToString:[[NSUserDefaults standardUserDefaults]
                                objectForKey:@"aValue"]]) {
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"aValue"];
        [[NSUserDefaults standardUserDefaults] synchronize];{
           
        
            splashScreen.alpha = 1.0f;
            //  Fades out after X seconds
            [UIView animateWithDuration:.5 delay:4.0 options:0 animations:^{
                // Changes Alpha value to 0
                splashScreen.alpha = 0.0f;
            } completion:^(BOOL finished) {
                // Once the animation is completed and view is transparent, view hides
                splashScreen.hidden = YES;
            }];
            
            
            splashText.alpha = 0.0f;
            [UILabel animateWithDuration:.5 delay:1.0 options:0 animations:^{
                // Changes Alpha value to 0
                splashText.alpha = 1.0f;
            } completion:^(BOOL finished) {
                splashText.alpha = 1.0f;
                [UILabel animateWithDuration:.5 delay:2.0 options:0 animations:^{
                    // Changes Alpha value to 0
                    splashText.alpha = 0.0f;
                } completion:^(BOOL finished) {
                    // Once the animation is completed and view is transparent, text hides
                    splashText.hidden = YES;
                }];
            }];
            [self.view addSubview:splashScreen];
            NSLog(@"Fading In!");
        }
    }

    
    
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
