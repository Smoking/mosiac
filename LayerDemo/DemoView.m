//
//  DemoView.m
//  LayerDemo
//
//  Created by kingdee on 2019/4/5.
//  Copyright © 2019 kingdee. All rights reserved.
//

#import "DemoView.h"

@implementation DemoView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSBezierPath * path = [NSBezierPath bezierPath];
    [[NSColor redColor] set];
    [path setLineWidth:10];
    [path appendBezierPathWithRect:NSMakeRect(100, 100, 100, 100)];
    [path stroke];
    [path closePath];
    path = nil;
    // Drawing code here.
}

@end
