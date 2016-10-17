//
//  UIView+viewCorenRadius.m
//  cornerRadius
//
//  Created by 刘森 on 16/8/22.
//  Copyright © 2016年 ls. All rights reserved.
//

#import "UIView+viewCorenRadius.h"

@implementation UIView (viewCorenRadius)
- (UIImage *)circleImage:(UIColor*)color{
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    /*
    //从右上角开始,这里默认 长>20,高<20
    CGContextMoveToPoint(context, self.frame.size.width-10,0);
    CGContextAddArcToPoint(context, self.frame.size.width, 0, self.frame.size.width, self.frame.size.height-10, 10);
    //右下角
    CGContextAddArcToPoint(context, self.frame.size.width, self.frame.size.height, self.frame.size.width-10, self.frame.size.height, 10);
    //左下角
    CGContextAddArcToPoint(context, 0, self.frame.size.height, 0, self.frame.size.height-10, 10);
    //左上角
    CGContextAddArcToPoint(context, 0, 0, self.frame.size.width-10, 0, 10);
    
    //填充颜色
//    CGContextSetStrokeColorWithColor(context, color.CGColor);
//    CGContextSetFillColorWithColor(context, color.CGColor);
    
    //同上面两个函数, 第一个设置描边颜色,第二个设置填充颜色
    [color setStroke];
    [color setFill];
     */
    
    
    //用贝塞尔曲线画圆角
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    CGContextAddPath(context, [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)].CGPath);
    [color setStroke];
    [color setFill];
    
    //根据坐标画图
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //获取图片
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndPDFContext();
    return newImage;
    
}
- (void)addRadiusView:(UIColor*)color{
    UIImageView* iv = [[UIImageView alloc] initWithImage:[self circleImage:color]];
    
    [self addSubview:iv];
}
@end
