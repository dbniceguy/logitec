//
//  newOrEditDiaryViewController.m
//  logitec
//
//  Created by 순우 김 on 12. 7. 23..
//  Copyright (c) 2012년 dbniceguy@inervit.com. All rights reserved.
//

#import "newOrEditDiaryViewController.h"

@interface newOrEditDiaryViewController ()

@end

@implementation newOrEditDiaryViewController
@synthesize mvLocation;
@synthesize ivPicture;
@synthesize pcPicture;
@synthesize tvDiary;
@synthesize tfTitle;
@synthesize scrollViewMain;
@synthesize lbDate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [scrollViewMain setContentSize:CGSizeMake(self.scrollViewMain.frame.size.width, 600)];
}

- (void)viewDidUnload
{
    [self setScrollViewMain:nil];
    [self setLbDate:nil];
    [self setTfTitle:nil];
    [self setIvPicture:nil];
    [self setTvDiary:nil];
    [self setMvLocation:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)actionBtnDateChange:(id)sender 
{
}
- (IBAction)actionBtnWeather:(id)sender 
{
}

- (IBAction)actionBtnLocation:(id)sender 
{
}

- (IBAction)actionBtnPicture:(id)sender 
{
    pcPicture = [[UIImagePickerController alloc] init];
	[pcPicture setDelegate:self];
	[pcPicture setAllowsEditing:YES];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        [pcPicture setSourceType:UIImagePickerControllerSourceTypeCamera];
    }else{
        [pcPicture setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
	[self presentModalViewController:pcPicture animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker 
didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
	ivPicture.image = [info objectForKey:UIImagePickerControllerEditedImage];
	[picker dismissModalViewControllerAnimated:YES];
}
@end
