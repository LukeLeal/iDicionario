//
//  LetraViewController.m
//  Navigation
//
//  Created by Lucas Leal Mendonça on 16/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetraViewController.h"

@interface LetraViewController () {
    NSArray *letras;
    UILabel *traducao;
//    UIImageView *imagem;
    UILabel *palavra;
    UIButton *imagem;
    CentralData *cd;
    UITextField *palavraEdit;
    UITextField *traducaoEdit;
}

//ImagePicker

@end

@implementation LetraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    cd = [CentralData sharedInstance];
    letras = [cd getLetras];
    
    UILongPressGestureRecognizer *longo = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handler:)];
    longo.minimumPressDuration = 0.5;
    [self.view addGestureRecognizer:longo];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.title = [_letra letra];
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = back;
    
    UIToolbar *tools = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width, 45)];
    [tools setBackgroundColor:[UIColor redColor]];
    
    UIBarButtonItem *edit = self.editButtonItem;//Ativa o modo de edição, chamando "setEditing"
    tools.items = @[edit];
    [self.view addSubview:tools];
    
    palavra = [[UILabel alloc] initWithFrame:CGRectMake(((self.view.frame.size.width/2)-50), 125, 100, 25)];
    palavra.text = [_letra palavra];
    [palavra sizeToFit];
    [palavra center];
    [self.view addSubview:palavra];
    
    palavraEdit = [[UITextField alloc] initWithFrame:CGRectMake(((self.view.frame.size.width/2)-100), 125, 200, 25)];
    palavraEdit.text = [_letra palavra];
    [palavraEdit setBackgroundColor:[UIColor redColor]];
    palavraEdit.hidden = TRUE; //Este text field apenas "existe" no modo de edição
    [self.view addSubview:palavraEdit];
    
    traducao = [[UILabel alloc] initWithFrame:CGRectMake(((self.view.frame.size.width/2)-50), 150, 100, 25)];
    traducao.text = [_letra traducao];
    [traducao sizeToFit];
    [self.view addSubview:traducao];
    
    traducaoEdit = [[UITextField alloc] initWithFrame:CGRectMake(((self.view.frame.size.width/2)-100), 150, 200, 25)];
    traducaoEdit.text = [_letra traducao];
    [traducaoEdit setBackgroundColor:[UIColor redColor]];
    traducaoEdit.hidden = TRUE; //Este text field apenas "existe" no modo de edição
    [self.view addSubview:traducaoEdit];
    
    imagem = [UIButton buttonWithType:UIButtonTypeCustom];//Imagem que é um botão. Necessário (?) para poder chamar ações.
    imagem.frame = CGRectMake(self.view.frame.size.width/2, 200, 0, 0);
    [imagem addTarget:self action:@selector(moveImagem:withEvent:) forControlEvents:UIControlEventTouchDown];//Muda o centro no momento do clique.
    [imagem addTarget:self action:@selector(moveImagem:withEvent:) forControlEvents:UIControlEventTouchDragInside];//Muda o centro de acordo com o "arrastamento".
    [imagem addTarget:self action:@selector(aumentaImagem:) forControlEvents:longo];
    [imagem setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[_letra imagem] ofType:nil]] forState:UIControlStateNormal];
    imagem.imageView.frame = CGRectMake(imagem.frame.size.width/2, imagem.frame.size.height, 0, 0);
    imagem.imageView.layer.cornerRadius = 110;//Determina o raio
    imagem.imageView.clipsToBounds = YES;//Delimita o tamanho ao raio.
    [self.view addSubview:imagem];
    
//    Código antigo:
//    imagem = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 200, 0, 0)];
//    imagem.image = [UIImage imageWithContentsOfFile:[_letra imagem]];
//    imagem.layer.cornerRadius = 110;//Determina o raio
//    imagem.clipsToBounds = YES;//Delimita o tamanho ao raio.
//    [self.view addSubview:imagem];

}

