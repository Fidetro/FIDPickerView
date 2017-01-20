//
//  FIDPickerView.m
//  FIDPickerView
//
//  Created by Fidetro on 16/9/12.
//  Copyright © 2016年 Fidetro. All rights reserved.
//

#import "FIDPickerView.h"

#define kLabelFontSize (15)

@interface FIDPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>


@end

@implementation FIDPickerView



- (instancetype)initWithDataSource:(NSArray *)dataArray detailSource:(NSArray *)detailArray{
    self = [super init];
    if (self) {
        
        self.dataArray = dataArray;
        self.detailArray = detailArray;
        self.delegate = self;
        self.dataSource = self;
        
    }
    return self;
}



#pragma mark - --------------------------UIPickerViewDataSource--------------------------
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return self.dataArray.count;
    
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return ((NSArray *)((self.dataArray[component]))).count;
    
}
#pragma mark - --------------------------UIPickerViewDelegate--------------------
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.dataArray[component][row];
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    UILabel *rowLabel = [[UILabel alloc]init];
    rowLabel.textAlignment = NSTextAlignmentCenter;
    [rowLabel setFont:[UIFont systemFontOfSize:kLabelFontSize]];
    if (self.detailArray.count != self.dataArray.count) {
        
        rowLabel.text = [NSString stringWithFormat:@"%@",self.dataArray[component][row]];
    }else
        
        rowLabel.text = [NSString stringWithFormat:@"%@%@",self.dataArray[component][row],self.detailArray[component]];
    
    return rowLabel;
    
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    
    if (self.detailArray.count != self.dataArray.count) {
        
        return [[NSString stringWithFormat:@"%@",[self.dataArray[component] lastObject]] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kLabelFontSize]}].width+20;//防止选中的时候会偏移
    }else
        
        return [[NSString stringWithFormat:@"%@",[self.dataArray[component] lastObject]] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kLabelFontSize]}].width+[[NSString stringWithFormat:@"%@",self.detailArray[component]] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kLabelFontSize]}].width+20;//防止选中的时候会偏移
    
}

//选择pickerView显示内容的时候，需要重写这个方法
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    NSLog(@"滚动选择的内容 %@",self.dataArray[component][row]);
    
}

@end
