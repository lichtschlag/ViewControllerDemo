//
//  EACollectionController.m
//  ExampleApp
//
//  Created by Leonhard Lichtschlag on 13/Nov/12.
//  Copyright (c) 2012 Leonhard Lichtschlag. All rights reserved.
//

#import "EACollectionController.h"
#import "EACell.h"
#import "EACrazyLayout.h"
#import "EAStackLayout.h"

@interface EACollectionController ()

@property (strong) NSArray *albums;

@end

@implementation EACollectionController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// load the data
	self.albums = [[NSArray alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"music" withExtension:@"plist"]];
}


- (void)viewDidAppear:(BOOL)animated
{
	[self becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
	return YES;
}


- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// ---------------------------------------------------------------------------------------------------------------
#pragma mark -
#pragma mark data source
// ---------------------------------------------------------------------------------------------------------------

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return [self.albums count];
}


- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
	return [self.albums[section][@"tracks"] count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    EACell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
	
    // Configure the cell...
	cell.titleView.text = self.albums[indexPath.section][@"tracks"][indexPath.row][@"name"];
	NSString *albumArtName = self.albums[indexPath.section][@"artwork"];
	cell.imageView.image = [UIImage imageNamed:albumArtName];
	
    return cell;
}


- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
	
    if ( event.subtype == UIEventSubtypeMotionShake )
	{
		if ([self.collectionView.collectionViewLayout isKindOfClass:[EACrazyLayout class]])
			[self.collectionView setCollectionViewLayout:[EAStackLayout new] animated:YES];
		else
			[self.collectionView setCollectionViewLayout:[EACrazyLayout new] animated:YES];
    }
	
    if ([super respondsToSelector:@selector(motionEnded:withEvent:)])
	{
        [super motionEnded:motion withEvent:event];
    }
}


@end
