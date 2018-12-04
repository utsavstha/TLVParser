//
//  TLVParser.h
//  QPay
//
//  Created by Mac on 12/4/18.
//  Copyright © 2018 transthru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLVParser : NSObject
+ (NSMutableDictionary*) parseTLV: (NSString *) tlvString;

@end

