//
//  TableViewController.m
//  Navigation
//
//  Created by Lucas Leal Mendonça on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController (){
    NSArray *letras;
    CentralData *cd;

}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    cd = [CentralData sharedInstance];
    letras = [cd getLetras];
    _table = [[UITableView alloc] initWithFrame:CGRectMake(0, 25, self.view.frame.size.width, self.view.frame.size.height - 65)];
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Celula"];
    cell.imageView.image = [UIImage imageWithContentsOfFile:[(LetraInfo *)[letras objectAtIndex:indexPath.row] imagem]];
    cell.textLabel.text = [(LetraInfo *)[letras objectAtIndex:indexPath.row] palavra];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [letras count];
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
