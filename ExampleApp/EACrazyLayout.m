//
//  EACrazyLayout.m
//  ExampleApp
//
//  Created by Leonhard Lichtschlag on 13/Nov/12.
//  Copyright (c) 2012 Leonhard Lichtschlag. All rights reserved.
//

#import "EACrazyLayout.h"

@implementation EACrazyLayout

// ---------------------------------------------------------------------------------------------------------------
#pragma mark -
#pragma mark UICollectionViewLayout
// ---------------------------------------------------------------------------------------------------------------

- (void) prepareLayout
{
    [super prepareLayout];
    
    CGSize size = self.collectionView.frame.size;
    self.center = CGPointMake(size.width / 2.0, size.height / 2.0);
    self.radius = MIN(size.width, size.height) / 2.5;
}


- (CGSize) collectionViewContentSize
{
    CGSize size = self.collectionView.frame.size;
    
    return CGSizeMake(size.width, 65.0 * 15);
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
{
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
	
	// helix layout
	attributes.size = CGSizeMake(80.0, 100.0);
	
	if (path.section == 0 )
	{
		CGFloat phase = 2.0 * M_PI * path.item / 10 + 0.3;
		attributes.center = CGPointMake(_center.x + _radius * cosf(phase),
										65.0 * path.item );
		if (phase > 0 && phase <= M_PI)
			attributes.zIndex = 0;
		else
			attributes.zIndex = 1;
	}
	else
	{
		CGFloat phase = 2.0 * M_PI * path.item / 10 + M_PI;
		attributes.center = CGPointMake(_center.x + _radius * cosf(phase),
										65.0 * path.item );
		if (phase > 0 && phase <= M_PI)
			attributes.zIndex = 1;
		else
			attributes.zIndex = 0;
	}
	
    return attributes;
}


- (NSArray*) layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* attributes = [NSMutableArray array];

	NSUInteger numberOfSections = [[self collectionView] numberOfSections];

    for (NSInteger i=0 ; i < numberOfSections; i++)
	{
		NSUInteger itemsInSection = [[self collectionView] numberOfItemsInSection:i];

		for (NSInteger j=0 ; j < itemsInSection; j++)
		{
			NSIndexPath* indexPath = [NSIndexPath indexPathForItem:j inSection:i];
			[attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
		}
	}
    return attributes;
}


@end
