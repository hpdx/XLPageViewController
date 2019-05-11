//
//  OtherAppExampleListVC.m
//  XLPageViewControllerExample
//
//  Created by MengXianLiang on 2019/5/10.
//  Copyright © 2019 jwzt. All rights reserved.
//

#import "OtherAppExampleListVC.h"
#import "BasicFounctionExampleVC.h"

@interface OtherAppExampleListVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation OtherAppExampleListVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //设置导航栏样式
    [self configNavigationBarOfIndex:-1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildTable];
}

- (void)buildTable {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.tableView];
}

#pragma mark -
#pragma mark TableViewDelegate&DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self cellTitles].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [self cellTitles][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[self cellImageNames][indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BasicFounctionExampleVC *exampleVC = [[BasicFounctionExampleVC alloc] init];
    exampleVC.title = [self cellTitles][indexPath.row];
    exampleVC.config = [self configOfIndexPath:indexPath];
    exampleVC.titles = [self vcTitlesOfIndexPath:indexPath];
    [self.navigationController pushViewController:exampleVC animated:true];
    [self configNavigationBarOfIndex:indexPath.row];
}




- (NSArray *)cellTitles {
    return @[
             @"今日头条",
             @"腾讯新闻",
             @"澎湃新闻",
             @"爱奇艺",
             @"优酷",
             @"腾讯视频",
             ];
}

- (NSArray *)cellImageNames {
    return @[
             @"icon_jrtt",
             @"icon_txxw",
             @"icon_ppxw",
             @"icon_iqyi",
             @"icon_yk",
             @"icon_txsp"
             ];
}

- (XLPageViewControllerConfig *)configOfIndexPath:(NSIndexPath *)indexPath {
    XLPageViewControllerConfig *config = [XLPageViewControllerConfig defaultConfig];
    switch (indexPath.row) {
        case 0://今日头条
            //标题间距
            config.titleSpace = 15;
            //标题缩进
            config.titleViewInsets = UIEdgeInsetsMake(0, 10, 0, 10);
            //标题选中颜色
            config.titleSelectedColor = [self colorOfR:211 G:60 B:61];
            //标题选中字体
            config.titleSelectedFont = [UIFont systemFontOfSize:18];
            //标题正常颜色
            config.titleNormalColor = [self colorOfR:34 G:34 B:34];
            //标题正常字体
            config.titleNormalFont = [UIFont systemFontOfSize:17];
            //隐藏动画线条
            config.hideShadowLine = true;
            //分割线颜色
            config.separatorLineColor = [self colorOfR:231 G:231 B:231];
            break;
        case 1://腾讯新闻
            //标题间距
            config.titleSpace = 15;
            //标题高度
            config.titleViewHeight = 45;
            //标题缩进
            config.titleViewInsets = UIEdgeInsetsMake(0, 10, 0, 10);
            //标题选中颜色
            config.titleSelectedColor = [self colorOfR:34 G:34 B:34];
            //标题选中字体
            config.titleSelectedFont = [UIFont boldSystemFontOfSize:17];
            //标题正常颜色
            config.titleNormalColor = [self colorOfR:142 G:153 B:160];
            //标题正常字体
            config.titleNormalFont = [UIFont systemFontOfSize:17];
            //阴影颜色
            config.shadowLineColor = [self colorOfR:19 G:121 B:214];
            //阴影宽度
            config.shadowLineWidth = 22;
            //分割线颜色
            config.separatorLineColor = [self colorOfR:238 G:238 B:238];
            break;
        case 2://澎湃新闻
            //标题间距
            config.titleSpace = 15;
            //标题高度
            config.titleViewHeight = 44;
            //在NavigationBar上显示
            config.showTitleInNavigationBar = true;
            //标题缩进
            config.titleViewInsets = UIEdgeInsetsMake(0, 10, 0, 10);
            //标题选中颜色
            config.titleSelectedColor = [self colorOfR:1 G:165 B:235];
            //标题选中字体
            config.titleSelectedFont = [UIFont systemFontOfSize:17];
            //标题正常颜色
            config.titleNormalColor = [self colorOfR:51 G:51 B:51];
            //标题正常字体
            config.titleNormalFont = [UIFont systemFontOfSize:17];
            //阴影颜色
            config.shadowLineColor = [self colorOfR:1 G:165 B:235];
            //阴影宽度
            config.shadowLineWidth = 22;
            //阴影末端是方形
            config.shadowLineCap = XLshadowLineCapSquare;
            //分割线颜色
            config.hideSeparatorLine = true;
            break;
        case 3://爱奇艺
            //标题间距
            config.titleSpace = 15;
            //在NavigationBar上显示
            config.showTitleInNavigationBar = true;
            //标题缩进
            config.titleViewInsets = UIEdgeInsetsMake(0, 10, 0, 10);
            //标题选中颜色
            config.titleSelectedColor = [self colorOfR:10 G:190 B:6];
            //标题选中字体
            config.titleSelectedFont = [UIFont systemFontOfSize:18];
            //标题正常颜色
            config.titleNormalColor = [UIColor whiteColor];
            //标题正常字体
            config.titleNormalFont = [UIFont systemFontOfSize:18];
            //阴影颜色
            config.shadowLineColor = [self colorOfR:10 G:190 B:6];
            //阴影宽度
            config.shadowLineWidth = 22;
            //分割线颜色
            config.hideSeparatorLine = true;
            break;
        case 4:
            //标题缩进
            config.titleViewInsets = UIEdgeInsetsMake(0, 10, 0, 10);
            //标题左对齐
            config.titleViewAlignment = XLPageTitleViewAlignmentLeft;
            break;
        case 5:
            //标题缩进
            config.titleViewInsets = UIEdgeInsetsMake(0, 10, 0, 10);
            //标题居中显示
            config.titleViewAlignment = XLPageTitleViewAlignmentCenter;
            break;
        case 6:
            //标题缩进
            config.titleViewInsets = UIEdgeInsetsMake(0, 10, 0, 10);
            //标题右对齐
            config.titleViewAlignment = XLPageTitleViewAlignmentRight;
            break;
        case 7:
            //设置标题宽度为屏幕宽度1/3
            config.titleWidth = self.view.bounds.size.width/3.0f;
            //设置标题间隔为0
            config.titleSpace = 0;
            break;
        default:
            break;
    }
    return config;
}

