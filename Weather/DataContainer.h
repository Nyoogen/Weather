//  DataContainer.h

#import <Foundation/Foundation.h>

@interface DataContainer : NSObject
@property (weak, nonatomic) id weatherData;
@property (weak, nonatomic) NSString *zipCode;
@property (nonatomic) BOOL isCelsius;
@end
