//
//  FileCell.h
//  CompositePattern
//
//  Created by haijunyan on 2020/7/6.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileCell : UITableViewCell

@property (nonatomic, weak) id                data;
@property (nonatomic, weak) NSIndexPath      *indexPath;
@property (nonatomic, weak) UITableView      *tableView;
@property (nonatomic, weak) UIViewController *controller;

- (void)loadContent;


@end
