//
//  chooseLoanPeriod.h
//  SBSCard
//
//  Created by 陈诚 on 16/4/28.
//  Copyright © 2016年 CC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface chooseLoanPeriod : UIView


@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, assign) CGRect getframe;


- (instancetype)initTitles:(NSArray *)titles andWithframe:(CGRect)frame;

@property (nonatomic,copy)void(^selectBlock)(NSInteger selectIndex);


@end
