//
//  CircleCore.m
//  Quartz
//
//  Created by 仙人掌 on 12-11-5.
//  Copyright (c) 2012年 仙人掌. All rights reserved.
//

#import "CircleCore.h"

CircleData CircleDataMake(CGPoint center, CGFloat radius){
    CircleData myCircleData;
    myCircleData.center = center;
    myCircleData.radius = radius;
    return myCircleData;
}
CGFloat DistanceBetweenPoints(CGPoint point1,CGPoint point2){
    CGFloat temp = ( point1.x - point2.x ) * ( point1.x - point2.x ) + ( point1.y - point2.y ) * ( point1.y - point2.y );
    return ( CGFloat )sqrt( temp );
}

@interface CircleCore(Pravite)
-(CGMutablePathRef)GetPathForMode_DONE;
-(CGMutablePathRef)GetPathForMode_UNDONE;
-(CGPoint)GetPointWithCircle:(CircleData)circle AtDegree:(CGFloat)degree;

@end

@implementation CircleCore(Pravite)
-(CGPoint)GetPointWithCircle:(CircleData)circle AtDegree:(CGFloat)degree{
    CGFloat x,y;
    x = circle.center.x + cos( ToRad( degree ) ) * circle.radius;
    y = circle.center.y + sin( ToRad( degree ) ) * circle.radius;
    return CGPointMake( x, y );
}
-(CGMutablePathRef)GetPathForMode_DONE{
    CGMutablePathRef resultPath = CGPathCreateMutable();
    
    CGPoint smallCircle_referencePoint = [self GetPointWithCircle:smallCircle_ AtDegree:referenceDegree_];
    CGPoint largeCircle_referencePoint = [self GetPointWithCircle:largeCircle_ AtDegree:referenceDegree_];
    CGPoint smallCircle_currentPoint = [self GetPointWithCircle:smallCircle_ AtDegree:currentDegree_];
    CGPathMoveToPoint( resultPath, NULL, smallCircle_referencePoint.x, smallCircle_referencePoint.y );
    CGPathAddLineToPoint( resultPath, NULL, largeCircle_referencePoint.x, largeCircle_referencePoint.y );
    CGPathAddArc( resultPath, NULL, smallCircle_.center.x, smallCircle_.center.y, largeCircle_.radius, ToRad( referenceDegree_ ), ToRad( currentDegree_ ), 0 );
    CGPathAddLineToPoint( resultPath, NULL, smallCircle_currentPoint.x, smallCircle_currentPoint.y );
    CGPathAddArc( resultPath, NULL, smallCircle_.center.x, smallCircle_.center.y, smallCircle_.radius, ToRad( currentDegree_ ), ToRad( referenceDegree_ ), 1 );
    

    return resultPath;
}

-(CGMutablePathRef)GetPathForMode_UNDONE{
    CGMutablePathRef resultPath = CGPathCreateMutable();
    CGPoint largeCircle_referencePoint = [self GetPointWithCircle:largeCircle_ AtDegree:referenceDegree_];
    CGPoint smallCircle_currentPoint = [self GetPointWithCircle:smallCircle_ AtDegree:currentDegree_];
    
    CGPathMoveToPoint(resultPath, NULL, largeCircle_referencePoint.x, largeCircle_referencePoint.y);
    CGPathAddArc(resultPath, NULL, largeCircle_.center.x, largeCircle_.center.y, largeCircle_.radius, ToRad(referenceDegree_), ToRad(currentDegree_), 1);
    CGPathAddLineToPoint(resultPath, NULL, smallCircle_currentPoint.x, smallCircle_currentPoint.y);
    CGPathAddArc(resultPath, NULL, smallCircle_.center.x, smallCircle_.center.y, smallCircle_.radius, ToRad(currentDegree_), ToRad(referenceDegree_), 0);
    CGPathAddLineToPoint(resultPath, NULL, largeCircle_referencePoint.x, largeCircle_referencePoint.y);
    return resultPath;
}
@end

@implementation CircleCore
@synthesize referenceDegree = referenceDegree_;
@synthesize currentDegree = currentDegree_;
@synthesize smallCircle = smallCircle_;
@synthesize largeCircle = largeCircle_;
-(id)init{
    self  = [super init];
    if ( nil != self){
        referenceDegree_ = ZERO_DEGREE;
        referenceDegree_ = ZERO_DEGREE;
    }
    return self;
}
-(CGFloat)referenceDegree{
    return referenceDegree_ - ZERO_DEGREE;
}

-(void)setReferenceDegree:(CGFloat)referenceDegree{
    referenceDegree_ = referenceDegree + ZERO_DEGREE;
}

-(void)setCurrentDegree:(CGFloat)currentDegree{
    currentDegree_ = currentDegree + ZERO_DEGREE;
}

-(CGFloat)currentDegree{
    return currentDegree_ - ZERO_DEGREE;
}

-(CGMutablePathRef)GetPathForMode:(Path_Type)pathType{
    switch (pathType) {
        case PT_DONE:
            return [self GetPathForMode_DONE];
        case PT_UNDONE:
            return [self GetPathForMode_UNDONE];
        default:
            return NULL;
    }
}
-(BOOL)PointInPathWithPoint:(CGPoint)point BetweenDegree:(CGFloat)start And:(CGFloat)end{
    CGFloat distance = DistanceBetweenPoints( point, largeCircle_.center );
    if ( distance > largeCircle_.radius || distance < smallCircle_.radius )
        return NO;
    CGFloat base_degree = 0.0f;
    NSInteger flag = 0;
    CGPoint base_point = CGPointMake( point.x - largeCircle_.center.x, largeCircle_.center.y - point.y );
    if ( base_point.x >= 0.0f && base_point.y >= 0.0f ){ //第一象限
        base_degree = 0.0f;
        flag = 1;
    }
    else if ( base_point.x < 0 && base_point.y >= 0 ){  //第二象限
        base_degree = 360.0;
        flag = 2;
    }
    else if ( base_point.x <0 && base_point.y < 0 ){   //第三象限
        base_degree = 180.0f;
        flag = 3;
    }
    else{                                              //第四象限
        base_degree = 180.0f;
        flag = 4;
    }
//
    CGFloat x = ABS( base_point.x );
    double temp_rad = asin( x / distance );
    CGFloat result = 0.0f;
    if ( 1 == flag || 3 == flag )
        result = ToDeg( temp_rad ) + base_degree;
    else
        result = base_degree - ToDeg( temp_rad );
    if ( result >= start  && result <= end )
        return YES;
    else
        return NO;
}
@end















