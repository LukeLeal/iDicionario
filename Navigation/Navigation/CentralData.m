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

//FAZER COMO SINGLETON
//Métodos são versão ALFA
-(NSArray *) createData{
    letras = [[NSArray alloc] initWithObjects:
              [[LetraInfo alloc] initWithLetra:@"A" palavra:@"Algum" imagem:@"q"],
              [[LetraInfo alloc] initWithLetra:@"B" palavra:@"Banana" imagem:@"q"],
              [[LetraInfo alloc] initWithLetra:@"C" palavra:@"Correio" imagem:@"q"],
              [[LetraInfo alloc] initWithLetra:@"D" palavra:@"Dado" imagem:@"q"],
              //[[LetraInfo alloc] initWithLetra:@"" palavra:@"" imagem:@""],
              nil];
    return letras;
}

-(NSArray *) getLetras{
    return letras;
}

@end
