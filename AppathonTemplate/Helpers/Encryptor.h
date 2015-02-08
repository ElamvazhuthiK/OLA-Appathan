//
//  Encryptor.h
//  KMB
//
//  Created by Sharma Elanthiraiyan on 3/2/13.
//
//

#define ENCRYPTION_KEY @"[C@3d833955"
#import <Foundation/Foundation.h>

@interface Encryptor : NSObject

+ (Encryptor*)encryptor;
- (NSData*)encryptString:(NSString*)plaintext withKey:(NSString*)key;
- (NSString*)decryptData:(NSData*)ciphertext withKey:(NSString*)key;

@end
