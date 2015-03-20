//
//  CentralData.h
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LetraInfo.h"

@interface CentralData : NSObject

- (CentralData *) instancia;
- (NSArray *) getLetras;
- (void) setLetras: (NSArray *)arr;
@end
