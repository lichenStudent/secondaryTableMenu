//
//  ViewController.h
//  TwotableView
//
//  Created by lichen on 16/5/28.
//  Copyright (c) 2016年 lichen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TQMultistageTableView.h"
@interface ViewController : UIViewController<TQTableViewDataSource,TQTableViewDelegate>

@property (nonatomic, strong) TQMultistageTableView *mTableView;


@end