- (NSArray *)vcTitlesOfIndexPath:(NSIndexPath *)indexPath {
    NSArray *titleArr = @[@"关注",@"推荐",@"热点",@"问答",@"科技",@"国风",@"直播",@"新时代",@"北京",@"国际",@"数码",@"小说",@"军事"];
    return titleArr;
}

#pragma mark -
#pragma mark 辅助方法

- (UIColor *)colorOfR:(NSInteger)R G:(NSInteger)G B:(NSInteger)B {
    return [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    static NSCache *imageCache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imageCache = [[NSCache alloc] init];
    });
    UIImage *image = [imageCache objectForKey:color];
    if (image) {
        return image;
    }
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [imageCache setObject:image forKey:color];
    return image;
}

- (void)configNavigationBarOfIndex:(NSInteger)index {
    UIColor *tintColor = [UIColor blackColor];
    UIColor *titleColor = [UIColor blackColor];
    UIColor *backGroundColor = [UIColor whiteColor];
    UIImage *shadowImage = nil;
    switch (index) {
        case 0://今日头条
            tintColor = [UIColor whiteColor];
            titleColor = [UIColor whiteColor];
            backGroundColor = [self colorOfR:211 G:60 B:61];
            break;
        case 1://腾讯新闻
            backGroundColor = [UIColor whiteColor];
            break;
        case 2://澎湃新闻
            backGroundColor = [UIColor whiteColor];
            shadowImage = [[UIImage alloc] init];
            break;
        case 3://爱奇艺
            tintColor = [UIColor whiteColor];
            titleColor = [UIColor whiteColor];
            backGroundColor = [self colorOfR:48 G:48 B:50];
            break;
        case 4://优酷
            backGroundColor = [self colorOfR:211 G:60 B:61];
            break;
        case 5://腾讯
            backGroundColor = [self colorOfR:211 G:60 B:61];
            break;
            
        default:
            break;
    }
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:backGroundColor] forBarMetrics:UIBarMetricsDefault];
    NSDictionary *attributes = @{NSForegroundColorAttributeName:titleColor};
    self.navigationController.navigationBar.tintColor = tintColor;
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    self.navigationController.navigationBar.shadowImage = shadowImage;
}

@end