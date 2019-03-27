//
//  ViewController.m
//  image
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 HYR. All rights reserved.
//

#import "ViewController.h"
#import "TestTabCell.h"
#import "ImageDownLoad.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>


@end

@implementation ViewController{
    UITableView *_tableView;

    NSArray *_urlList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate  = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[TestTabCell class] forCellReuseIdentifier:@"TestTabCell"];
    
    [self prepareForData];
    
}

-(void)prepareForData{
    _urlList = @[@"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=530090170,1803130651&fm=27&gp=0.jpg",
                 @"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=935292084,2640874667&fm=27&gp=0.jpg",
                 @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1992085767,102835282&fm=27&gp=0.jpg",
                 @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=889120611,3801177793&fm=27&gp=0.jpg",
                 @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=620919022,129761896&fm=27&gp=0.jpg",
                 @"https://ss0.bdstatic.com/6Ox1bjeh1BF3odCf/it/u=3660968530,985748925&fm=191&app=48&size=h300&n=0&g=4n&f=JPEG?sec=1853310920&t=5e64af964be378c6c2a3b0acc65dfe24",
                 @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2143662777,1459579799&fm=27&gp=0.jpg",
                 @"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=530090170,1803130651&fm=27&gp=0.jpg",
                 @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=291303845,2210888318&fm=27&gp=0.jpg",
                 @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=704898019,4216131513&fm=27&gp=0.jpg",
                 @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3496345838,732839400&fm=27&gp=0.jpg",
                 @"http://img3.imgtn.bdimg.com/it/u=574531299,3347539224&fm=26&gp=0.jpg",
                 @"http://img4.imgtn.bdimg.com/it/u=3496857550,30979992&fm=26&gp=0.jpg",
                 @"http://img4.imgtn.bdimg.com/it/u=2860910900,3683614494&fm=26&gp=0.jpg",
                 ];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _urlList.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestTabCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestTabCell"];
    
    NSString *urlStr = _urlList[indexPath.row];
    
    [ImageDownLoad downloadImageWithUrl:urlStr completion:^(UIImage*  _Nonnull image) {
        if (image) {
             cell.pictureView.image = image;
        }
    }];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
@end
