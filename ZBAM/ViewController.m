//
//  ViewController.m
//  ZBAM
//
//  Created by Romain Pouclet on 2014-11-21.
//  Copyright (c) 2014 Perfectly-Cooked. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSArray *words;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.words = @[@"ZBAM!", @"BIM!", @"KABOOM!"];
    [self.wordList removeAllSegments];
    [self.words enumerateObjectsUsingBlock:^(NSString *word, NSUInteger idx, BOOL *stop) {
        [self.wordList insertSegmentWithTitle: word atIndex: idx animated: YES];
    }];
}

- (IBAction)wordDidChange:(UISegmentedControl *)sender {
    NSString *word = self.words[sender.selectedSegmentIndex];
    NSLog(@"New word is %@", word);
    
    // Remove all previous layers
    self.wordContainer.image = nil;
    
    UIFont *font = [UIFont fontWithName: @"Bangers" size: 100];
    CGSize textSize = [word sizeWithAttributes: @{NSFontAttributeName: font}];
    textSize.width += 20;
    textSize.height += 20;
    
    // Create text image
    NSDictionary *attrs = @{NSForegroundColorAttributeName: UIColor.redColor, NSFontAttributeName: font};
    NSDictionary *shadowAttrs = @{NSForegroundColorAttributeName: UIColor.blackColor, NSFontAttributeName: font};
    UIGraphicsBeginImageContextWithOptions(textSize, NO, 0);
    [word drawAtPoint: CGPointMake(10, 10) withAttributes: shadowAttrs];
    [word drawAtPoint: CGPointMake(0, 0) withAttributes: attrs];
    UIImage *wordImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.wordContainer.image = wordImage;
    
    // Bounce once
    CAKeyframeAnimation *bounce = [CAKeyframeAnimation animationWithKeyPath: @"transform.scale"];
    bounce.values = @[@(0.8), @(1.2), @1];
    bounce.duration = .3;

    [self.wordContainer.layer addAnimation: bounce forKey: @"bounce_once"];
}

@end
