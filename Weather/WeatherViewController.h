//  WeatherViewController.h

#import <UIKit/UIKit.h>
#import "DataManager.h"

@interface WeatherViewController : UIViewController <UITextFieldDelegate>
{
    DataManager *dataManager;
}
@property (nonatomic) IBOutlet UITextField *currentTemp;
@property (nonatomic) IBOutlet UITextField *todayFeelTemp;
@property (nonatomic) IBOutlet UITextField *todayLo;
@property (nonatomic) IBOutlet UITextField *todayHi;
@property (nonatomic) IBOutlet UITextField *tomorrowLo;
@property (nonatomic) IBOutlet UITextField *tomorrowHi;
@property (nonatomic) IBOutlet UITextField *secondDayName;
@property (nonatomic) IBOutlet UITextField *secondDayLo;
@property (nonatomic) IBOutlet UITextField *secondDayHi;
@property (nonatomic) IBOutlet UITextField *thirdDayName;
@property (nonatomic) IBOutlet UITextField *thirdDayLo;
@property (nonatomic) IBOutlet UITextField *thirdDayHi;

- (void)refresh;
- (void)gatherWeatherDataUsingZipCode;
@end
