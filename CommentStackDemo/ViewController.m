//
//  ViewController.m
//  CommentStackDemo
//
//  Created by libohao on 16/3/28.
//  Copyright © 2016年 libohao. All rights reserved.
//

#import "ViewController.h"
#import "StackTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
    self.edgesForExtendedLayout = UIRectEdgeTop;
    //self.automaticallyAdjustsScrollViewInsets = YES;
    
    [self.view addSubview:self.tableView];
    
    [self loadDataSource];
}

- (void)loadDataSource {
    _dataSource = [NSMutableArray new];
    NSArray* temp1 = @[@"什么烂新闻，和肥皂有关系吗？网易还有没有底线？",
                    @"发了好像食物进口英文字的肥皂结果你不懂别乱喷小便",
                    @"清远马拉松，组织方把一块包装很像食品的肥皂放在补给中，结果许多参赛者都咬了一口……",
                    @"我这人好像特别背，有一次去宁波市的杭州湾新区办点事，结果那天办马拉松，到处禁行，整整一个上午绕着赛点开了四个小时的车还是没能把车子开到办事点去。3月19日去无锡中央公园，上了快速高架路之后再也下不来了。因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                    @"我这人好像特别背，有一次去宁波市的杭州湾新区办点事，结果那天办马拉松，到处禁行，整整一个上午绕着赛点开了四个小时的车还是没能把车子开到办事点去。3月19日去无锡中央公园，上了快速高架路之后再也下不来了。因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                    @"我这人好像特别背，有一次去宁波市的杭州湾新区办点事，结果那天办马拉松，到处禁行，整整一个上午绕着赛点开了四个小时的车还是没能把车子开到办事点去。3月19日去无锡中央公园，上了快速高架路之后再也下不来了。因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                    @"地球不是你一个人住，其他人的活动必然会影响另一些人，反过来想想，你自己的活动也会影响他人。心胸不要这么狭隘，多理解宽容一点。",
                    @"老百姓生活在水生火热之中？",
                    @"这边大火，那边射水，真的是水深火热啊",
                    @"我这人好像特别背，有一次去宁波市的杭州湾新区办点事，结果那天办马拉松，到处禁行，整整一个上午绕着赛点开了四个小时的车还是没能把车子开到办事点去。3月19日去无锡中央公园，上了快速高架路之后再也下不来了。因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                      ];
    
    NSArray* temp2 = @[@"什么烂新闻，和肥皂有关系吗？网易还有没有底线？",
                       @"我这人好像特别背，有一次去宁波市的杭州湾新区办点事，结果那天办马拉松，到处禁行，整整一个上午绕着赛点开了四个小时的车还是没能把车子开到办事点去。3月19日去无锡中央公园，上了快速高架路之后再也下不来了。因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                       @"发了好像食物进口英文字的肥皂结果你不懂别乱喷小便",
                       @"清远马拉松，组织方把一块包装很像食品的肥皂放在补给中，结果许多参赛者都咬了一口……",
                       @"我这人好像特别背，有一次去宁波市的杭州湾新区办点事，结果那天办马拉松，到处禁行，整整一个上午绕着赛点开了四个小时的车还是没能把车子开到办事点去。3月19日去无锡中央公园，上了快速高架路之后再也下不来了。因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                       ];
    
    NSArray* temp3 = @[
                       @"我这人好像特别背，有一次去宁波市的杭州湾新区办点事，结果那天办马拉松，到处禁行，整整一个上午绕着赛点开了四个小时的车还是没能把车子开到办事点去。3月19日去无锡中央公园，上了快速高架路之后再也下不来了。因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                       @"我这人好像特别背，有一次去宁波市的杭州湾新区办点事，结果那天办马拉松，到处禁行，整整一个上午绕着赛点开了四个小时的车还是没能把车子开到办事点去。3月19日去无锡中央公园，上了快速高架路之后再也下不来了。因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                       @"发了好像食物进口英文字的肥皂结果你不懂别乱喷小便",
                       @"清远马拉松，组织方把一块包装很像食品的肥皂放在补给中，结果许多参赛者都咬了一口……",
                       
                       @"什么烂新闻，和肥皂有关系吗？网易还有没有底线？",
                       ];
    NSArray* temp4 = @[
                       @"我这人好像特别背，有一次去宁波市因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                       @"我这人好像特别背，有一次去宁下不来了。因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                       @"发了好像食物进口英文字的肥皂结果你不懂别乱喷小便",
                       @"清远马拉松，组织方把一块包装很像食品的肥皂放在补给中，结果许多参赛者都咬了一口……",
                       @"什么烂新闻，和肥皂有关系？",
                       @"清远马拉松，组织方把一块包装很像食品的肥皂放在补给中，结果许多参赛者都咬了一口……",
                       ];
    NSArray* temp5 = @[
                       @"我这人好像特别背，有一次去宁下不来了。因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                       @"发了好像食物进口英文字的肥皂结果你不懂别乱喷小便",
                       @"清远马拉松，组织方把一块包装很像食品的肥皂放在补给中，结果许多参赛者都咬了一口……",
                       @"什么烂新闻，和肥皂有关系？",
                       @"清远马拉松，组织方把一块包装很像食品的肥皂放在补给中，结果许多参赛者都咬了一口……",
                       @"我这人好像特别背，有一次去宁波市因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                       @"我这人好像特别背，有一次去宁下不来了。因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                       @"发了好像食物进口英文字的肥皂结果你不懂别乱喷小便",
                       @"清远马拉松，组织方把一块包装很像食品的肥皂放在补给中，结果许多参赛者都咬了一口……",
                       @"什么烂新闻，和肥皂有关系？",
                       @"清远马拉松，组织方把一块包装很像食品的肥皂放在补给中，结果许多参赛者都咬了一口……",
                       ];
    NSArray* temp6 = @[
                       @"我这人好像特别背，有一次去宁下不来了。因为又在办马拉松，城区的快速路出口堵满了汽车。附近的道路也塞得一动不动我想说的是，你要办比赛可以，可是干嘛非要影响市民的正常出行？",
                       ];
    
    [self.dataSource addObject:[temp1 mutableCopy]];
    [self.dataSource addObject:[temp2 mutableCopy]];
    [self.dataSource addObject:[temp3 mutableCopy]];
    [self.dataSource addObject:[temp4 mutableCopy]];
    [self.dataSource addObject:[temp5 mutableCopy]];
    [self.dataSource addObject:[temp6 mutableCopy]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[StackTableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);

    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StackTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    NSArray* array = [self.dataSource objectAtIndex:indexPath.row];
    [cell setupCellWith:array];

    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray* array = [self.dataSource objectAtIndex:indexPath.row];
    return [StackTableViewCell heightForCellWith:array];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
