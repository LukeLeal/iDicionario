//
//  TableViewController.h
//  Navigation
//
//  Created by Lucas Leal Mendonça on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CentralData.h"
#import "LetraInfo.h"

@interface TableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property UITableView *table;

@end
