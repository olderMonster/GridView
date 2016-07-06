//
//  GridView.m
//  GridViewDemo
//
//  Created by kehwa on 16/7/4.
//  Copyright © 2016年 kehwa. All rights reserved.
//

#import "GridView.h"
#import "GridCell.h"
@interface GridView()<UITableViewDataSource , UITableViewDelegate , GridCellDelegate>

@property (nonatomic , strong)UITableView *gridTableView;

@property (nonatomic , strong)NSMutableArray *channelTable;

@end


@implementation GridView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.gridTableView];
        
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    self.gridTableView.frame = self.bounds;
}


#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.channelTable.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return ([self.channelTable[section][@"items"] count] + 2) / 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    GridCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[GridCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.delegate = self;
    }
    [cell setRows:indexPath withSource:self.channelTable[indexPath.section][@"items"]];
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.channelTable[section][@"title"];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

#pragma mark - GridCellDelegate
- (void)translateItems:(NSInteger)section rows:(NSInteger)row{
    
    if (section > 0) {
        
        NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:self.channelTable[section]];
        NSMutableArray *mArray = [NSMutableArray arrayWithArray:mDict[@"items"]];
        NSDictionary *dict = mArray[row];
        [mArray removeObjectAtIndex:row];
        [mDict setObject:mArray forKey:@"items"];
        
        NSMutableDictionary *mDict0 = [NSMutableDictionary dictionaryWithDictionary:self.channelTable[0]];
        NSMutableArray *mArray0 = [NSMutableArray arrayWithArray:self.channelTable[0][@"items"]];
        [mArray0 addObject:dict];
        [mDict0 setObject:mArray0 forKey:@"items"];
        
        NSArray *tmp = @[mDict0,mDict];
        
        self.channelTable = [NSMutableArray arrayWithArray:tmp];
        [self.gridTableView reloadData];
    }else{
        
        NSMutableDictionary *mDict0 = [NSMutableDictionary dictionaryWithDictionary:self.channelTable[section]];
        NSMutableArray *mArray0 = [NSMutableArray arrayWithArray:mDict0[@"items"]];
        NSDictionary *dict = mArray0[row];
        [mArray0 removeObjectAtIndex:row];
        [mDict0 setObject:mArray0 forKey:@"items"];
        
        NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:self.channelTable[1]];
        NSMutableArray *mArray = [NSMutableArray arrayWithArray:self.channelTable[1][@"items"]];
        [mArray addObject:dict];
        [mDict setObject:mArray forKey:@"items"];
        
        NSArray *tmp = @[mDict0,mDict];
        
        self.channelTable = [NSMutableArray arrayWithArray:tmp];
        [self.gridTableView reloadData];
        
    }
    
}


#pragma mark -- getters and setters
- (UITableView *)gridTableView{
    if (_gridTableView == nil) {
        _gridTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _gridTableView.backgroundColor = [UIColor whiteColor];
        _gridTableView.dataSource = self;
        _gridTableView.delegate = self;
        _gridTableView.tableFooterView = [[UIView alloc]init];
//        _gridTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _gridTableView;
}

- (NSMutableArray *)channelTable{
    if (_channelTable == nil) {
        _channelTable = [NSMutableArray arrayWithArray:@[@{@"title":@"我的频道",@"items":@[@{@"id":@"1",@"name":@"lol"},
                                                                                       @{@"id":@"1",@"name":@"dota"}]},
                                                         @{@"title":@"全部频道",@"items":@[@{@"id":@"1",@"name":@"lol"},
                                                                                       @{@"id":@"1",@"name":@"dota"},
                                                                                       @{@"id":@"1",@"name":@"123"},
                                                                                       @{@"id":@"1",@"name":@"44"},
                                                                                       @{@"id":@"1",@"name":@"55"},
                                                                                       @{@"id":@"1",@"name":@"666"},
                                                                                       @{@"id":@"1",@"name":@"777"}]}]];
    }
    return _channelTable;
}


@end
