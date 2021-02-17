//
//  File.h
//  CompositePattern
//
//  Created by haijunyan on 2020/7/6.
//  Copyright © 2020年 haijunyan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, EFile) {
    kFile,
    kFolder
};

@interface File : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, assign) EFile fileType;

@property (nonatomic, strong, readonly) NSMutableArray <File *> *childFiles;

- (void)addFile:(File *)file;

+ (instancetype)fileWithFileType:(EFile)fileType fileName:(NSString *)name;

@end
