//
//  MainViewController.m
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController (){
    NSArray *letras;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISearchBar *search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width -50, 35)];
    search.text = @"NOT IMPLEMENTED";
    [self.view addSubview:search];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(((self.view.frame.size.width/2)-50), 150, 100, 25)];
    title.text = @"Dicionator";
    [self.view addSubview:title];
    //CentralData *cd = [[CentralData alloc] init];
    letras = [[[CentralData alloc] init] createData];
    //NSLog(@"%d", [letras count]);
    for (int i = 0; i < [letras count]; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake((i + 1)*15, 200, 10, 10);
        [button setTitle:[(LetraInfo *)[letras objectAtIndex:i] letra] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clicaLetra:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:i];
        [self.view addSubview:button];
    }
//    UIButton *teste = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    teste.frame = CGRectMake(50, 200, 10, 10);
//    [teste setTitle:@"A" forState:UIControlStateNormal];
//    [teste addTarget:self action:@selector(clicaLetra:) forControlEvents:UIControlEventTouchUpInside];
//    [teste setTag:1];
//    [self.view addSubview:teste];
//    UIButton *teste2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    teste2.frame = CGRectMake(50, 300, 10, 10);
//    [teste2 setTitle:@"B" forState:UIControlStateNormal];
//    [teste2 addTarget:self action:@selector(clicaLetra:) forControlEvents:UIControlEventTouchUpInside];
//    [teste2 setTag:2];
//    [self.view addSubview:teste2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clicaLetra: (id)sender{
    UIButton *b = (UIButton *)sender;
    LetraViewController *lvc = [[LetraViewController alloc] init];
    lvc.letra = [letras objectAtIndex:[b tag]];
    [self.navigationController pushViewController:lvc animated:YES];
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
