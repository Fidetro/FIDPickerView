//
//  FIDDateTableViewCell.m
//  PickerViewDemo
//
//  Created by Fidetro on 2017/4/20.
//  Copyright © 2017年 Fidetro. All rights reserved.
//

#import "FIDDateTableViewCell.h"
NSString *const kFIDDateTableViewCellIdentifier = @"kFIDDateTableViewCellIdentifier";
@interface FIDDateTableViewCell ()
{
    UIToolbar *_inputAccessoryView;
    UIPickerView *_inputView;
}


/** leftButton **/
@property(nonatomic,strong) UIButton *leftButton;
/** rightButton **/
@property(nonatomic,strong) UIButton *rightButton;


@end

@implementation FIDDateTableViewCell

- (instancetype)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kFIDDateTableViewCellIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)selectDataSource:(UIButton *)sender
{
    [self resignFirstResponder];
    if (self.select_block) {
        self.select_block(self.datePicker.date);
    }
    if (self.delegate) {
        [self.delegate selectdatePickerCell:self selectDate:self.datePicker.date];
    }
}

- (UIButton *)leftButton{
    
    if (!_leftButton) {
        
        _leftButton = [[UIButton alloc]init];
        [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_leftButton setTitle:@"取消" forState:UIControlStateNormal];
        [_leftButton sizeToFit];
        [_leftButton addTarget:self action:@selector(resignFirstResponder) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _leftButton;
    
}

- (UIButton *)rightButton{
    
    if (!_rightButton) {
        
        _rightButton = [[UIButton alloc]init];
        [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rightButton setTitle:@"确定" forState:UIControlStateNormal];
        [_rightButton sizeToFit];
        [_rightButton addTarget:self action:@selector(selectDataSource:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _rightButton;
    
}


- (UIView *)inputAccessoryView{
    
    if (!_inputAccessoryView) {
        
        UIToolbar * toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
        
        toolBar.barTintColor = [UIColor whiteColor];//设置toolBar背景颜色
        UIBarButtonItem * DoneItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftButton];
        
        UIBarButtonItem * enterItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightButton];
        UIBarButtonItem *springItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        toolBar.items = @[DoneItem,springItem,enterItem];
        
        
        return toolBar;
        
    }
    
    return _inputAccessoryView;
    
}



- (UIView *)inputView{
    
    if (!_inputView) {
        

        return self.datePicker;
        
    }
    
    return _inputView;
    
}

- (UIDatePicker *)datePicker
{
    if (!_datePicker) {
    _datePicker = [[UIDatePicker alloc]init];
    }
    return _datePicker;
}

- (BOOL)canBecomeFirstResponder{
    
    return YES;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
