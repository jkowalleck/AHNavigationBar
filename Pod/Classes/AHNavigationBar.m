//
//  AHNavigationBar.m
//
//  Created by jan on 22/04/15.
//  Copyright (c) 2015 jnkowa. All rights reserved.
//

#import "AHNavigationBar.h"


@interface AHNavigationBar ()

@property (nonatomic) CGFloat initialHeight;
@property (nonatomic) CGFloat cgHeight;

+ (CGFloat)fixHeigh:(NSUInteger)height;

@end


#pragma mark -


@implementation AHNavigationBar

+ (CGFloat)fixHeigh:(NSUInteger)height
{
	if ( height % 2 ) {
		++height;
	}
	return (CGFloat)height;
}


#pragma mark - setter and getter

- (void)setHeight:(NSUInteger)height {
	self.cgHeight = [[self class] fixHeigh:height];
	self.transform = CGAffineTransformMakeTranslation(0, -(self.cgHeight - self.initialHeight) / 2.0f );
	[self layoutSubviews];
}

- (NSUInteger)getHeight {
	return (NSUInteger)self.cgHeight;
}

#pragma mark - init

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if ( self ) {
		self.initialHeight = self.frame.size.height;
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if ( self ) {
		self.initialHeight = self.frame.size.height;
	}
	return self;
}

#pragma mark - render 

- (CGSize)sizeThatFits:(CGSize)givenSize {
	CGSize size = [super sizeThatFits:givenSize];
	size.height = self.cgHeight;
	return size;
}

static NSString * const backgroundClassName = @"_UINavigationBarBackground";

- (void)layoutSubviews {
	[super layoutSubviews];

	for (UIView *view in [self subviews]) {

		if ( [NSStringFromClass([view class]) isEqualToString:backgroundClassName] ) {
			CGFloat sbHeight = [UIApplication sharedApplication].statusBarFrame.size.height;

			CGRect bounds = view.bounds;
			CGRect frame = view.frame;

			frame.size.height = bounds.size.height = self.cgHeight + sbHeight;
			frame.origin.y = -self.transform.ty - sbHeight;

			view.bounds = bounds;
			view.frame = frame;
		}
	}
}



@end
