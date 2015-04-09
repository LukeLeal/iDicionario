//
//  LetraInfo.m
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetraInfo.h"
#import <UIKit/UIKit.h>

@implementation LetraInfo

-(id) initWithLetra: (NSString *)l palavra: (NSString *)p traducao: (NSString *)t imagem:(NSString *)i num: (int)n{
    self = [super init];
    if (self) {
        _letra = l;
        _palavra = p;
        _num = n;
        [self setImagemWithUIImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:i ofType:nil]]];//Configura o NSData de acordo com a imagem gerada de acordo com o caminho do nome do arquivo passado (i).
        _traducao = t;
        _data = [NSDate date];
        //[imagem setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[_letra imagem] ofType:nil]] forState:UIControlStateNormal];
    }
    return self;
}

- (void)setImagemWithUIImage:(UIImage *)newFoto {
    _imagem = UIImagePNGRepresentation(newFoto);
}

//- (UIImage *)getImagemAsImage {
//    return [UIImage imageWithData:_imagem];
//}

@end
