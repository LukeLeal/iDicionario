//
//  LetraViewController.h
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LetraInfo.h"
#import "CentralData.h"
#import <QuartzCore/QuartzCore.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface LetraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) LetraInfo *letra;
//@property (nonatomic, strong) IBOutlet UILabel *titulo;
//@property (nonatomic, strong) IBOutlet UIImageView *imagem;
//@property (nonatomic, strong) IBOutlet UILabel *palavra;
@end
