//
//  LetraInfo.m
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetraInfo.h"

@implementation LetraInfo

-(id) initWithLetra: (NSString *)l palavra: (NSString *)p traducao: (NSString *)t imagem:(NSString *)i num: (int)n{
    self = [super init];
    if (self) {
        _letra = l;
        _palavra = p;
        _num = n;
        _imagem = [[NSBundle mainBundle] pathForResource:i ofType:nil];
        _traducao = t;
    }
    return self;
}


@end