-(void)viewWillAppear:(BOOL)animated{
    //imagem.frame = CGRectMake(self.view.frame.size.width/2, 200, 0, 0);
    imagem.frame = CGRectMake(self.view.frame.size.width/2 - 110, 200, 220, 220);
    imagem.imageView.frame = CGRectMake(imagem.frame.size.width/2, imagem.frame.size.height/2, 0, 0);//Volta tamanho pra 0 aqui para não quebrar a animação durante transicão via tabBar
    [UIView animateWithDuration:1.5 animations:^{
        imagem.imageView.frame = CGRectMake(0, 0, 220, 220);
        for (int i = 0; i < 10; i++) {
            //Gira 180 graus 10 vezes. Deve ter um jeito mais melhor de bom.
            imagem.imageView.transform  = CGAffineTransformRotate(imagem.imageView.transform, M_PI);
        }
    } ];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) handler: (UILongPressGestureRecognizer *)gesture{
//    if (gesture.view == imagem) {
//        NSLog(@"e");
//    }
//    NSLog(@"a");
}


- (void)setEditing:(BOOL)flag animated:(BOOL)animated
{
    [super setEditing:flag animated:animated];
    if (flag == YES){
        palavra.hidden = TRUE;
        palavraEdit.hidden = FALSE;
        traducao.hidden = TRUE;
        traducaoEdit.hidden = FALSE;
    }
    else {
        //Altera os dados das palavras no "banco de dados" de acordo com o que foi digitado nos textField.
        RLMRealm *realm = [_letra realm];
        [realm beginWriteTransaction];
        [_letra setPalavra:palavraEdit.text];
        [_letra setTraducao:traducaoEdit.text];
        [realm commitWriteTransaction];
        
        
//        //NSArray *letras = [[[CentralData alloc] instancia] getLetras];
//
//        LetraInfo *altera = (LetraInfo *)[letras objectAtIndex:[_letra num]];
//        [altera setPalavra:[palavraEdit text]];
//        [altera setTraducao:[traducaoEdit text]];
//        
//        [[letras objectAtIndex:[altera num]] setPalavra:[altera palavra]];
//        [[letras objectAtIndex:[altera num]] setTraducao:[altera traducao]];

        palavra.text = palavraEdit.text;
        traducao.text = traducaoEdit.text;
        [palavra sizeToFit];
        palavra.hidden = FALSE;
        palavraEdit.hidden = TRUE;
        traducao.hidden = FALSE;
        traducaoEdit.hidden = TRUE;
        [traducao sizeToFit];
    }
}

- (IBAction) moveImagem:(id)sender withEvent:(UIEvent *)event{
    //Ponto determinado em duas dimensões terá as coordenadas do local do evento de clique (no caso, um que arrasta).
    CGPoint ponto = [[[event allTouches] anyObject] locationInView: self.view];
    
    //Classe base de objetos como o botão. control recebe o botào clicado (sender).
    UIControl *control = sender;
    
    //DefZine o centro da frame de control como as coordenadas do ponto.
    control.center = ponto;
}

- (IBAction) aumentaImagem:(id)sender{
    NSLog(@"Ayy lmao");
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

    //imagem.imageView.frame = CGRectMake(imagem.frame.size.width/2, imagem.frame.size.height/2, 0, 0);

    [UIView animateWithDuration:0.5 animations:^{
        imagem.frame = CGRectMake(self.view.frame.size.width/2, 200, 0, 0);
    }completion:^(BOOL finished){

        //Deleta a posição 1 da array de views
        //Coloca a letra atual na posição 1 da array de views
        //Da push na próxima letra. Array sempre terá 3 objetos durante a troca de views.
        
        LetraViewController *proximo = [[LetraViewController alloc]
                                        initWithNibName:nil
                                        bundle:NULL];
        //NSArray *letras = [[[CentralData alloc] instancia] getLetras];
        
        if ([_letra num] == 25) {//Se letra for Z
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
        //Coloca a letra anterior da anterior na posição 1 da array.
        //Dá pop para a letra anterior da anterior (letra atual sai da array). Array sempre terá 3 objetos durante a troca de views.
        
        LetraViewController *aa = [[LetraViewController alloc]
                                        initWithNibName:nil
                                        bundle:NULL];//Anterior do Anterior
        //NSArray *letras = [[[CentralData alloc] instancia] getLetras];
        
        if ([_letra num] == 1) {//Se letra for B
            aa.letra = [letras objectAtIndex: 25];
        } else if ([_letra num] == 0){//Se letra for A
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