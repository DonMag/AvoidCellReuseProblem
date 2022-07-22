//
//  SecondMethodCollectionViewCell.m
//  AvoidCellReuseProblem
//
//  Created by Don Mag on 7/22/22.
//

#import "SecondMethodCollectionViewCell.h"

@implementation SecondMethodCollectionViewCell

- (instancetype)init
{
	self = [super init];
	if (self) {
		[self commonInit];
	}
	return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self commonInit];
	}
	return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self commonInit];
	}
	return self;
}

- (void)commonInit {
	
	// add an image view and a label
	
	_theImageView = [UIImageView new];
	_theImageView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentView addSubview:_theImageView];
	
	_theLabel = [UILabel new];
	_theLabel.textAlignment = NSTextAlignmentCenter;
	_theLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightBold];
	_theLabel.translatesAutoresizingMaskIntoConstraints = NO;
	[self.contentView addSubview:_theLabel];
	
	[NSLayoutConstraint activateConstraints:@[
		
		[_theImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:0.0],
		[_theImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:0.0],
		[_theImageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:0.0],
		[_theImageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:0.0],
		
		[_theLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:0.0],
		[_theLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:0.0],
		[_theLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-4.0],
		
	]];
	
	// image would probably be set by the data source, but
	//	for this example we'll use the same system image in every cell
	UIImage *img = [UIImage systemImageNamed:@"person.fill"];
	if (img) {
		_theImageView.image = img;
	}
	
	// let's give the content view rounded corners and a border
	self.contentView.layer.cornerRadius = 8.0;
	self.contentView.layer.borderWidth = 2.0;
	self.contentView.layer.borderColor = UIColor.systemGreenColor.CGColor;
	
	// default (not-selected) colors
	[_theImageView setTintColor:UIColor.cyanColor];
	_theLabel.textColor = UIColor.blackColor;
	self.contentView.backgroundColor = UIColor.systemBackgroundColor;

}

// by implementing setSelected, we don't need to do any element color changes
//	in the controller -- we let the collection view itself handle it all
- (void)setSelected:(BOOL)selected {
	// change our color properties based on selected BOOL value
	_theImageView.tintColor = selected ? UIColor.redColor : UIColor.cyanColor;
	_theLabel.textColor = selected ? UIColor.yellowColor : UIColor.blackColor;
	self.contentView.backgroundColor = selected ? UIColor.systemBlueColor : UIColor.systemBackgroundColor;
}

@end
