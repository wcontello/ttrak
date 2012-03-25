//
//  ttrakMainViewController.h
//  ttrak
//
//  Created by Wayne Contello on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ttrakFlipsideViewController.h"
#import <UIKIT/UIKIT.h>

@interface ttrakMainViewController : UIViewController <ttrakFlipsideViewControllerDelegate>

-(NSString *) documentsPath;
-(NSString *) readFromFile:(NSString *) filePath;
-(void) writeToFile:(NSString *) text
       withFileName:(NSString *) filePath;

@end
