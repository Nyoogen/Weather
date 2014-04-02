//  DataContainer.m

#import "DataContainer.h"
#import "genericInfo.h"

@implementation DataContainer
@synthesize weatherData = _weatherData;
@synthesize zipCode = _zipCode;
@synthesize isCelsius = _isCelsius;

-(id) init
{
    self = [super init];
    if (self)
    {
        _zipCode = @defaultZipCode;
        _isCelsius = FALSE;
        _weatherData = nil;
    }
    return self;
}
@end
