//
//  DemoViewController.h
//  LayerDemo
//
//  Created by kingdee on 2019/4/3.
//  Copyright © 2019 kingdee. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>
#import "DemoView.h"
NS_ASSUME_NONNULL_BEGIN

@interface DemoViewController : NSViewController
@property(nonatomic,strong)DemoView * DrawView;
@property(nonatomic,strong)CALayer * imageLabyer;
@property(nonatomic,strong)CAShapeLayer * shapeLayer;
@property(nonatomic,strong)CAShapeLayer * DrawLayer;
@property (nonatomic,assign)CGMutablePathRef path;
@end

NS_ASSUME_NONNULL_END
