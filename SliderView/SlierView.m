//
//  SlierView.m
//  TEXT
//
//  Created by zzg on 2018/4/18.
//  Copyright © 2018年. All rights reserved.
//

#import "SlierView.h"

@interface SlierView () {
    UISlider *slider_;
}
@property (nonatomic, strong) UILabel   *lb;
@end
@implementation SlierView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setSlierView];
    }
    return self;
}

- (void)setSlierView {
    slider_ = [[UISlider alloc] initWithFrame:self.bounds];
    [self addSubview:slider_];
    slider_.continuous = YES;
    [slider_ addTarget:self action:@selector(sliderChangeWithValue:) forControlEvents:UIControlEventValueChanged];
}

- (void)setMaxValue:(CGFloat)maxValue {
    _maxValue = maxValue;
    slider_.maximumValue = _maxValue;
}

- (void)setMinValue:(CGFloat)minValue {
    _minValue = minValue;
    slider_.minimumValue = _minValue;
}

- (void)sliderChangeWithValue:(UISlider *)slider {
    [self setFontLabelViewWithContent:[NSString stringWithFormat:@"%.2f",slider.value]];
    if (self.delegate && [self.delegate respondsToSelector:@selector(setSliderActionChangeValue:)]) {
        [self.delegate setSliderActionChangeValue:slider];
    }
}

- (void)setFontLabelViewWithContent:(NSString  *)str {
    self.lb.text = str;
}

- (UILabel *)lb {
    if (!_lb) {
        _lb = [[UILabel alloc] init];
        _lb.frame = CGRectMake(self.frame.origin.x + self.frame.size.width - 80, - 30, 80, 30);
        _lb.textColor = [UIColor blackColor];
        _lb.font = [UIFont systemFontOfSize:15];
        [self addSubview:_lb];
        [self bringSubviewToFront:_lb];
    }
    return _lb;
}

- (void)setCurrentValue:(CGFloat)currentValue {
    [slider_ setValue:currentValue animated:YES];
    self.lb.text = [NSString stringWithFormat:@"%.2f",currentValue];
}

@end
