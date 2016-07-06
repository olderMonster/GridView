//
//  GridCell.h
//  GridViewDemo
//
//  Created by kehwa on 16/7/5.
//  Copyright © 2016年 kehwa. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol GridCellDelegate <NSObject>

- (void)translateItems:(NSInteger)section rows:(NSInteger)row;

@end
@interface GridCell : UITableViewCell
@property (nonatomic , weak)id<GridCellDelegate>delegate;
- (void)setRows:(NSIndexPath *)indexPath withSource:(NSArray *)dataSource;

@end
