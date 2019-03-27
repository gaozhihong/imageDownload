//
//  ImageDownLoad.m
//  image
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 HYR. All rights reserved.
//

#import "ImageDownLoad.h"
#import <UIKit/UIKit.h>
#import "NSString+MD5Hash.h"

@interface ImageDownLoad()

@property(nonatomic,copy)NSString *documentPath;

@property(nonatomic,strong)NSDictionary *operationDict;


@end

@implementation ImageDownLoad
+(void)downloadImageWithUrl:(NSString *)imgUrl completion:(void (^)(id _Nonnull image))complete{
    if (imgUrl == nil) return;
     //创建当前对象
    ImageDownLoad *imgDownLoad = [[self alloc] init];
    
    NSString *imgFileName = [imgUrl md5HashToLower32Length];
    
    NSString *imgFilePath =  [imgDownLoad.documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",imgFileName]];
    NSData *imgData = [NSData dataWithContentsOfFile:imgFilePath];
    
    if (imgData) {
        UIImage *image = [UIImage imageWithData:imgData];
        complete(image);
       
    }else{
        //##将图片写入磁盘
        NSString *fileName = [imgUrl md5HashToLower32Length];
        // ImageDownLoad *imgDownLoad = [[ImageDownLoad alloc] init];
        NSString *filePath =  [imgDownLoad.documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",fileName]];
        
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        
        //##取消上一次的下载操作
        NSOperation *downloadOperation = [imgDownLoad.operationDict objectForKey:fileName];
        if (downloadOperation) {
            [downloadOperation cancel];
        }
        NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
            NSURL *url  = [NSURL URLWithString:imgUrl];
            NSData *data = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:data];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                complete(image);
            }];
            
            [data writeToFile:filePath atomically:YES];
        }];
        
        [queue addOperation:operation];
        
         //
        [imgDownLoad.operationDict setValue:operation forKey:fileName];
        
    }
    
}

-(NSString *)documentPath{
    return  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
}
-(NSDictionary *)operationDict{
    if (_operationDict) {
        _operationDict =[NSDictionary dictionary];
    }
    return _operationDict;
}
@end
