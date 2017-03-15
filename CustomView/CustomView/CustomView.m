//
//  CustomView.m
//  CustomView
//
//  Created by 韩森 on 2016/10/28.
//  Copyright © 2016年 hansen. All rights reserved.
//

#import "CustomView.h"
#define PI 3.14159265358979323846

@interface CustomView  ()

@property(nonatomic , assign) CGFloat circleRadius;//半径

@end

@implementation CustomView

#define DEGREES_TO_RADIANS(angle) ((angle)/180.0 *M_PI)
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
//    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /*写文字*/
//    CGContextSetRGBFillColor (context,  1, 0, 0, 1.0);//设置填充颜色
    UIFont  *font = [UIFont boldSystemFontOfSize:15.0];//设置
   
//    [@"画圆：" drawInRect:CGRectMake(10, 20, 80, 20) withAttributes:@{NSFontAttributeName:font}];
//    [@"画线及孤线：" drawInRect:CGRectMake(10, 80, 100, 20) withAttributes:@{NSFontAttributeName:font}];
//    [@"画矩形：" drawInRect:CGRectMake(10, 120, 80, 20) withAttributes:@{NSFontAttributeName:font}];
//    [@"画扇形和椭圆：" drawInRect:CGRectMake(10, 160, 110, 20) withAttributes:@{NSFontAttributeName:font}];
//    [@"画三角形：" drawInRect:CGRectMake(10, 220, 80, 20) withAttributes:@{NSFontAttributeName:font}];
//    [@"画圆角矩形：" drawInRect:CGRectMake(10, 260, 100, 20) withAttributes:@{NSFontAttributeName:font}];
//    [@"画贝塞尔曲线：" drawInRect:CGRectMake(10, 300, 100, 20) withAttributes:@{NSFontAttributeName:font}];
//    [@"图片：" drawInRect:CGRectMake(10, 340, 80, 20) withAttributes:@{NSFontAttributeName:font}];
    
    /*画圆*/
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat lineLosePoint1X = 20;
    CGFloat lineLosePoint1Y = 100; //(20,100)

    CGFloat lineEndPoint1X = self.frame.size.width-20;
    CGFloat lineEndPoint1Y = 100;   //(220,100)
    
    CGContextMoveToPoint(context, lineLosePoint1X,lineLosePoint1Y);
    CGContextAddLineToPoint(context, lineLosePoint1X, lineLosePoint1Y);
    CGContextAddLineToPoint(context, lineEndPoint1X, lineEndPoint1Y);
    
    
//    CGFloat lineLosePoint2X = 20;
//    CGFloat lineLosePoint2Y = 100;
//    
//    CGFloat lineEndPoint2X = self.frame.size.width-20;
    CGFloat lineEndPoint2Y = 100+50*_titlesSource.count;   //(220,100)

    CGContextAddLineToPoint(context, lineEndPoint1X, lineEndPoint2Y);
    CGContextAddLineToPoint(context, lineLosePoint1X, lineEndPoint2Y);
    CGContextAddLineToPoint(context, lineLosePoint1X, lineLosePoint1Y);
    
    CGContextSetLineWidth(context, 1.0);
    
    CGContextSetFillColorWithColor(context , [UIColor yellowColor].CGColor);
    CGContextStrokePath(context);
    
    
    // 数字的长度
    CGSize itemSizeNumber22 = [@"200" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0]}];
    
    //指引线上面的数字
    [@"200" drawAtPoint:CGPointMake(lineLosePoint1X, lineEndPoint2Y) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0],NSForegroundColorAttributeName:[UIColor redColor]}];
    
    //指引线下面的text
    
//    NSMutableParagraphStyle * paragraph11 = [[NSMutableParagraphStyle alloc]init];
//    paragraph11.alignment = NSTextAlignmentRight;
//    if (lineLosePoint1X < [UIScreen mainScreen].bounds.size.width /2.0) {
//        paragraph11.alignment = NSTextAlignmentLeft;
//    }
//    [@"这么厉害啊,drawInRect" drawInRect:CGRectMake(lineLosePoint1X, lineEndPoint2Y, 60, 50) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0],NSForegroundColorAttributeName:[UIColor blueColor],NSParagraphStyleAttributeName:paragraph11}];
    
    for (int i = 0; i<_titlesSource.count; i++) {
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextMoveToPoint(context, lineLosePoint1X, 100+(i+1)*50);
        
        
        CGContextAddLineToPoint(context, lineLosePoint1X, 100+(i+1)*50);
        CGContextAddLineToPoint(context, lineEndPoint1X, 100+(i+1)*50);
        
        CGContextSetLineWidth(context, 1.0);
        CGContextSetFillColorWithColor(context , [UIColor blackColor].CGColor);
        
        [[UIColor blackColor]set];
        
        CGContextStrokePath(context);
        
        [_titlesSource[i] drawInRect:CGRectMake(20+5, 100+i*50+18, 80, 50) withAttributes:@{NSFontAttributeName:font}];
        
        [_timeSource[i] drawInRect:CGRectMake(self.frame.size.width/2+5, 100+i*50+18, 80, 50) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor redColor]}];
        
        
        //指引线下面的text
        
    
        
        
      
    }

    
    for (int i = 0; i<2; i++) {
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextMoveToPoint(context, self.frame.size.width/2, 100+(i)*50);
        
        
        CGContextAddLineToPoint(context, self.frame.size.width/2, 100+50);
        CGContextAddLineToPoint(context, self.frame.size.width/2, 100+(_titlesSource.count)*50);
        
        CGContextSetLineWidth(context, 1.0);
//        CGContextSetFillColorWithColor(context , [UIColor blackColor].CGColor);
        [[UIColor blackColor]set];
        
        CGContextStrokePath(context);

    }
    

    
    //return;
    
    //边框圆
