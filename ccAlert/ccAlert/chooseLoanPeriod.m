//
//  chooseLoanPeriod.m
//  SBSCard
//
//  Created by 陈诚 on 16/4/28.
//  Copyright © 2016年 CC. All rights reserved.
//

#import "chooseLoanPeriod.h"



#define KMaxValue 4


@implementation chooseLoanPeriod

- (instancetype)initTitles:(NSArray *)titles andWithframe:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        
        _getframe = frame;
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, CGRectGetWidth(frame) - 20, CGRectGetHeight(frame)/5)];
        title.text = @"选择借款周期";
        [self addSubview:title];
       
        CGFloat titleWidth = (CGRectGetWidth(frame) - 20)/(titles.count + 1);
        for (int i = 0; i < titles.count; i++) {
            UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10 + (titleWidth + titleWidth/3)*i,CGRectGetMaxY(title.frame) + 10,titleWidth, CGRectGetHeight(frame)/5)];
            titleLabel.text = titles[i];
            titleLabel.font = [UIFont systemFontOfSize:15];
            titleLabel.tag = 123;
            if (i == 1) {
                titleLabel.textAlignment = NSTextAlignmentLeft;
            }
            if (i == 2) {
                titleLabel.textAlignment = NSTextAlignmentCenter;
            }
            if (i == 3) {
                titleLabel.textAlignment = NSTextAlignmentRight;
            }
            [self addSubview:titleLabel];
        }

        
        [self creatSliderWithFrame:frame];
        
    }
    
    
    
    
    return self;
}



- (void)creatSliderWithFrame:(CGRect)viewFame{
    
    UILabel *labTag = (UILabel *)[self viewWithTag:123];
    //滑块设置
    _slider = [[UISlider alloc] initWithFrame:CGRectMake(10,CGRectGetMaxY(labTag.frame) + 15, CGRectGetWidth(viewFame) - 20, 20)];
    _slider.minimumValue = 1;
    _slider.maximumValue = KMaxValue;
    _slider.minimumTrackTintColor = [UIColor clearColor];
    _slider.maximumTrackTintColor = [UIColor clearColor];
    [_slider setThumbImage:[UIImage imageNamed:@"round"] forState:UIControlStateNormal];
    
    
    //背景图
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15,CGRectGetMaxY(labTag.frame)+15, CGRectGetWidth(viewFame) - 35, 20)];
    UIImage *img = [UIImage imageNamed:@"measure@2x"];
    imageView.image = img;
    
    //添加点击手势和滑块滑动事件响应
    [_slider addTarget:self action:@selector(valueChanged:)forControlEvents:UIControlEventValueChanged];
    UITapGestureRecognizer *tap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    
    [_slider addGestureRecognizer:tap];
    [self addSubview:imageView];
    
    [self addSubview:_slider];
    
}


- (void)valueChanged:(UISlider *)sender
{
    //只取整数值，固定间距
    NSString *tempStr = [self numberFormat:sender.value];
    [sender setValue:tempStr.floatValue];
    
    
    NSLog(@"%0.2f",sender.value);

    
    self.selectBlock(sender.value);
}

- (void)tapAction:(UITapGestureRecognizer *)sender
{
    //取得点击点
    CGPoint p = [sender locationInView:_slider];
    //计算处于背景图的几分之几，并将之转换为滑块的值（1~7）
    
    
    float tempFloat = (p.x - 15) / (CGRectGetWidth(_getframe)) * KMaxValue + 1;
    NSString *tempStr = [self numberFormat:tempFloat];
    //    NSLog(@"%f,%f,%@", p.x, tempFloat, tempStr);
    [_slider setValue:tempStr.floatValue];
    
    

    [self valueChanged:_slider];
    
}

/**
 *  四舍五入
 *
 *  @param num 待转换数字
 *
 *  @return 转换后的数字
 */
- (NSString *)numberFormat:(float)num
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setPositiveFormat:@"0"];
    return [formatter stringFromNumber:[NSNumber numberWithFloat:num]];
}


@end
