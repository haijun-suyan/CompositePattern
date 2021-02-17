//
//  ViewController.m
//  CompositePattern
//
//  Created by haijunyan on 2020/7/6.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import "ViewController.h"
#import "FileCell.h"
#import "File.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) File        *root;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Root";
    
    // 创建根节点
    self.root = [File fileWithFileType:kFolder fileName:@"root"];
    
    // 创建第一级文件
    File *folder_A_1 = [File fileWithFileType:kFolder fileName:@"Folder-A-1"];
    File *file_A_2   = [File fileWithFileType:kFile fileName:@"File-A-2"];
    File *file_A_3   = [File fileWithFileType:kFile fileName:@"File-A-3"];
    File *file_A_4   = [File fileWithFileType:kFile fileName:@"File-A-4"];
    
    // 创建第二级文件
    File *folder_B_1 = [File fileWithFileType:kFolder fileName:@"Folder-B-1"];
    File *file_B_2   = [File fileWithFileType:kFile fileName:@"File-B-2"];
    File *file_B_3   = [File fileWithFileType:kFile fileName:@"File-B-3"];
    File *folder_B_2 = [File fileWithFileType:kFolder fileName:@"Folder-B-2"];
    
    // 创建第三级文件
    File *folder_C_1 = [File fileWithFileType:kFolder fileName:@"Folder-C-1"];
    File *file_C_1   = [File fileWithFileType:kFile fileName:@"File-C-1"];

    File *file_C_2   = [File fileWithFileType:kFile fileName:@"File-C-2"];
    
    [self.root addFile:folder_A_1];
    [self.root addFile:file_A_2];
    [self.root addFile:file_A_3];
    [self.root addFile:file_A_4];
    
    [folder_A_1 addFile:folder_B_1];
    [folder_A_1 addFile:file_B_2];
    [folder_A_1 addFile:file_B_3];
    [folder_A_1 addFile:folder_B_2];
    
    [folder_B_1 addFile:folder_C_1];
    [folder_B_1 addFile:file_C_1];
    [folder_B_2 addFile:file_C_2];
    
    [self initTableView];
}

#pragma mark - tableView相关
- (void)initTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.delegate       = self;
    self.tableView.dataSource     = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[FileCell class] forCellReuseIdentifier:@"fileCell"];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.root.childFiles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FileCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"fileCell"];
    cell.indexPath  = indexPath;
    cell.tableView  = tableView;
    cell.controller = self;
    
    // 传入节点File
    cell.data       = self.root.childFiles[indexPath.row];
    
    [cell loadContent];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80.f;
}

@end
