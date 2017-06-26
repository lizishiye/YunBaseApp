//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <CommonCrypto/CommonDigest.h>
#import "YunRqtUrlHelper.h"
#import "YunRqtConfig.h"

@interface YunRqtUrlHelper () {
}

@end

@implementation YunRqtUrlHelper

+ (NSMutableDictionary *)getBasePara {
    NSMutableDictionary *paraDic = [NSMutableDictionary dictionaryWithCapacity:2];

    if (YunRqtConfig.instance.apiKey) {
        paraDic[YunRqtConfig.instance.apiKeyParaName] = YunRqtConfig.instance.apiKey;
    }

    if (YunRqtConfig.instance.devType) {
        paraDic[YunRqtConfig.instance.devTypeParaName] = YunRqtConfig.instance.devType;
    }

    return paraDic;
}

// base + 分页查询参数
+ (NSMutableDictionary *)getBaseParaWithPageIndex:(NSInteger)startIndex pageSize:(NSInteger)pageSize {
    NSMutableDictionary *paraDic = [self getBasePara];

    if (startIndex > 0 && YunRqtConfig.instance.pageIndexParaName) {
        paraDic[YunRqtConfig.instance.pageIndexParaName] = @(startIndex);
    }

    if (pageSize > 0 && YunRqtConfig.instance.pageSizeParaName) {
        paraDic[YunRqtConfig.instance.pageSizeParaName] = @(pageSize);
    }

    return paraDic;
}

+ (NSMutableDictionary *)getBaseParaWithToken:(NSString *)token {
    NSMutableDictionary *paraDic = [self getBasePara];

    if (YunRqtConfig.instance.tokenParaName) {
        paraDic[YunRqtConfig.instance.tokenParaName] = token;
    }

    return paraDic;
}

+ (NSString *)urlCmBase:(NSString *)addr {
    return [[NSURL URLWithString:addr relativeToURL:YunRqtConfig.instance.baseURL] absoluteString];
}

+ (NSString *)urlCmBaseApi:(NSString *)addr {
    return [[NSURL URLWithString:addr relativeToURL:YunRqtConfig.instance.baseApiURL] absoluteString];
}

#pragma mark - other

+ (NSString *)strByArray:(NSArray *)array sep:(NSString *)sep {
    if (!array || array.count == 0) {
        return @"";
    }

    NSMutableString *mutS = [NSMutableString new];
    for (int j = 0; j < array.count; ++j) {
        if (j != 0) {
            [mutS appendString:sep];
        }
        [mutS appendString:array[j]];
    }
    return mutS;
}

+ (NSString *)strByArrayDic:(NSArray *)array key:(NSString *)keyName {
    if (!array || array.count == 0) {
        return @"";
    }

    NSMutableArray *tmpList = [NSMutableArray new];
    for (int i = 0; i < array.count; ++i) {
        NSDictionary *tagDic = @{keyName : array[i]};
        [tmpList addObject:tagDic];
    }

    return [self JSONString:[NSArray arrayWithArray:tmpList]];
}

+ (NSString *)JSONString:(id)data; {
    NSError *error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:data
                                                options:NSJSONWritingPrettyPrinted error:&error]; // kNilOptions
    if (error != nil) {
        return @"";
    }

    NSString *stringData = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];

    return stringData ? : @"";
}

+ (NSData *)JSONData:(id)data; {
    NSError *error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:data
                                                options:NSJSONWritingPrettyPrinted error:&error]; // kNilOptions
    if (error != nil) {
        return nil;
    }

    return result;
}

+ (NSString *)md5_16bit:(NSString *)str {//大写 %02X
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                                      result[0], result[1], result[2], result[3],
                                      result[4], result[5], result[6], result[7],
                                      result[8], result[9], result[10], result[11],
                                      result[12], result[13], result[14], result[15]
    ];
}

+ (NSString *)md5_16bit:(NSString *)strOrg salt:(NSString *)salt {//大写 %02X
    NSString *str = [NSString stringWithFormat:@"%@%@", strOrg, salt];
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                                      result[0], result[1], result[2], result[3],
                                      result[4], result[5], result[6], result[7],
                                      result[8], result[9], result[10], result[11],
                                      result[12], result[13], result[14], result[15]
    ];
}

+ (NSString *)md5_32bit:(NSString *)str {//小写
    const char *cStr = [str UTF8String];
    unsigned char result[32];
    CC_MD5(cStr, strlen(cStr), result);
    return [NSString stringWithFormat:
                             @"%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x",
                             result[0], result[1], result[2], result[3],
                             result[4], result[5], result[6], result[7],
                             result[8], result[9], result[10], result[11],
                             result[12], result[13], result[14], result[15],
                             result[16], result[17], result[18], result[19],
                             result[20], result[21], result[22], result[23],
                             result[24], result[25], result[26], result[27],
                             result[28], result[29], result[30], result[31]];
}

@end
