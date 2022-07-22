//
//  FirstMethodViewController.m
//  AvoidCellReuseProblem
//
//  Created by Don Mag on 7/22/22.
//

#import "FirstMethodViewController.h"
#import "FirstMethodCollectionViewCell.h"

@interface FirstMethodViewController ()
{
	UICollectionView *collectionView;
	NSIndexPath *selectedIndexPath;
}
@end

@implementation FirstMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = UIColor.systemBackgroundColor;
	self.title = @"First Method";
	
	UICollectionViewFlowLayout *fl = [UICollectionViewFlowLayout new];
	fl.scrollDirection = UICollectionViewScrollDirectionVertical;
	fl.itemSize = CGSizeMake(60, 60);
	fl.minimumLineSpacing = 8;
	fl.minimumInteritemSpacing = 8;
	
	collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:fl];
	collectionView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view addSubview:collectionView];
	
	UILayoutGuide *g = [self.view safeAreaLayoutGuide];
	
	[NSLayoutConstraint activateConstraints:@[
		
		// constrain collection view 40-points from all 4 sides
		[collectionView.topAnchor constraintEqualToAnchor:g.topAnchor constant:40.0],
		[collectionView.leadingAnchor constraintEqualToAnchor:g.leadingAnchor constant:40.0],
		[collectionView.trailingAnchor constraintEqualToAnchor:g.trailingAnchor constant:-40.0],
		[collectionView.bottomAnchor constraintEqualToAnchor:g.bottomAnchor constant:-40.0],
		
	]];
	
	[collectionView registerClass:FirstMethodCollectionViewCell.class forCellWithReuseIdentifier:@"c"];
	collectionView.dataSource = self;
	collectionView.delegate = self;
	
	// let's give the collection view a very light gray background
	//  so we can see its frame
	collectionView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 100;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	FirstMethodCollectionViewCell *c = (FirstMethodCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"c" forIndexPath:indexPath];

	c.theLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.item];

	// we need to set the cell's elements colors based on selectedIndexPath
	if (selectedIndexPath == indexPath) {
		// set the cell's elements colors to show it "selected"
		[c.theImageView setTintColor:UIColor.redColor];
		c.theLabel.textColor = UIColor.yellowColor;
		c.contentView.backgroundColor = UIColor.systemBlueColor;
	}
	else
	{
		// set the cell's elements colors to show it "not selected"
		[c.theImageView setTintColor:UIColor.cyanColor];
		c.theLabel.textColor = UIColor.blackColor;
		c.contentView.backgroundColor = UIColor.systemBackgroundColor;
	}
	
	return c;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	// is a cell already selected?
	if (selectedIndexPath != nil) {
		// is it the same cell?
		if (indexPath.item == selectedIndexPath.item)
		{
			[collectionView deselectItemAtIndexPath:indexPath animated:YES];
			FirstMethodCollectionViewCell *selectedCell = (FirstMethodCollectionViewCell *)[collectionView cellForItemAtIndexPath:selectedIndexPath];
			
			// change the cell's elements colors to show it "not selected"
			[selectedCell.theImageView setTintColor:UIColor.cyanColor];
			selectedCell.theLabel.textColor = UIColor.blackColor;
			selectedCell.contentView.backgroundColor = UIColor.systemBackgroundColor;
			
			selectedIndexPath = nil;

			//[newDictionary setValue:[NSNull null] forKey:@"type"];
		}
		else
		{
			[collectionView deselectItemAtIndexPath:indexPath animated:YES];
			FirstMethodCollectionViewCell *previousSelectedCell =  (FirstMethodCollectionViewCell *)[collectionView cellForItemAtIndexPath:selectedIndexPath];
			
			// change the previously selected cell's elements colors to show it "not selected"
			[previousSelectedCell.theImageView setTintColor:UIColor.cyanColor];
			previousSelectedCell.theLabel.textColor = UIColor.blackColor;
			previousSelectedCell.contentView.backgroundColor = UIColor.systemBackgroundColor;

			selectedIndexPath = indexPath;
			FirstMethodCollectionViewCell *selectedCell =  (FirstMethodCollectionViewCell *)[collectionView cellForItemAtIndexPath:selectedIndexPath];

			// change the new cell's elements colors to show it "selected"
			[selectedCell.theImageView setTintColor:UIColor.redColor];
			selectedCell.theLabel.textColor = UIColor.yellowColor;
			selectedCell.contentView.backgroundColor = UIColor.systemBlueColor;

			NSLog(@"Selected cell: %ld", (long)indexPath.item);

			//dictionaryType = _typesArray[selectedIndexPath.item];
			//[newDictionary setValue:dictionaryType forKey:@"type"];
		}
	}
	else
	{
		selectedIndexPath = indexPath;
		FirstMethodCollectionViewCell *selectedCell =  (FirstMethodCollectionViewCell *)[collectionView cellForItemAtIndexPath:selectedIndexPath];

		// change the new cell's elements colors to show it "selected"
		[selectedCell.theImageView setTintColor:UIColor.redColor];
		selectedCell.theLabel.textColor = UIColor.yellowColor;
		selectedCell.contentView.backgroundColor = UIColor.systemBlueColor;

		NSLog(@"Selected cell: %ld", (long)indexPath.item);

		//dictionaryType = _typesArray[selectedIndexPath.item];
		//[newDictionary setValue:dictionaryType forKey:@"type"];
	}
}

@end
