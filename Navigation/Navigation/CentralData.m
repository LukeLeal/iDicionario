//
//  CentralData.m
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "CentralData.h"
#import <Realm/Realm.h>

static CentralData *SINGLETON = nil;
static bool isFirstAccess = YES;

//static NSArray *letras;
@implementation CentralData

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}


- (id) init
{
    //[[NSFileManager defaultManager] removeItemAtPath:[RLMRealm defaultRealmPath] error:nil]; //Executar caso queira deletar os dados do Realm.
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self dadosPadrao]; //COMENTAR ESSA LINHA SE OS DADOS PADRÃO JÁ EXISTIREM NO REALM!!
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}

-(NSArray *) getLetras{
    RLMResults *resultados = [LetraInfo allObjects];
    NSMutableArray *letras = [[NSMutableArray alloc] initWithCapacity:[resultados count]];
    
    for (LetraInfo *li in resultados) {
        [letras addObject:li];
    }
    return letras;
}

//Método usado apenas uma vez para colocar os dados padrão.
-(void) dadosPadrao{
        NSArray *letras = [[NSArray alloc] initWithObjects:
                  [[LetraInfo alloc] initWithLetra:@"A" palavra:@"Armadillo" traducao:@"Tatu" imagem:@"letraA.jpg" num: 0],
                  [[LetraInfo alloc] initWithLetra:@"B" palavra:@"Beaver" traducao:@"Castor" imagem:@"letraB.jpg" num:1],
                  [[LetraInfo alloc] initWithLetra:@"C" palavra:@"Cow" traducao:@"Vaca" imagem:@"letraC.jpg" num:2],
                  [[LetraInfo alloc] initWithLetra:@"D" palavra:@"Duck" traducao:@"Pato" imagem:@"letraD.jpg" num:3],
                  [[LetraInfo alloc] initWithLetra:@"E" palavra:@"Eagle" traducao:@"Águia" imagem:@"letraE.jpg" num:4],
                  [[LetraInfo alloc] initWithLetra:@"F" palavra:@"Fox" traducao:@"Raposa" imagem:@"letraF.jpg" num:5],
                  [[LetraInfo alloc] initWithLetra:@"G" palavra:@"Goat" traducao:@"Cabra" imagem:@"letraG.jpg" num:6],
                  [[LetraInfo alloc] initWithLetra:@"H" palavra:@"Hedgehog" traducao:@"Ouriço" imagem:@"letraH.jpg" num:7],
                  [[LetraInfo alloc] initWithLetra:@"I" palavra:@"Indochinese Tiger" traducao:@"Tigre-da-Indochina" imagem:@"letraI.jpg" num:8],
                  [[LetraInfo alloc] initWithLetra:@"J" palavra:@"Jellyfish" traducao:@"Medusa" imagem:@"letraJ.jpg" num:9],
                  [[LetraInfo alloc] initWithLetra:@"K" palavra:@"Kangaroo" traducao:@"Canguru" imagem:@"letraK.jpg" num:10],
                  [[LetraInfo alloc] initWithLetra:@"L" palavra:@"Lobster" traducao:@"Lagosta" imagem:@"letraL.jpg" num:11],
                  [[LetraInfo alloc] initWithLetra:@"M" palavra:@"Macau" traducao:@"Arara" imagem:@"letraM.jpg" num:12],
                  [[LetraInfo alloc] initWithLetra:@"N" palavra:@"Nightingale" traducao:@"Rouxinol" imagem:@"letraN.jpg" num:13],
                  [[LetraInfo alloc] initWithLetra:@"O" palavra:@"Ocelot" traducao:@"Jaguatirica" imagem:@"letraO.jpg" num:14],
                  [[LetraInfo alloc] initWithLetra:@"P" palavra:@"Peacock" traducao:@"Pavão" imagem:@"letraP.jpg" num:15],
                  [[LetraInfo alloc] initWithLetra:@"Q" palavra:@"placeholder" traducao:@"placeholder" imagem:@"letra.jpg" num:16],
                  [[LetraInfo alloc] initWithLetra:@"R" palavra:@"placeholder" traducao:@"placeholder" imagem:@"letra.jpg" num:17],
                  [[LetraInfo alloc] initWithLetra:@"S" palavra:@"placeholder" traducao:@"placeholder" imagem:@"letra.jpg" num:18],
                  [[LetraInfo alloc] initWithLetra:@"T" palavra:@"placeholder" traducao:@"placeholder" imagem:@"letra.jpg" num:19],
                  [[LetraInfo alloc] initWithLetra:@"U" palavra:@"placeholder" traducao:@"placeholder" imagem:@"letra.jpg" num:20],
                  [[LetraInfo alloc] initWithLetra:@"V" palavra:@"placeholder" traducao:@"placeholder" imagem:@"letra.jpg" num:21],
                  [[LetraInfo alloc] initWithLetra:@"W" palavra:@"placeholder" traducao:@"placeholder" imagem:@"letra.jpg" num:22],
                  [[LetraInfo alloc] initWithLetra:@"X" palavra:@"placeholder" traducao:@"placeholder" imagem:@"letra.jpg" num:23],
                  [[LetraInfo alloc] initWithLetra:@"Y" palavra:@"Yak" traducao:@"Iaque" imagem:@"letraY.jpg" num:24],
                  [[LetraInfo alloc] initWithLetra:@"Z" palavra:@"Zebra Shark" traducao:@"Tubarão Zebra" imagem:@"letraZ.jpg" num:25],
                  
                  //[[LetraInfo alloc] initWithLetra:@"" palavra:@"" imagem:@""],
                  nil];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    for (LetraInfo *li in letras) {
        [realm addObject:li];;
    }
    [realm commitWriteTransaction];
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[CentralData alloc] init];
}

- (id)mutableCopy
{
    return [[CentralData alloc] init];
}




@end
