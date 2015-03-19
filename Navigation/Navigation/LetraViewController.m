//
//  LetraViewController.m
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"

@interface LetraViewController () {
    UILabel *traducao;
    UIImageView *imagem;
    UILabel *palavra;
}

//ImagePicker

@end

@implementation LetraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = [_letra letra];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = back;
    
    palavra = [[UILabel alloc] initWithFrame:CGRectMake(((self.view.frame.size.width/2)-50), 100, 100, 25)];
    palavra.text = [_letra palavra];
    [palavra sizeToFit];
    [palavra center];
    [self.view addSubview:palavra];
    
    traducao = [[UILabel alloc] initWithFrame:CGRectMake(((self.view.frame.size.width/2)-50), 125, 100, 25)];
    traducao.text = [_letra traducao];
    [traducao sizeToFit];
    [self.view addSubview:traducao];
    
    imagem = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 200, 0, 0)];
    imagem.image = [UIImage imageWithContentsOfFile:[_letra imagem]];
    [self.view addSubview:imagem];

}

-(void)viewWillAppear:(BOOL)animated{
    imagem.frame = CGRectMake(self.view.frame.size.width/2, 200, 0, 0);
    [UIView animateWithDuration:1.5 animations:^{
        imagem.frame = CGRectMake(self.view.frame.size.width/2 - 100, 200, 200, 200);
        for (int i = 0; i < 10; i++) {
            imagem.transform  = CGAffineTransformRotate(imagem.transform, M_PI);
        }
    } ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)next:(id)sender {

    [UIView animateWithDuration:0.5 animations:^{
        imagem.frame = CGRectMake(self.view.frame.size.width/2, 200, 0, 0);
    }completion:^(BOOL finished){
        NSLog(@"%d", [[self.navigationController viewControllers] count]);

        LetraViewController *proximo = [[LetraViewController alloc]
                                        initWithNibName:nil
                                        bundle:NULL];
        NSArray *letras = [[[CentralData alloc] init] getLetras];
        
        if ([_letra num] == 25) {
            proximo.letra = [letras objectAtIndex: 0];
        } else{
            proximo.letra = [letras objectAtIndex:[_letra num] +1];
        }
        
        NSMutableArray *controllers = [[NSMutableArray alloc] initWithArray:[self.navigationController viewControllers]];
        [controllers removeObjectAtIndex:1];
        [self.navigationController setViewControllers:controllers];
        
        [self.navigationController pushViewController:proximo animated:YES];
    }];
}

-(void)back:(id)sender{
    [UIView animateWithDuration:0.5 animations:^{
        imagem.frame = CGRectMake(self.view.frame.size.width/2, 200, 0, 0);
    }completion:^(BOOL finished){
        NSLog(@"%d", [[self.navigationController viewControllers] count]);

        LetraViewController *aa = [[LetraViewController alloc]
                                        initWithNibName:nil
                                        bundle:NULL];//Anterior do Anterior
        NSArray *letras = [[[CentralData alloc] init] getLetras];
        
        if ([_letra num] == 1) {
            aa.letra = [letras objectAtIndex: 25];
        } else if ([_letra num] == 0){
            aa.letra = [letras objectAtIndex: 24];
        } else{
            aa.letra = [letras objectAtIndex:[_letra num] -2];
        }
        
        NSMutableArray *controllers = [[NSMutableArray alloc] initWithArray:[self.navigationController viewControllers]];
        [controllers insertObject:aa atIndex:1];
        [self.navigationController setViewControllers:controllers];
        [self.navigationController popViewControllerAnimated:YES];
    }];
}
@end


//
//Código da animação erroneamente linda
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    if ([_letra num] < 25) {
//        UIBarButtonItem *next = [[UIBarButtonItem alloc]
//                                 initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
//        self.navigationItem.rightBarButtonItem=next;
//    }
//    palavra = [[UILabel alloc] initWithFrame:CGRectMake(((self.view.frame.size.width/2)-50), 100, 100, 25)];
//    palavra.text = [_letra palavra];
//    [self.view addSubview:palavra];
//    self.title = [_letra letra];
//    traducao = [[UILabel alloc] initWithFrame:CGRectMake(((self.view.frame.size.width/2)-50), 125, 100, 25)];
//    traducao.text = [_letra traducao];
//    [self.view addSubview:traducao];
//    imagem = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 200, 0, 0)];
//    imagem.image = [UIImage imageNamed:[_letra imagem]];
//    [self.view addSubview:imagem];
//    [UIView animateWithDuration:1.5 animations:^{
//        imagem.frame = CGRectMake(self.view.frame.size.width/2 - 100, 200, 200, 200);
//        for (int i = 0; i < 10; i++) {
//            imagem.transform  = CGAffineTransformRotate(imagem.transform, M_PI);
//        }
//    } ];
//}
//
//-(void)viewDidAppear:(BOOL)animated{
//    imagem.frame = CGRectMake(self.view.frame.size.width/2, 200, 0, 0);
//    [UIView animateWithDuration:1.5 animations:^{
//        imagem.frame = CGRectMake(self.view.frame.size.width/2 - 100, 200, 200, 200);
//        for (int i = 0; i < 10; i++) {
//            imagem.transform  = CGAffineTransformRotate(imagem.transform, M_PI);
//        }
//    } ];
//}