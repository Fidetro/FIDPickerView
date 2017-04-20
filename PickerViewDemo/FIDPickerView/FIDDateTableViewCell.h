//
//  FIDDateTableViewCell.h
//  PickerViewDemo
//
//  Created by Fidetro on 2017/4/20.
//  Copyright © 2017年 Fidetro. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const kFIDDateTableViewCellIdentifier;
typedef void(^SELECTDATE_BLOCK)(NSDate *date);
@protocol FIDDateTableViewCellDelegate <NSObject>



- (void)selectdatePickerCell:(UITableViewCell *)cell selectDate:(NSDate *)date;


@end
@interface FIDDateTableViewCell : UITableViewCell

/** 选择的内容 **/
@property(nonatomic,strong,readonly)NSArray *selectArray;

@property (nonatomic,strong) UIDatePicker *datePicker;
/** delegate **/
@property(nonatomic,weak)id<FIDDateTableViewCellDelegate> delegate;
/** SELECT_BLOCK **/
@property(nonatomic,copy)SELECTDATE_BLOCK select_block;
@end
