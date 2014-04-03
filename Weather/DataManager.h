//  DataManager.h

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
{
    
}

@property(retain, nonatomic) NSString *zipCode;
@property(nonatomic) BOOL isCelsius;
@property(retain, nonatomic) id weatherData;

+ (id)sharedManager;
@end
