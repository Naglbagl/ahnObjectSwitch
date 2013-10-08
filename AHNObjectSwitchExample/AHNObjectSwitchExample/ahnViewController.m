//
//  ahnViewController.m
//  AHNObjectSwitchExample
//
//  Created by Alexander Nagl on 10/8/13.
//  Copyright (c) 2013 Alexander Nagl. All rights reserved.
//

#import "ahnViewController.h"

@interface ahnViewController ()

@end

@implementation ahnViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSArray *array = @[@"One"];
    
    bool switchStatement = [array switchWithBoolBlock:^bool(NSArray* baseObject, NSArray* caseObject) {
        for (NSString *stringInBaseObject in baseObject){
            for (NSString *stringInCaseObject in caseObject){
                if (![stringInCaseObject isEqualToString:stringInBaseObject]){
                    return NO;
                }
            }
        }
        return YES;
    } WithCases:@[@[@"Two"], @[@"Three"], @[@"One"]] withStatements:
                            ^(NSArray* caseObject) {
                                NSLog(@"%@",[caseObject objectAtIndex:0]);
                            },
                            ^(NSArray* caseObject) {
                                NSLog(@"%@",[caseObject objectAtIndex:0]);
                            },
                            ^(NSArray* caseObject) {
                                NSLog(@"%@",[caseObject objectAtIndex:0]);
                            }];
    
    if (!switchStatement){
        NSLog(@"Did not find a match");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

}

@end
