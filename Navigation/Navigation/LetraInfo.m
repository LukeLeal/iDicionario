//
//  LetraInfo.m
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetraInfo.h"

@implementation LetraInfo

-(id) initWithLetra: (NSString *)l palavra: (NSString *)p imagem:(NSString *)i{
    self = [super init];
    if (self) {
        _letra = l;
        _palavra = p;
    }
    return self;
}


@end