//    CGContextSetRGBStrokeColor(context,1,1,1,1.0);//画笔线的颜色
//    CGContextSetLineWidth(context, 3.0);//线的宽度
//    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
//    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
//    CGContextAddArc(context, 200, 100, 50, 0, 2*M_PI, 1); //添加一个圆
//    CGContextDrawPath(context, kCGPathStroke); //绘制路径
//    //1.
//    CGContextAddArc(context, 200, 100, 40, -M_PI/6, M_PI/6, 0); //添加一个圆
//    CGContextAddArc(context, 200, 100, 25, -M_PI/6, M_PI/6, 0);
//    
//    
//    CGContextMoveToPoint(context, 200, 100);
//    CGContextAddArcToPoint(context, 250, 150, 240, 140, 1);
//    CGContextAddArcToPoint(context, 0, 150, 0, 140, 10);
    
    int fw = 200;
    int fh = 100;
    
//    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
//    
//    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    
//    CGContextMoveToPoint(context, fw/2, fh);  // 重新移动焦点到制定的位置，为进行下一段弧的绘制做准备
//    
//    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
//
    
    
    
//    CGContextDrawPath(context, kCGPathEOFill); //绘制路径
    
    //2.
//    CGContextAddArc(context, 200, 100, 40, M_PI/3*2, M_PI, 0); //添加一个圆
//    CGContextDrawPath(context, kCGPathStroke); //绘制路径
    
    
//
//    //填充圆，无边框
//    CGContextAddArc(context, 150, 30, 30, 0, 2*M_PI, 0); //添加一个圆
//    CGContextDrawPath(context, kCGPathFill);//绘制填充
//    
//    //画大圆并填充颜
//    UIColor*aColor = [UIColor colorWithRed:1 green:0.0 blue:0 alpha:1];
//    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
//    CGContextSetLineWidth(context, 3.0);//线的宽度
//    CGContextAddArc(context, 250, 40, 40, 0, 2*M_PI, 0); //添加一个圆
//    //kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
//    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充
    /*画线及孤线*/
    //画线
//    CGPoint aPoints[2];//坐标点
//    aPoints[0] =CGPointMake(100, 80);//坐标1
//    aPoints[1] =CGPointMake(130, 80);//坐标2
//    //CGContextAddLines(CGContextRef c, const CGPoint points[],size_t count)
//    //points[]坐标数组，和count大小
//    CGContextAddLines(context, aPoints, 2);//添加线
//    CGContextDrawPath(context, kCGPathStroke); //根据坐标绘制路径
    
    
    //画笑脸弧线
    //左
//    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);//改变画笔颜色
//    CGContextMoveToPoint(context, 140, 80);//开始坐标p1
    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
//    CGContextAddArcToPoint(context, 100, 80, 108, 92, 10);
//    CGContextStrokePath(context);//绘画路径
    
    //右
//    CGContextMoveToPoint(context, 160, 80);//开始坐标p1
//    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
//    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
//    CGContextAddArcToPoint(context, 168, 68, 176, 80, 10);
//    CGContextStrokePath(context);//绘画路径
//    
//    //右
//    CGContextMoveToPoint(context, 150, 90);//开始坐标p1
//    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
//    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
//    CGContextAddArcToPoint(context, 158, 102, 166, 90, 10);
//    CGContextStrokePath(context);//绘画路径
    
    /*
     
     */
  
    
    
    //画 1/3 的圆
    _circleRadius = 65;
    
     CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat angle_start = 0;
    CGFloat angle_end   = M_PI*2/600 * 200;
    
    CGPoint point = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
//
    CGContextMoveToPoint(ctx, point.x, point.y);
    UIColor * color = [UIColor blackColor];
