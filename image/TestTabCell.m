//
//  TestTabCell.m
//  image
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 HYR. All rights reserved.
//

#import "TestTabCell.h"

@implementation TestTabCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return self;
}

-(void)setupSubViews{
    _pictureView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 150, 100)];
    _pictureView.backgroundColor = [UIColor purpleColor];
    [self.contentView addSubview:_pictureView];
}
@end
