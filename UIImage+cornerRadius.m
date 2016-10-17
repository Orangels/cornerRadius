//
//  UIImage+cornerRadius.m
//  cornerRadius
//
//  Created by 刘森 on 16/8/22.
//  Copyright © 2016年 ls. All rights reserved.
//

#import "UIImage+cornerRadius.h"

@implementation UIImage (cornerRadius)
- (UIImage *)circleImage{
    //开始图形上下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [UIScreen mainScreen].scale);
    //获得图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置范围
    
    // 画圆(包括椭圆)
    //CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    //创建椭圆
    //CGContextAddEllipseInRect(context, rect);
    
    //用贝塞尔曲线画圆角
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddPath(context, [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(30, 30)].CGPath);
    //裁剪
    CGContextClip(context);
    //图片画到图形上下文
    [self drawInRect:rect];
    
    //获取新照片
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return newImage;
    
}
@end
