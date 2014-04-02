//  SettingsViewController.m

#import "SettingsViewController.h"
#import "genericInfo.h"

@implementation SettingsViewController

- (void)viewDidLoad
{
    dataManager = [DataManager sharedManager];
    [super viewDidLoad];
    
    
    // Tap outside of keyboard and text field to dismiss the keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
    // Make sure that there's consistency between the saved temperature state and what's showing
    if (dataManager.isCelsius)
        [tempUnitControl setSelectedSegmentIndex:0];
    else
        [tempUnitControl setSelectedSegmentIndex:1];
    
    [tempUnitControl addTarget:self
                        action:@selector(click:)
              forControlEvents:UIControlEventValueChanged];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    // Populate the zip code text field
    _zipCodeTextField.text = dataManager.zipCode;
}


- (void)viewWillDisappear:(BOOL)animated
{
//    NSLog(@"zip at end of Settings is: %@", dataManager.zipCode);
}


-(void)dismissKeyboard
{
    [_zipCodeTextField resignFirstResponder];
    dataManager.zipCode = _zipCodeTextField.text;
    
    if (dataManager.zipCode == nil)
        NSLog(@"NO ZIPCODE?!");
    
    NSLog(@"zip after entry is: %@", dataManager.zipCode);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)click:(id)sender
{
    // Toggle for Celsius and Fahrenheit
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0)
        dataManager.isCelsius = TRUE;
    else
        dataManager.isCelsius = FALSE;
    
}


@end
