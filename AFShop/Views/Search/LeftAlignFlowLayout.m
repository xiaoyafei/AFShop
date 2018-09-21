//
//  LeftAlignFlowLayout.m
//  AFShop
//
//  Created by 飞 on 2018/9/17.
//  Copyright © 2018 飞. All rights reserved.
//

#import "LeftAlignFlowLayout.h"

@implementation LeftAlignFlowLayout

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    for (int i = 1; i < array.count; ++i) {
        UICollectionViewLayoutAttributes *currentLayoutAttributes = array[i];
        UICollectionViewLayoutAttributes *prevLayoutAttributes = array[i - 1];
        
        if ([currentLayoutAttributes.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            continue;
        }
        
        NSInteger preX = CGRectGetMaxX(prevLayoutAttributes.frame);
        NSInteger preY = CGRectGetMaxY(prevLayoutAttributes.frame);
        NSInteger curY = CGRectGetMaxY(currentLayoutAttributes.frame);
        
        NSInteger maximumSpacing = 10;
        
        if (preY == curY) {
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = preX + maximumSpacing;
            currentLayoutAttributes.frame = frame;
        }else {
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = 10;
            currentLayoutAttributes.frame = frame;
        }
    }
    return array;
}

@end
