//
//  ViewController.m
//  TwotableView
//
//  Created by lichen on 16/5/28.
//  Copyright (c) 2016年 lichen. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@property(strong,nonatomic)NSArray *arr;
@property(strong,nonatomic)NSArray *arr1;
@property(strong,nonatomic)NSArray *arr2;
@property(strong,nonatomic)NSArray *arr3;
@property(strong,nonatomic)NSArray *arr4;
@property(strong,nonatomic)NSArray *arr5;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _arr1 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    _arr2 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    _arr3 = [NSArray arrayWithObjects:@"三",@"2",@"3", nil];
    _arr4 = [NSArray arrayWithObjects:@"1",@"人才",@"3", nil];
    _arr5 = [NSArray arrayWithObjects:@"1",@"人才",@"人才", nil];
    _arr  = [NSArray arrayWithObjects:_arr1,_arr2,_arr3,_arr4,_arr5, nil];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.mTableView = [[TQMultistageTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.mTableView.dataSource = self;
    self.mTableView.delegate   = self;
    self.mTableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.mTableView];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - TQTableViewDataSource

- (NSInteger)mTableView:(TQMultistageTableView *)mTableView numberOfRowsInSection:(NSInteger)section
{
    return [_arr[section] count];
}

- (UITableViewCell *)mTableView:(TQMultistageTableView *)mTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"TQMultistageTableViewCell";
    UITableViewCell *cell = [mTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    NSArray *array = _arr[indexPath.section];
    
    
    cell.textLabel.text = [array objectAtIndex:indexPath.row];
    UIView *view = [[UIView alloc] initWithFrame:cell.bounds] ;
    view.layer.backgroundColor  = [UIColor colorWithRed:246/255.0 green:213/255.0 blue:105/255.0 alpha:1].CGColor;
    
    view.layer.masksToBounds    = YES;
    view.layer.borderWidth      = 0.5;
    view.layer.borderColor      = [UIColor colorWithRed:250/255.0 green:77/255.0 blue:83/255.0 alpha:1].CGColor;
    
    cell.backgroundView = view;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(TQMultistageTableView *)mTableView
{
    return 5;
}

#pragma mark - Table view delegate

- (CGFloat)mTableView:(TQMultistageTableView *)mTableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (CGFloat)mTableView:(TQMultistageTableView *)mTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)mTableView:(TQMultistageTableView *)mTableView heightForAtomAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UIView *)mTableView:(TQMultistageTableView *)mTableView viewForHeaderInSection:(NSInteger)section;
{
    
    NSArray *array=[NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    UIView *header = [[UIView alloc] init];
    
    UILabel *mylable=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100, 44)];
    
    mylable.text=[array objectAtIndex:section];
    
    [header addSubview:mylable];
    
    header.layer.backgroundColor    = [UIColor colorWithRed:218/255.0 green:249/255.0 blue:255/255.0 alpha:1].CGColor;
    header.layer.masksToBounds      = YES;
    header.layer.borderWidth        = 0.5;
    header.layer.borderColor        = [UIColor colorWithRed:179/255.0 green:143/255.0 blue:195/255.0 alpha:1].CGColor;
    return header;
}

- (void)mTableView:(TQMultistageTableView *)mTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRow ----%ld",(long)indexPath.row);
}

#pragma mark - Header Open Or Close

- (void)mTableView:(TQMultistageTableView *)mTableView willOpenHeaderAtSection:(NSInteger)section
{
    NSLog(@"Open Header ----%ld",(long)section);
}

- (void)mTableView:(TQMultistageTableView *)mTableView willCloseHeaderAtSection:(NSInteger)section
{
    NSLog(@"Close Header ---%ld",(long)section);
}

#pragma mark - Row Open Or Close

- (void)mTableView:(TQMultistageTableView *)mTableView willOpenRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Open Row ----%ld",(long)indexPath.row);
}

- (void)mTableView:(TQMultistageTableView *)mTableView willCloseRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Close Row ----%ld",(long)indexPath.row);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
