//
//  ViewController.m
//  AvoidCellReuseProblem
//
//  Created by Don Mag on 7/22/22.
//

#import "ViewController.h"
#import "FirstMethodViewController.h"
#import "SecondMethodViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (IBAction)firstMethodTap:(id)sender {
	FirstMethodViewController *vc = [FirstMethodViewController new];
	[self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)secondMethodTap:(id)sender {
	SecondMethodViewController *vc = [SecondMethodViewController new];
	[self.navigationController pushViewController:vc animated:YES];
}


@end
