# UISlider
private slider


使用方式简单

    slview = [[SlierView alloc] initWithFrame:CGRectMake(10, 100, 300, 20)];
    [self.view addSubview:slview];
    slview.maxValue = 100;
    slview.minValue = 0;
    slview.delegate = self;
    slview.currentValue = 30;
    
    
