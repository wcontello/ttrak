//
//  ttrakMainViewController.m
//  ttrak
//
//  Created by Wayne Contello on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ttrakMainViewController.h"

@implementation ttrakMainViewController

//---finds the path to application's Documents directory---
-(NSString *) documentsPath {
    NSArray *paths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
NSString *documentsDir = [paths objectAtIndex:0];
return documentsDir;
}

-(void) writeToFile:(NSMutableArray *)data withFileName:(NSString *)filePath {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:data];
    [array writeToFile:filePath atomically:YES];
    //[array release];
}

-(NSArray *) readFromFile:(NSString *)filePath {
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSArray *array = 
        [[NSArray alloc] initWithContentsOfFile: filePath];
        NSString *data = [NSString stringWithFormat:@"%@",[array objectAtIndex:0]];
        //[array release];
        return data;
    }
    else
    {
        return nil;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
	// Do any additional setup after loading the view, typically from a nib.
    //---Formulate filename---
    NSString *fileName = [[self documentsPath] stringByAppendingPathComponent:@"data.txt"];
    NSMutableArray *data = [NSMutableArray arrayWithCapacity:0];
    [data addObject:@"project1"];
    [data addObject:@"project2"];
    [self writeToFile:data withFileName:fileName];    
    NSString *fileContent = [self readFromFile:fileName];
    NSLog(@"%@",fileContent);
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(ttrakFlipsideViewController *)controller
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
