//
//  ttrakFlipsideViewController.h
//  ttrak
//
//  Created by Wayne Contello on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ttrakFlipsideViewController;

@protocol ttrakFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(ttrakFlipsideViewController *)controller;
@end

@interface ttrakFlipsideViewController : UIViewController

@property (weak, nonatomic) IBOutlet id <ttrakFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
