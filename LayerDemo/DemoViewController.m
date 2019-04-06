//
//  DemoViewController.m
//  LayerDemo
//
//  Created by kingdee on 2019/4/3.
//  Copyright © 2019 kingdee. All rights reserved.
//

#import "DemoViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addTrackingRect:self.view.bounds
                    owner:self
                 userData:nil
             assumeInside:YES];
    
    NSImage * img1 = [NSImage imageNamed:@"1.png"];
//    NSImage * img2 = [NSImage imageNamed:@"2.png"];
    
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)img1.TIFFRepresentation, nil);
    CGImageRef inImage = CGImageSourceCreateImageAtIndex(source, 0, nil);
    CIImage *ciImage  = [[CIImage alloc] initWithCGImage:inImage];
    CIFilter *filter  = [CIFilter filterWithName:@"CIPixellate"];
    [filter setDefaults];
    [filter setValue:ciImage forKey:kCIInputImageKey];
    [filter setValue:@(6.f) forKey:kCIInputScaleKey];
    CIImage * outPutImg = [filter outputImage];
    
    NSCIImageRep * rep = [NSCIImageRep imageRepWithCIImage:outPutImg];
    NSImage *img2 = [[NSImage alloc] initWithSize:[outPutImg extent].size];
    [img2 addRepresentation:rep];
    // Do view setup here.
    
    self.view.wantsLayer = YES;
    
    //添加layer（imageLayer）到self上
    self.imageLabyer = [CALayer layer];
    self.imageLabyer.frame = self.view.bounds;
    [self.view.layer addSublayer:self.imageLabyer];
    
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.frame = self.view.bounds;
    self.shapeLayer.lineCap = kCALineCapRound;
    self.shapeLayer.lineJoin = kCALineJoinRound;
    self.shapeLayer.lineWidth = 40.0f;
    self.shapeLayer.strokeColor = [[NSColor blueColor] CGColor];
    self.shapeLayer.fillColor = nil;
    [self.view.layer addSublayer:self.shapeLayer];
    
    self.imageLabyer.mask = self.shapeLayer;
    
    self.path = CGPathCreateMutable();
    self.imageLabyer.contents = img2;
    
    self.view.layer.contents = img1;
    
    self.DrawView = [[DemoView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.DrawView];
//    self.surfaceIamgeView.image = img1;
    
}
- (void)awakeFromNib {
    // Do view setup here.
    [super awakeFromNib];
    NSLog(@"awakeFromNib");
}

- (void)mouseDown:(NSEvent *)event
{
    CGPoint pt = event.locationInWindow;
    CGPathMoveToPoint(self.path, NULL, pt.x, pt.y);
    CGMutablePathRef path = CGPathCreateMutableCopy(self.path);
    self.shapeLayer.path = path;
    CGPathRelease(path);
    NSLog(@"mouseDown");
}

-(void)mouseUp:(NSEvent *)event
{
     NSLog(@"mouseUp");
}
-(void)mouseDragged:(NSEvent *)event
{
    CGPoint pt = event.locationInWindow;
    CGPathAddLineToPoint(self.path, NULL,pt.x, pt.y);
    CGMutablePathRef path = CGPathCreateMutableCopy(self.path);
    self.shapeLayer.path = path;
    CGPathRelease(path);
    NSLog(@"mouseDragged");
}
@end
