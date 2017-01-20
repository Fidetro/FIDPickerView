//
//  ViewController.m
//  PickerViewDemo
//
//  Created by Fidetro on 2017/1/17.
//  Copyright © 2017年 Fidetro. All rights reserved.
//

#import "ViewController.h"
#import "FIDPickerTableViewCell.h"
#import "FIDPickerButton.h"
#import "FIDPickerField.h"
#import "PickerViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/** tableView **/
@property(nonatomic,strong) UITableView *tableView;
/** pickerView Type **/
@property(nonatomic,strong) NSArray *typeArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.typeArray = @[@"FIDPickerTableViewCell",
                       @"FIDPickerButton",
                       @"FIDPickerField",
                       @"FIDPickerView",
                       ];
    [self.view addSubview:self.tableView];
    
}

#pragma mark - --------------------------UITableViewDataSource--------------------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.typeArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
  
 
    switch (indexPath.row) {
        case 0:
        {
         FIDPickerTableViewCell *pickerCell = [[FIDPickerTableViewCell alloc]initWithDataSource:@[@[@"广东",@"福建"],@[@"深圳"]] detailSource:@[@"省",@"市"]];
            pickerCell.select_block = ^(NSArray *selectArray,NSArray *rowInComponentArray){
                NSLog(@"pickerCell 确定选择的内容%@",selectArray);
            };
            pickerCell.textLabel.text = @"FIDPickerTableViewCell";
            return pickerCell;
            break;
        }
        case 1:
        {
            FIDPickerButton *pickerButton = [[FIDPickerButton alloc]initWithDataSource:@[@[@"广东",@"福建"],@[@"深圳"]] detailSource:@[@"省",@"市"]];
            pickerButton.frame = cell.contentView.bounds;
            [pickerButton addTarget:self action:@selector(clickPickerButtonEvent:) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:pickerButton];
            pickerButton.select_block = ^(NSArray *selectArray,NSArray *rowInComponentArray){
                NSLog(@"pickerButton 确定选择的内容%@",selectArray);
            };
            cell.textLabel.text = @"FIDPickerButton";
            return cell;
            break;
        }
        case 2:
        {
            FIDPickerField *pickerField = [[FIDPickerField alloc]initWithDataSource:@[@[@"广东",@"福建"],@[@"深圳"]] detailSource:@[@"省",@"市"]];
            pickerField.frame = CGRectMake(20, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height);
         pickerField.placeholder = @"FIDPickerField example";
            [cell addSubview:pickerField];
            pickerField.select_block = ^(NSArray *selectArray,NSArray *rowInComponentArray){
                NSLog(@"pickerField 确定选择的内容%@",selectArray);
            };
            return cell;
            
            break;
        }
        case 3:
        {
            
            break;
        }
        default:
        {
            break;
        }
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44.f;
    
}
#pragma mark - --------------------------UITableViewDelegate--------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return CGFLOAT_MIN;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell becomeFirstResponder];
    if (indexPath.row == 3) {
        [self.navigationController pushViewController:[PickerViewController new] animated:YES];
    }
    
    
}

- (void)clickPickerButtonEvent:(FIDPickerButton *)sender{
    
    [sender becomeFirstResponder];
    
}

- (UITableView *)tableView{
    
    if (!_tableView) {
        
        __weak UIView *superView = self.view;
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [superView addSubview:_tableView];
        //        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        //        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    
    return _tableView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
