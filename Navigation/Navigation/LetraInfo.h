//
//  LetraInfo.h
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface LetraInfo : RLMObject

@property (nonatomic, strong) NSString *letra;
@property (nonatomic, strong) NSString *palavra;
@property (nonatomic, strong) NSData *imagem;
@property (nonatomic, strong) NSString *traducao;
@property int num;
@property (nonatomic, strong) NSDate *data;

-(id) initWithLetra: (NSString *)l palavra: (NSString *)p traducao: (NSString *)t imagem:(NSString *)i num:(int)n;

- (void)setImagemWithUIImage:(UIImage *)newFoto;

//- (UIImage *)getImagemAsImage;
@end
