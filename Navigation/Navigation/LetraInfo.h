//
//  LetraInfo.h
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LetraInfo : NSObject

@property (nonatomic, strong) NSString *letra;
@property (nonatomic, strong) NSString *palavra;
@property (nonatomic, strong) UIImage *imagem;

-(id) initWithLetra: (NSString *)l palavra: (NSString *)p imagem:(NSString *)i;
@end
