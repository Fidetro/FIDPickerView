//
//  FIDPickerView.h
//  FIDPickerView
//
//  Created by Fidetro on 16/9/12.
//  Copyright © 2016年 Fidetro. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FIDPickerViewDelegate <NSObject>

- (void)FIDPickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

@end

@interface FIDPickerView : UIPickerView
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic,strong) NSArray *detailArray;
/** delegate **/
@property(nonatomic,weak)id<FIDPickerViewDelegate> FIDdelegate;

- (instancetype)initWithDataSource:(NSArray *)dataArray detailSource:(NSArray *)detailArray;

@end
