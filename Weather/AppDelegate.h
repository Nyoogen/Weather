//  AppDelegate.h

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "WeatherViewController.h"
#import "SettingsViewController.h"
#import "DataManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>
{
    
}
@property (strong, nonatomic) UIWindow *window;
@end
