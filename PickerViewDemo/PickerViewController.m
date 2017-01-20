//
//  PickerViewController.m
//  PickerViewDemo
//
//  Created by Fidetro on 2017/1/20.
//  Copyright © 2017年 Fidetro. All rights reserved.
//

#import "PickerViewController.h"
#import "FIDPickerView.h"
#import <Masonry.h>
@interface PickerViewController ()
/** pickerView **/
@property(nonatomic,strong) FIDPickerView *pickerView;
@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickerView = [[FIDPickerView alloc]initWithDataSource:@[@[@"广东",@"福建"],@[@"深圳"]] detailSource:nil];
    [self.view addSubview:self.pickerView];
    [self.pickerView mas_remakeConstraints:^(MASConstraintMaker *make) {
       
        make.center.mas_equalTo(self.view);
        
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"选择" style:UIBarButtonItemStylePlain target:self action:@selector(selectPicker)];
    
}

- (void)selectPicker{
    
    NSLog(@"选择的内容%@",self.pickerView.dataArray[[self.pickerView selectedRowInComponent:0]]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
