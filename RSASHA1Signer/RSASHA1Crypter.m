//
//  CryptingManager.m
//  CoreLibrary
//
// CTXSDK_HEAD_CREATED_BY
// CTXSDK_HEAD_COPYRIGHT
//

#import "RSASHA1Crypter.h"
#import "NSData+Base64.h"
#import <openssl/md5.h>
#import <openssl/sha.h>
#import <openssl/evp.h>
#import <openssl/pem.h>

@implementation RSASHA1Crypter


+ (NSString *)signWithRSASha1:(NSString *)publicKey privateKey:(NSString*)privateKeyBase64 {
  
    NSData *privateKeyData = [NSData dataFromBase64String:privateKeyBase64];
    NSError *error;
    NSURL *cacheDir = [[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject];
    NSString *infile = [[cacheDir URLByAppendingPathComponent:@"privkey.der"] path];
    [privateKeyData writeToFile:infile options:NSDataWritingFileProtectionComplete error:&error];
    
    NSData *signature = nil;
    if (!error) {
        BIO *in = BIO_new_file([infile cStringUsingEncoding:NSUTF8StringEncoding], "rb");
        PKCS8_PRIV_KEY_INFO *p8inf = d2i_PKCS8_PRIV_KEY_INFO_bio(in, NULL);
        EVP_PKEY *pkey = EVP_PKCS82PKEY(p8inf);
        PKCS8_PRIV_KEY_INFO_free(p8inf);
        BIO_free(in);
        unsigned int signatureLength;
        const char* sourceChars = [publicKey UTF8String];
        unsigned char digest[SHA_DIGEST_LENGTH];
        SHA1((const unsigned char *)sourceChars, strlen(sourceChars), digest);
        unsigned char *signatureBuffer = malloc(RSA_size(pkey->pkey.rsa));
        int result = RSA_sign(NID_sha1, digest, (unsigned int) sizeof(digest), signatureBuffer, &signatureLength, pkey->pkey.rsa);
        if (result != 0)
            signature = [NSData dataWithBytes:signatureBuffer length:signatureLength];
        free(signatureBuffer);
    }
    return signature != nil ? [signature base64EncodedString] : nil;
}

@end
