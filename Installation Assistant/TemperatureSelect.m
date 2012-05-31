//
//  TemperatureSelect.m
//  Installation Assistant
//
//  Created by Solular on 4/20/12.
//  Copyright (c) 2012 Solular, LLC. All rights reserved.
//

#import "TemperatureSelect.h"
#import "Quartzcore/QuartzCore.h"

@interface TemperatureSelect ()

@end

@implementation TemperatureSelect
@synthesize delegate, selectedTemperature = _selectedTemperature;

- (void)saveTemperature 
{
    [self.delegate temperatureSelectController:self didUpdateWithTemperature:temperatureTextView.text];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Unfortunately, this view is created entirely from code.  
        self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.view.backgroundColor = [UIColor lightTextColor];
        
        temperatureTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 10, 140, 40)];
        temperatureTextView.backgroundColor = [UIColor whiteColor];
        temperatureTextView.layer.cornerRadius = 10;
        temperatureTextView.font = [UIFont systemFontOfSize:20];
        temperatureTextView.keyboardType = UIKeyboardTypeNumberPad;
        temperatureTextView.text = self.selectedTemperature;

        
        [self.view addSubview:temperatureTextView];
        
        UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        saveButton.frame = CGRectMake(160, 10, 75, 40);
        [saveButton setTitle:@"Save" forState:UIControlStateNormal];
        [saveButton setTitleColor:[UIColor blackColor] forState: UIControlStateNormal];
        [saveButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        saveButton.backgroundColor = [UIColor whiteColor];
        [saveButton setBackgroundImage:[UIImage imageNamed:@"button_highlighted_back.png"] forState:UIControlStateHighlighted];
        saveButton.layer.cornerRadius = 10;
        saveButton.layer.borderColor = [UIColor blackColor].CGColor;
        saveButton.layer.borderWidth = 1;
        saveButton.clipsToBounds = YES;
        [saveButton addTarget:self action:@selector(saveTemperature) forControlEvents:UIControlEventTouchDown];
        
        [self.view addSubview:saveButton];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
