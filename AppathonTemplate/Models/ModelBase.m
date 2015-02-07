//
//  ModelBase.m
//  JSON Test
//

#import "ModelBase.h"
#import <objc/runtime.h>

@implementation ModelBase

- (id)initWithDict:(NSDictionary*)dict
{
    self = [super init];
    if (self) {
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList(self.class, &outCount);
        for (i = 0; i < outCount; i++) {
            NSString *propertyName;
            objc_property_t property = properties[i];
            propertyName = [NSString stringWithCString:property_getName(property)];
            
            id myObject = [dict valueForKey:propertyName];
            
            if (myObject == nil) {
                continue;
            }
            
            
            NSString *text = propertyName;
            NSString *capitalized = [[[text substringToIndex:1] uppercaseString] stringByAppendingString:[text substringFromIndex:1]];
            NSString *className = NSStringFromClass([self class]);
            
            if ([myObject isKindOfClass:[NSArray class]]) {
                
                NSMutableArray *array = [NSMutableArray array];
                for (id innerObject in myObject) {
                    if ([innerObject isKindOfClass:[NSDictionary class]]) {
                        if (NSClassFromString(className) != nil) {
                            [array addObject:[[NSClassFromString(className) alloc]initWithDict:innerObject]];
                        }
                        else {
                            [NSException raise:@"Model class not found." format:@"Class with name %@ not found.", className];
                        }
                    }
                    else {
                        [array addObject:innerObject];
                    }
                }
                [self setValue:array forKey:propertyName];
                
            }
            else if ([myObject isKindOfClass:[NSDictionary class]]) {
                
                if (NSClassFromString(className) != nil) {
                    [self setValue:[[NSClassFromString(className) alloc]initWithDict:myObject] forKey:propertyName];
                }
                else {
                    [NSException raise:@"Model class not found." format:@"Class with name %@ not found.", className];
                }
                
            }
            else {
                [self setValue:myObject forKey:propertyName];
            }
        }
        free(properties);
    }
    return self;
}

- (NSDictionary*)toDict
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(self.class, &outCount);
    for (i = 0; i < outCount; i++) {
        NSString *propertyName;
        objc_property_t property = properties[i];
    	propertyName = [NSString stringWithCString:property_getName(property)];
        id myObject = [self valueForKey:propertyName];
        
        if (myObject == nil) {
            continue;
        }
        
        if ([myObject isKindOfClass:[NSArray class]]) {
            NSMutableArray *dictArray = [NSMutableArray array];
            for (id object in myObject) {
                if ([object respondsToSelector:@selector(toDict)]) {
                    [dictArray addObject:[object toDict]];
                }
                else {
                    [dictArray addObject:object];
                }
            }
            [dict setObject:dictArray forKey:propertyName];
        }
        else if ([myObject respondsToSelector:@selector(toDict)]) {
            [dict setObject:[myObject toDict] forKey:propertyName];
        }
        else {
            [dict setObject:myObject forKey:propertyName];
        }
    }
    free(properties);
    return dict;
}

- (NSString*)toJSONString
{
    
    NSDictionary *dict = [self toDict];
    NSError *error = nil;
    //convert object to data
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted error:&error];
    
    return [[NSString alloc] initWithData:jsonData
                                 encoding:NSUTF8StringEncoding];
}

- (NSString*)errorMessageForKey:(NSString*)key
{
    return key;
}

- (NSMutableDictionary*)actualRequestToBeSent
{
//    NSMutableDictionary *wrapper = [NSMutableDictionary dictionary];
//    [wrapper setObject:[self decoratedRequestPart] forKey:@"request"];
//    return wrapper;
    return [self decoratedRequestPart];
}

- (NSMutableDictionary*)decoratedRequestPart
{
    NSMutableDictionary *dataPart = [self toDict];
    
//    NSMutableDictionary *request = [NSMutableDictionary dictionary];
//    [request setObject:dataPart forKey:@"data"];
//    [request setObject:@"json" forKey:@"response_format"];
//    [request setObject:@"s" forKey:@"formFactor"];
//    return request;
    return dataPart;
}

- (NSString*)decoratedJSONRequest
{
    NSError *error = nil;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:[self actualRequestToBeSent]
                                                       options:0 error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    jsonString = [jsonString stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    
    NSLog(@"request is %@",jsonString);
    
    
    return jsonString;
}

+ (NSString*)getName
{
    return @"name";
}
+ (NSString*)getGroup
{
    return @"group";
}
+ (NSString*)getVersion
{
    return @"version";
}
@end
