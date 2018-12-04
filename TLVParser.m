//
//  TLVParser.m
//  QPay
//
//  Created by Mac on 12/4/18.
//  Copyright © 2018 transthru. All rights reserved.
//

#import "TLVParser.h"
@implementation TLVParser
+ (NSMutableDictionary*) parseTLV: (NSString *) tlvString{
    
    //Stores NSString as character array
    NSMutableArray *tlvCharacterArray = [NSMutableArray array];
    
    //Converts NSString to character array and stores in tlvCharacterArray
    for (int i = 0; i < [tlvString length]; i++) {
        [tlvCharacterArray addObject:[NSString stringWithFormat:@"%C", [tlvString characterAtIndex:i]]];
    }
    
    //Intialize a dictionary to store TLV as dictionary
    NSMutableDictionary *tagAndValue = [[NSMutableDictionary alloc] init];
    
    
    for (int i = 0; i < [tlvCharacterArray count];){
        if (i + 4 < [tlvCharacterArray count]){

            NSString* tag = [NSString stringWithFormat:@"%@%@", tlvCharacterArray[i], tlvCharacterArray[i + 1]];
            NSString* value = [NSString stringWithFormat:@"%@%@", tlvCharacterArray[i + 2], tlvCharacterArray[i + 3]];
            int valueLength = [value intValue];
            NSMutableArray *valueArray = [NSMutableArray array];
            
            for (int j = i + 4; j < i + 4 + valueLength; j++){
                [valueArray addObject:[NSString stringWithFormat:@"%C", [tlvString characterAtIndex:j]]];
            }
            [tagAndValue setObject:[valueArray componentsJoinedByString:@""]  forKey:tag];

            i += 4 + valueLength;
        }
        
    }
    return tagAndValue;
}


@end
