//  DataManager.h

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
{
    
}

@property(weak, nonatomic) NSString *zipCode;
@property(nonatomic) BOOL isCelsius;
@property(weak, nonatomic) id weatherData;

+ (id)sharedManager;
@end