//    CGContextSetStrokeColorSpace(ctx, CGColorGetColorSpace(color.CGColor));
    CGContextSetFillColor(ctx, CGColorGetComponents( color.CGColor));
    CGContextAddArc(ctx, point.x, point.y, _circleRadius,  angle_start, angle_end, 0);
    CGContextFillPath(ctx);
    
    
    
    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat angle_start2 = angle_end;
    CGFloat angle_end2   = M_PI*2/600 * 400;
    
    CGPoint point2 = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    //
    CGContextMoveToPoint(ctx, point.x, point.y);
    UIColor * color2 = [UIColor yellowColor];
    //    CGContextSetStrokeColorSpace(ctx, CGColorGetColorSpace(color.CGColor));
    CGContextSetFillColor(ctx, CGColorGetComponents( color2.CGColor));
    CGContextAddArc(ctx, point2.x, point2.y, _circleRadius,  angle_start2, angle_end2, 0);
    CGContextFillPath(ctx);
    /*
     如果把 中心圆 放到上面 设置不同的颜色就可以;
     但是把中心圆 的 代码 放到上面 就不行了;
     
     */
    {
        //画白色的中心圆
#define radiu 25
        UIBezierPath *arcPath11 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2) radius:radiu startAngle:0 endAngle:PI * 2 clockwise:YES];
        
        [[UIColor whiteColor] set];
        [arcPath11 fill];
        [arcPath11 stroke];
        
    }
    
//    return;
    
    // 弧度的中心角度
    CGFloat h = (angle_end + angle_start) / 2.0;
    //小圆的中心点
    CGFloat x = self.frame.size.width / 2 + (_circleRadius + 10) * cos(h);
    CGFloat y = self.frame.size.height / 2 + (_circleRadius + 10) * sin(h);
    
    
    //小圆中心点
    CGFloat smallCircleCenterPointX = x;
    CGFloat smallCircleCenterPointY = y;
    //画边上的小圆
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(smallCircleCenterPointX, smallCircleCenterPointY) radius:4 startAngle:0 endAngle:PI * 2 clockwise:YES];
    [color set];
    [arcPath fill];
    [arcPath stroke];
    
    //中圆
    UIBezierPath * circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(x, y) radius:10 startAngle:0 endAngle:M_PI clockwise:YES];
    UIColor * blueColor = [UIColor magentaColor];
    [blueColor set];
    [circlePath fill];
    [circlePath stroke];
    
    
    
    //折点
    CGFloat lineLosePointX = 0.0 ; //指引线的折点
    CGFloat lineLosePointY = 0.0 ; //
    
    //指引线的终点
    CGFloat lineEndPointX ; //
    CGFloat lineEndPointY ; //
    
    //数字的起点
    CGFloat numberStartX;
    CGFloat numberStartY;
    
    //文字的起点
    CGFloat textStartX;
    CGFloat textStartY;

    // 数字的长度
    CGSize itemSizeNumber = [@"200" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0]}];
    lineLosePointX = smallCircleCenterPointX+10.0*cos(h);
    lineLosePointY = smallCircleCenterPointY + 10.0*sin(h);
    
    if (smallCircleCenterPointX > self.frame.size.width / 2) {
        //指引线的终点
        lineEndPointX = lineLosePointX + 60.0; //
        lineEndPointY = lineLosePointY; //
        //数字
        numberStartX = lineEndPointX - itemSizeNumber.width;
        numberStartY = lineEndPointY - itemSizeNumber.height;
        //文字
        textStartX = lineEndPointX - 60;
        textStartY = lineEndPointY;
    }else{
        //指引线的终点
        lineEndPointX = lineLosePointX - 60.0; //
        lineEndPointY = lineLosePointY; //
        
        // 数字
        numberStartX = lineEndPointX ;
        numberStartY = lineEndPointY - itemSizeNumber.height;
        
        //文字
        textStartX = lineEndPointX;
        textStartY = lineEndPointY;
    }

    //画指引线
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, smallCircleCenterPointX,smallCircleCenterPointY);
    CGContextAddLineToPoint(ctx, lineLosePointX, lineLosePointY);
    CGContextAddLineToPoint(ctx, lineEndPointX, lineEndPointY);
    CGContextSetLineWidth(ctx, 1.0);
    
    CGContextSetFillColorWithColor(ctx , color.CGColor);
    CGContextStrokePath(ctx);
    
    //指引线上面的数字
    [@"200" drawAtPoint:CGPointMake(numberStartX, numberStartY) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0],NSForegroundColorAttributeName:color}];
    
    
    //指引线下面的text
    
    NSMutableParagraphStyle * paragraph = [[NSMutableParagraphStyle alloc]init];
    paragraph.alignment = NSTextAlignmentRight;
    if (lineEndPointX < [UIScreen mainScreen].bounds.size.width /2.0) {
        paragraph.alignment = NSTextAlignmentLeft;
    }
    
    [@"这么厉害啊,drawInRect" drawInRect:CGRectMake(textStartX, textStartY, 60, 50) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0],NSForegroundColorAttributeName:color,NSParagraphStyleAttributeName:paragraph}];
}


@end
