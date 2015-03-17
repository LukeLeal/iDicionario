//
//  CentralData.m
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "CentralData.h"

static NSArray *letras;
@implementation CentralData

static CentralData *_cd = nil;

+ (CentralData *) instancia{
    if (_cd == nil) {
        _cd = [[CentralData alloc] init];
    }
    return _cd;
}

-(id) init{
    self = [super init];
    if (self) {
        letras = [[NSArray alloc] initWithObjects:
                  [[LetraInfo alloc] initWithLetra:@"A" palavra:@"Armadillo" traducao:@"Tatu" imagem:@"letraA.jpg" num: 0],
                  [[LetraInfo alloc] initWithLetra:@"B" palavra:@"Beaver" traducao:@"Castor" imagem:@"letraB.jpg" num:1],
                  [[LetraInfo alloc] initWithLetra:@"C" palavra:@"Cow" traducao:@"Vaca" imagem:@"letraC.jpg" num:2],
                  [[LetraInfo alloc] initWithLetra:@"D" palavra:@"placeholder" traducao:@"placeholder" imagem:@"" num:3],
                  [[LetraInfo alloc] initWithLetra:@"E" palavra:@"placeholder" traducao:@"placeholder" imagem:@"" num:4],
                  [[LetraInfo alloc] initWithLetra:@"F" palavra:@"placeholder" traducao:@"placeholder" imagem:@"" num:5],
                  [[LetraInfo alloc] initWithLetra:@"G" palavra:@"placeholder" traducao:@"placeholder" imagem:@"" num:6],
                  [[LetraInfo alloc] initWithLetra:@"H" palavra:@"placeholder" traducao:@"placeholder" imagem:@"" num:7],
                  [[LetraInfo alloc] initWithLetra:@"I" palavra:@"placeholder" traducao:@"placeholder" imagem:@"" num:8],
                  [[LetraInfo alloc] initWithLetra:@"J" palavra:@"placeholder" traducao:@"placeholder" imagem:@"" num:9],
                  [[LetraInfo alloc] initWithLetra:@"K" palavra:@"placeholder" traducao:@"placeholder" imagem:@"" num:10],
                  [[LetraInfo alloc] initWithLetra:@"L" palavra:@"placeholder" traducao:@"placeholder" imagem:@"" num:11],
                  [[LetraInfo alloc] initWithLetra:@"M" palavra:@"placeholder" traducao:@"placeholder" imagem:@"" num:12],
                  [[LetraInfo alloc] initWithLetra:@"N" palavra:@"" traducao:@"" imagem:@"" num:13],
                  [[LetraInfo alloc] initWithLetra:@"O" palavra:@"" traducao:@"" imagem:@"" num:14],
                  [[LetraInfo alloc] initWithLetra:@"P" palavra:@"" traducao:@"" imagem:@"" num:15],
                  [[LetraInfo alloc] initWithLetra:@"Q" palavra:@"" traducao:@"" imagem:@"" num:16],
                  [[LetraInfo alloc] initWithLetra:@"R" palavra:@"" traducao:@"" imagem:@"" num:17],
                  [[LetraInfo alloc] initWithLetra:@"S" palavra:@"" traducao:@"" imagem:@"" num:18],
                  [[LetraInfo alloc] initWithLetra:@"T" palavra:@"" traducao:@"" imagem:@"" num:19],
                  [[LetraInfo alloc] initWithLetra:@"U" palavra:@"" traducao:@"" imagem:@"" num:20],
                  [[LetraInfo alloc] initWithLetra:@"V" palavra:@"" traducao:@"" imagem:@"" num:21],
                  [[LetraInfo alloc] initWithLetra:@"W" palavra:@"" traducao:@"" imagem:@"" num:22],
                  [[LetraInfo alloc] initWithLetra:@"X" palavra:@"" traducao:@"" imagem:@"" num:23],
                  [[LetraInfo alloc] initWithLetra:@"Y" palavra:@"Yak" traducao:@"Iaque" imagem:@"letraY.jpg" num:24],
                  [[LetraInfo alloc] initWithLetra:@"Z" palavra:@"Zebra Shark" traducao:@"Tubarão Zebra" imagem:@"letraZ.jpg" num:25],
                  
                  //[[LetraInfo alloc] initWithLetra:@"" palavra:@"" imagem:@""],
                  nil];
    }
    return self;
}

-(NSArray *) getLetras{
    return letras;
}

@end
