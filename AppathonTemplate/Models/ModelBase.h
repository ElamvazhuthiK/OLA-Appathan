//
//  ModelBase.h
//  JSON Test
//

#import <Foundation/Foundation.h>
#import "JSONModelBaseProtocol.h"
@interface ModelBase : NSObject <JSONModelBaseProtocol>
- (NSString*)toJSONString;
- (id)initWithDict:(NSDictionary*)dict;
- (NSString*)errorMessageForKey:(NSString*)key;
- (NSString*)decoratedJSONRequest;
@end
