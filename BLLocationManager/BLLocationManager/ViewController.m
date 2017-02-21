//
//  ViewController.m
//  BLLocationManager
//
//  Created by boundlessocean on 2017/2/21.
//  Copyright © 2017年 ocean. All rights reserved.
//

#import "ViewController.h"
#import "BLLocationManager.h"
@interface ViewController ()<LocationManagerLocationDelegate>
@property (nonatomic, strong)UILabel *address;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"开始定位" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 20);
    button.center = self.view.center;
    [button addTarget:self action:@selector(startLocation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _address = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    _address.textAlignment = NSTextAlignmentCenter;
    _address.font = [UIFont systemFontOfSize:12];
    _address.numberOfLines = 0;
    _address.text = @"请使用真机测试";
    [self.view addSubview:_address];
}


- (void)startLocation{
    BLLocationManager *location = [BLLocationManager sharedManager];
    location.delegate = self;
    [location start];
}

- (void)locationManager:(BLLocationManager *)manager didUpdateAndGetLastCLLocation:(CLLocation *)location annAddress:(BLAddressModel *)addressModel{
    _address.text = [NSString stringWithFormat:@"省:%@,市:%@,区:%@,街道:%@",addressModel.province,addressModel.city,addressModel.area,addressModel.street];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
