//
//  FIDPickerField.h
//  FIDPickerView
//
//  Created by Fidetro on 16/9/12.
//  Copyright © 2016年 Fidetro. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SELECT_BLOCK)(NSArray *selectArray,NSArray *rowInComponentArray);
@protocol FIDPickerTextFieldDelegate <NSObject>

/**
 点击确定获取pickerView内容时候的代理方法
 
 @param Source 当前选中的数据源
 @param rowInComponentArray 当前选中每列的第几行
 */
- (void)selectPickerDataSource:(NSArray *)Source selectedRowInComponent:(NSArray *)rowInComponentArray;

@end
@interface FIDPickerField : UITextField


/** 选择的内容 **/
@property(nonatomic,strong,readonly)NSArray *selectArray;


/** delegate **/
@property(nonatomic,weak)id<FIDPickerTextFieldDelegate> pickerDelegate;
/** SELECT_BLOCK **/
@property(nonatomic,copy)SELECT_BLOCK select_block;

-(instancetype)initWithDataSource:(NSArray *)dataArray detailSource:(NSArray *)detailArray;
@end
