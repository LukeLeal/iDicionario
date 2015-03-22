//
//  CentralData.h
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LetraInfo.h"

@class LetraInfo;
@interface CentralData : NSObject

+ (CentralData*)sharedInstance;
- (void) dadosPadrao;
- (NSArray *) getLetras;
@end
