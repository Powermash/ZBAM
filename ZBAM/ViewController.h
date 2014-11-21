//
//  ViewController.h
//  ZBAM
//
//  Created by Romain Pouclet on 2014-11-21.
//  Copyright (c) 2014 Perfectly-Cooked. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *wordContainer;
@property (weak, nonatomic) IBOutlet UISegmentedControl *wordList;

- (IBAction)wordDidChange:(id)sender;

@end

