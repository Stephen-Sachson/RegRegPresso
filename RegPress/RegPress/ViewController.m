//
//  ViewController.m
//  RegPress
//
//  Created by Mafia on 4/28/14.
//  Copyright (c) 2014 Stephen Sachson. All rights reserved.
//

#import "ViewController.h"

#define kTestText @"123 123 \\ 123 123"
#define kRegexPattern @"\\"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSError *error;
    
    NSRegularExpression *regex=[[NSRegularExpression alloc] initWithPattern:kRegexPattern options:NSRegularExpressionCaseInsensitive error:&error];
    if (!error) {
        [regex enumerateMatchesInString:kTestText options:0 range:NSMakeRange(0, kTestText.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
            NSLog(@"{%lu, %lu} %@ %lu",(unsigned long)result.range.location,(unsigned long)result.range.length,[kTestText substringWithRange:result.range], flags);
        }];
    }
    else {
        NSLog(@"%@",error);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
