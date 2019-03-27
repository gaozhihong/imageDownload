//
//  ImageDownLoad.h
//  image
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 HYR. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageDownLoad : NSObject

+(void)downloadImageWithUrl:(NSString*)imgUrl  completion:(void(^)(id image))completion;
@end

NS_ASSUME_NONNULL_END
