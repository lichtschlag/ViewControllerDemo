//
//  EACell.m
//  ExampleApp
//
//  Created by Leonhard Lichtschlag on 13/Nov/12.
//  Copyright (c) 2012 Leonhard Lichtschlag. All rights reserved.
//

#import "EACell.h"
#import <QuartzCore/QuartzCore.h>

@implementation EACell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.contentView.layer.cornerRadius = 5.0f;
		self.contentView.layer.borderWidth	= 1.0f;
		self.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    }
    return self;
}



@end
