//
//  CryptingManager.h
//  CoreLibrary
//
// CTXSDK_HEAD_CREATED_BY
// CTXSDK_HEAD_COPYRIGHT
//

#import <Foundation/Foundation.h>

@interface RSASHA1Crypter : NSObject

#pragma mark - Functions

+ (nullable NSString *)signWithRSASha1:(NSString *_Nonnull)publicKey privateKey:(NSString*_Nonnull)privateKeyBase64;


@end
