//
//  UIImage+wonder.m
//  ReactiveCocoaPlay
//
//  Created by 王震 on 2017/1/16.
//  Copyright © 2017年 vint. All rights reserved.
//

#import "UIImage+wonder.h"

@implementation UIImage (wonder)

+ (UIImage *) zz_imageWithColor:(UIColor *) color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
