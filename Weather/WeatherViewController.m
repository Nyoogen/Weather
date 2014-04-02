//  WeatherViewController.m

#import "WeatherViewController.h"
#import "genericInfo.h"

@implementation WeatherViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated
{
    dataManager = [DataManager sharedManager];
//    NSLog(@"zipcode is: %@", dataManager.zipCode);
    [self refresh];
}

- (void)viewWillDisappear:(BOOL)animated
{
//    NSLog(@"zip while weather disappears: %@", dataManager.zipCode);
}
- (void)refresh
{
    [self gatherWeatherDataUsingZipCode];
    
    NSDictionary *currObs = dataManager.weatherData[@"current_observation"];
    NSDictionary *forecast = dataManager.weatherData[@"forecast"];
    NSArray *dayForecast = [[forecast objectForKey:@"simpleforecast"] objectForKey:@"forecastday"]; // This encompasses the current conditions as well as the 3-day forecast
//    NSString *date = [[[dayForecast objectAtIndex:2] objectForKey:@"date"] objectForKey:@"weekday"];
    
    NSNumber *temp;
    
    // Checks for Celsius or Fahrenheit, and displays appropriate numbers
    if (dataManager.isCelsius)
    {
        temp = [currObs objectForKey:@"temp_c"];
        _currentTemp.text = [NSString stringWithFormat:@"%@ °C", temp];
        temp = [currObs objectForKey:@"feelslike_c"];
        _todayFeelTemp.text = [NSString stringWithFormat:@"%@ °C", temp];
        temp = [[[dayForecast objectAtIndex:0] objectForKey:@"low"] objectForKey:@"celsius"];
        _todayLo.text = [NSString stringWithFormat:@"%@ °C", temp];
        temp = [[[dayForecast objectAtIndex:0] objectForKey:@"high"] objectForKey:@"celsius"];
        _todayHi.text = [NSString stringWithFormat:@"%@ °C", temp];
        
        temp = [[[dayForecast objectAtIndex:1] objectForKey:@"low"] objectForKey:@"celsius"];
        _tomorrowLo.text = [NSString stringWithFormat:@"%@ °C", temp];
        temp = [[[dayForecast objectAtIndex:1] objectForKey:@"high"] objectForKey:@"celsius"];
        _tomorrowHi.text = [NSString stringWithFormat:@"%@ °C", temp];

        NSString *secondDay = [[[dayForecast objectAtIndex:2] objectForKey:@"date"] objectForKey:@"weekday"];
        _secondDayName.text = secondDay;
        temp = [[[dayForecast objectAtIndex:2] objectForKey:@"low"] objectForKey:@"celsius"];
        _secondDayLo.text = [NSString stringWithFormat:@"%@ °C", temp];
        temp = [[[dayForecast objectAtIndex:2] objectForKey:@"high"] objectForKey:@"celsius"];
        _secondDayHi.text = [NSString stringWithFormat:@"%@ °C", temp];

        NSString *thirdDay = [[[dayForecast objectAtIndex:3] objectForKey:@"date"] objectForKey:@"weekday"];
        _thirdDayName.text = thirdDay;
        temp = [[[dayForecast objectAtIndex:3] objectForKey:@"low"] objectForKey:@"celsius"];
        _thirdDayLo.text = [NSString stringWithFormat:@"%@ °C", temp];
        temp = [[[dayForecast objectAtIndex:3] objectForKey:@"high"] objectForKey:@"celsius"];
        _thirdDayHi.text = [NSString stringWithFormat:@"%@ °C", temp];
    }
    else
    {
        temp = [currObs objectForKey:@"temp_f"];
        _currentTemp.text = [NSString stringWithFormat:@"%@ °F", temp];
        temp = [currObs objectForKey:@"feelslike_f"];
        _todayFeelTemp.text = [NSString stringWithFormat:@"%@ °F", temp];
        temp = [[[dayForecast objectAtIndex:0] objectForKey:@"low"] objectForKey:@"fahrenheit"];
        _todayLo.text = [NSString stringWithFormat:@"%@ °F", temp];
        temp = [[[dayForecast objectAtIndex:0] objectForKey:@"high"] objectForKey:@"fahrenheit"];
        _todayHi.text = [NSString stringWithFormat:@"%@ °F", temp];
        
        temp = [[[dayForecast objectAtIndex:1] objectForKey:@"low"] objectForKey:@"fahrenheit"];
        _tomorrowLo.text = [NSString stringWithFormat:@"%@ °F", temp];
        temp = [[[dayForecast objectAtIndex:1] objectForKey:@"high"] objectForKey:@"fahrenheit"];
        _tomorrowHi.text = [NSString stringWithFormat:@"%@ °F", temp];
        
        NSString *secondDay = [[[dayForecast objectAtIndex:2] objectForKey:@"date"] objectForKey:@"weekday"];
        _secondDayName.text = secondDay;
        temp = [[[dayForecast objectAtIndex:2] objectForKey:@"low"] objectForKey:@"fahrenheit"];
        _secondDayLo.text = [NSString stringWithFormat:@"%@ °F", temp];
        temp = [[[dayForecast objectAtIndex:2] objectForKey:@"high"] objectForKey:@"fahrenheit"];
        _secondDayHi.text = [NSString stringWithFormat:@"%@ °F", temp];
        
        NSString *thirdDay = [[[dayForecast objectAtIndex:3] objectForKey:@"date"] objectForKey:@"weekday"];
        _thirdDayName.text = thirdDay;
        temp = [[[dayForecast objectAtIndex:3] objectForKey:@"low"] objectForKey:@"fahrenheit"];
        _thirdDayLo.text = [NSString stringWithFormat:@"%@ °F", temp];
        temp = [[[dayForecast objectAtIndex:3] objectForKey:@"high"] objectForKey:@"fahrenheit"];
        _thirdDayHi.text = [NSString stringWithFormat:@"%@ °F", temp];
    }

}

// Pulls data down from Weather Underground using their API
- (void)gatherWeatherDataUsingZipCode
{
    if (dataManager.zipCode == nil)
        NSLog(@"Then we've got a big problem");
    
    NSURL *wunderURL = [NSURL URLWithString:[NSString stringWithFormat:
                                             @"http://api.wunderground.com/api/%s/conditions/forecast/q/%@.json",
                                             wundergroundKey,
                                             dataManager.zipCode]];
    NSData *rawData = [NSData dataWithContentsOfURL:wunderURL];
    NSError *error;
    dataManager.weatherData = [NSJSONSerialization JSONObjectWithData:rawData
                                                              options:0
                                                                error:&error];
    
    if (error != nil)
    {
        NSLog(@"%@", [error localizedDescription]);
        // Should display something to the user
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



