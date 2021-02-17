//
//  FileViewController.h
//  CompositePattern
//
//  Created by haijunyan on 2020/7/6.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "File.h"

@interface FileViewController : UIViewController

/**
 *  根节点
 */
@property (nonatomic, strong) File  *rootFile;

@end
