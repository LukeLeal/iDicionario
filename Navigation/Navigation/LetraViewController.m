//
//  LetraViewController.m
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"

@interface LetraViewController () {
    UILabel *titulo;
    UIImageView *imagem;
    UILabel *palavra;
}


@end

@implementation LetraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    titulo = [[UILabel alloc] initWithFrame:CGRectMake(((self.view.frame.size.width/2)-50), 100, 100, 25)];
    titulo.text = [_letra letra];
    [self.view addSubview:titulo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
