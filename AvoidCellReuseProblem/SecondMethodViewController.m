//
//  SecondMethodViewController.m
//  AvoidCellReuseProblem
//
//  Created by Don Mag on 7/22/22.
//

#import "SecondMethodViewController.h"
#import "SecondMethodCollectionViewCell.h"

@interface SecondMethodViewController ()
{
	UICollectionView *collectionView;
}
@end

@implementation SecondMethodViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.view.backgroundColor = UIColor.systemBackgroundColor;
	self.title = @"Second Method";

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
	
	[collectionView registerClass:SecondMethodCollectionViewCell.class forCellWithReuseIdentifier:@"c"];
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
	SecondMethodCollectionViewCell *c = (SecondMethodCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"c" forIndexPath:indexPath];
	c.theLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.item];
	return c;
}

//this allows us to de-select an already selected cell
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	
	// get array of already selected index paths
	NSArray *a = [collectionView indexPathsForSelectedItems];
	
	// if that array contains indexPath, that means
	//	it is already selected, so
	if ([a containsObject:indexPath]) {
		// deselect it
		[collectionView deselectItemAtIndexPath:indexPath animated:NO];
		
		// if we want to do something when de-selecting the already-selected cell
		//[newDictionary setValue:[NSNull null] forKey:@"type"];
		
		return NO;
	}
	// no indexPaths (cells) were selected
	return YES;
	
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	// this will only be called if we have selected a NEW cell
	//	it will NOT be called if we tapped the already-selected cell
	NSLog(@"Selected cell: %ld", (long)indexPath.item);
	
	// so we can do something on cell selection here
	//dictionaryType = _typesArray[indexPath.item];
	//[newDictionary setValue:dictionaryType forKey:@"type"];

}

@end
