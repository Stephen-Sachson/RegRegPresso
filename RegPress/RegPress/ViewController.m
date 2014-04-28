//
//  ViewController.m
//  RegPress
//
//  Created by Mafia on 4/28/14.
//  Copyright (c) 2014 Stephen Sachson. All rights reserved.
//

#import "ViewController.h"
#import "XMLReader.h"

#define kTestText @"123 123 \\ 123 123"
#define kRegexPattern @"\\b123\\b"

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
    
    NSError *xError;
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"test" ofType:@"xml"];
    NSData *xmlData=[NSData dataWithContentsOfFile:path];
    NSDictionary *dicFromXML = [XMLReader dictionaryForXMLData:xmlData error:&xError];
    if (xError) {
        NSLog(@"%@",error);
    }
    else {
        NSLog(@"%@",dicFromXML);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
