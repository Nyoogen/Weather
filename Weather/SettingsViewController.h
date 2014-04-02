//  SettingsViewController.h

#import <UIKit/UIKit.h>
#import "DataManager.h"

@interface SettingsViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UISegmentedControl *tempUnitControl;
    DataManager *dataManager;
}
@property (weak, nonatomic) IBOutlet UITextField *zipCodeTextField;

@end
