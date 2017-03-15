//
//  CircleCore.h
//  Quartz
//
//  Created by 仙人掌 on 12-11-5.
//  Copyright (c) 2012年 仙人掌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#define ToRad( degree ) ( degree * M_PI / 180 )

#define ToDeg( rad )    ( rad / M_PI * 180 )

#define ZERO_DEGREE     (-90.0f)

typedef enum{
    PT_DONE   = 0,
    PT_UNDONE,
}Path_Type;

typedef struct CircleData{
    CGPoint center;
    CGFloat radius;
}CircleData;

CircleData CircleDataMake(CGPoint center, CGFloat radius);
CGFloat DistanceBetweenPoints(CGPoint point1,CGPoint point2);

@interface CircleCore : NSObject{
    CGFloat referenceDegree_;
    CGFloat currentDegree_;
    CircleData smallCircle_;
    CircleData largeCircle_;
}
@property( nonatomic ) CGFloat referenceDegree;
@property( nonatomic ) CGFloat currentDegree;
@property( nonatomic ) CircleData smallCircle;
@property( nonatomic ) CircleData largeCircle;
-(CGMutablePathRef)GetPathForMode:(Path_Type)pathType;
-(BOOL)PointInPathWithPoint:(CGPoint)point BetweenDegree:(CGFloat)start And:(CGFloat)end;
@end
