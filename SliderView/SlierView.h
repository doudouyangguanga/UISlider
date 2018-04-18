//
//  SlierView.h
//  TEXT
//
//  Created by zzg on 2018/4/18.
//  Copyright © 2018年  All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SliderActionWithChangeValueDelegate <NSObject>
- (void)setSliderActionChangeValue:(UISlider *)slier;
@end
@interface SlierView : UIView
@property (nonatomic, assign)CGFloat    maxValue;   //最大值

@property (nonatomic, assign) CGFloat   minValue;   //最小值

@property (nonatomic, assign) CGFloat   currentValue;   //设置当前值

@property (nonatomic, weak) id <SliderActionWithChangeValueDelegate> delegate;

@end
