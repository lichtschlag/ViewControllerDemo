//
//  EAStackLayout.m
//  ExampleApp
//
//  Created by Leonhard Lichtschlag on 13/Nov/12.
//  Copyright (c) 2012 Leonhard Lichtschlag. All rights reserved.
//

#import "EAStackLayout.h"

@implementation EAStackLayout


// ---------------------------------------------------------------------------------------------------------------
#pragma mark -
#pragma mark UICollectionViewLayout
// ---------------------------------------------------------------------------------------------------------------

- (void) prepareLayout
{
    [super prepareLayout];
    
    CGSize size = self.collectionView.frame.size;
    self.center = CGPointMake(size.width / 2.0, size.height / 2.0);
}


- (CGSize) collectionViewContentSize
{
    CGSize size = self.collectionView.frame.size;
    
    return CGSizeMake(size.width, 65.0 * 15);
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
{
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
	
	// stack layout
	if (path.section == 0 )
	{
		attributes.center = CGPointMake(_center.x, 200.0 );
	}
	else
	{
		attributes.center = CGPointMake(_center.x, 400.0 );
	}
	
	attributes.size = CGSizeMake(150.0, 200.0);
	attributes.transform3D = CATransform3DMakeRotation(2.0 * M_PI * path.item / 15, 0, 0, 1);
	
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
