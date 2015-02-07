
#import <Foundation/Foundation.h>

@protocol JSONModelBaseProtocol <NSObject>

@required
- (NSDictionary*)toDict;
- (id)initWithDict:(NSDictionary*)dict;
- (NSString*)toJSONString;
//For validation purpose
- (BOOL)isValid:(NSError**)error;
@end
