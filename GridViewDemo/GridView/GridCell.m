//
//  GridCell.m
//  GridViewDemo
//
//  Created by kehwa on 16/7/5.
//  Copyright © 2016年 kehwa. All rights reserved.
//

#import "GridCell.h"




@interface GridCell()



@end


@implementation GridCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
    }
    return self;
}

- (void)setRows:(NSIndexPath *)indexPath withSource:(NSArray *)dataSource{
    
    for (UIView *subView in self.contentView.subviews) {
        [subView removeFromSuperview];
    }
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width / 3;
    CGFloat height = 44;
    
    for (int index = 0 ; index < 3; index++) {
        
        NSInteger i = indexPath.row * 3 + index;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor whiteColor];
        button.tag = indexPath.section * 1000 + indexPath.row * 3 + index;
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:button];
    
        if (i < dataSource.count) {
            button.frame = CGRectMake(index * width, 0, width, height);
            [button setTitle:dataSource[i][@"name"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(AddOrDelBtn:) forControlEvents:UIControlEventTouchUpInside];
        }else{
            button.hidden = YES;
        }
        
    }
    
}

- (void)AddOrDelBtn:(UIButton *)button{
    
//    if (button.tag >=1000) {
//        
//        if (self.delegate && [self.delegate respondsToSelector:@selector(translateItems:rows:)]) {
//            [self.delegate translateItems:button.tag / 1000 rows:button.tag - (button.tag / 1000) * 1000];
//        }
//        
//    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(translateItems:rows:)]) {
        [self.delegate translateItems:button.tag / 1000 rows:button.tag - (button.tag / 1000) * 1000];
    }
    
}


@end
