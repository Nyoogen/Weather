//  DataManager.m
//  This is the singleton class that holds all the shared data

#import "DataManager.h"
#import "genericInfo.h"

static DataManager *sharedManager = nil;

@implementation DataManager

@synthesize zipCode = _zipCode;
@synthesize isCelsius = _isCelsius;
@synthesize weatherData = _weatherData;


- (id)init
{
    if (self = [super init])
    {
        _zipCode = @defaultZipCode;
        _isCelsius = FALSE;
        _weatherData = nil;
    }
    return self;
}

+ (id)sharedManager
{
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

@end
