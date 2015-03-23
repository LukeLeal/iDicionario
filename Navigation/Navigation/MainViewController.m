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
    CentralData *cd;
}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //COMENTAR ESTA ÁREA APÓS A PRIMEIRA EXECUÇÃO!
//    UIButton *dados = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    dados.frame = CGRectMake(((self.view.frame.size.width/2)-50), 400, 100, 25);
//    [dados setTitle:@"DADOS PADRÃO" forState:UIControlStateNormal];
//    [dados addTarget:self action:@selector(criaDados) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:dados];
//    //COMENTAR ESTA ÁREA APÓS A PRIMEIRA EXECUÇÃO!
    
    [self.view setBackgroundColor:[UIColor whiteColor]];

    UISearchBar *search = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width -50, 35)];
    search.placeholder = @"NOT IMPLEMENTED";
    [self.view addSubview:search];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(((self.view.frame.size.width/2)-50), 150, 100, 25)];
    title.text = @"Dicionario Controle Remoto";//Nome Placeholder
    [self.view addSubview:title];
    
    //Começa o dicionário diretamente pela letra A
    UIButton *comecar = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    comecar.frame = CGRectMake(((self.view.frame.size.width/2)-50), 300, 100, 25);
    [comecar setTitle:@"Começar" forState:UIControlStateNormal];
    [comecar addTarget:self action:@selector(iniciarDicio) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:comecar];
    
    cd = [CentralData sharedInstance];
    //Coloca links para cada letra do dicionário em posição baseada pela ordem alfabética
    letras = [cd getLetras];
    for (int i = 0; i < [letras count]/2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake((i + 1)*20, 200, 15, 10);
        [button setTitle:[(LetraInfo *)[letras objectAtIndex:i] letra] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clicaLetra:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:i]; //Tag é usado para indicar qual letra foi selecionada.
        [self.view addSubview:button];
    }
    for (int i = ([letras count]/2); i < [letras count]; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(((i + 1)*20)-260, 230, 15, 10);
        [button setTitle:[(LetraInfo *)[letras objectAtIndex:i] letra] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clicaLetra:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:i];
        [self.view addSubview:button];
        
    }

}

- (void) criaDados {
    [cd dadosPadrao];
    NSLog(@"Dados criados com sucesso. Reinicie o programa e comente a área da criação deste botão!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

-(void)iniciarDicio{
    //Coloca Z na posição 1 de "viewControllers" e dá push pro A. A array sempre terá tamanho 3 -> Tela inicial / Letra anterior / Letra Atual
    LetraViewController *lvc = [[LetraViewController alloc] init];
    lvc.letra = [letras objectAtIndex:0];//Letra A
    LetraViewController *lvcZ = [[LetraViewController alloc] init];
    lvcZ.letra = [letras objectAtIndex:25];//Letra Z
    NSMutableArray *controllers = [[NSMutableArray alloc] initWithArray:[self.navigationController viewControllers]];
    [controllers addObject:lvcZ];
    [self.navigationController setViewControllers:controllers];
    [self.navigationController pushViewController:lvc animated:NO]; //Não animado para não mostrar o pedaço da página do Z
}

-(void)clicaLetra: (id)sender{
    UIButton *b = (UIButton *)sender;
    LetraViewController *lvc = [[LetraViewController alloc] init];
    lvc.letra = [letras objectAtIndex:[b tag]];
    LetraViewController *lvcA = [[LetraViewController alloc] init];//Letra anterior à clicada
    if ([b tag] == 0) {
        lvcA.letra = [letras objectAtIndex:25];
    } else {
        lvcA.letra = [letras objectAtIndex:[b tag] -1];
    }
    NSMutableArray *controllers = [[NSMutableArray alloc] initWithArray:[self.navigationController viewControllers]];
    [controllers addObject:lvcA];
    [self.navigationController setViewControllers:controllers];
    [self.navigationController pushViewController:lvc animated:NO];
    
}

/*

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
