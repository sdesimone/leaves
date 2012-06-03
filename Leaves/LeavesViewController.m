//
//  LeavesViewController.m
//  Leaves
//
//  Created by Tom Brow on 4/18/10.
//  Copyright Tom Brow 2010. All rights reserved.
//

#import "LeavesViewController.h"

@implementation LeavesViewController

/*
- (void) initialize {
   leavesView_ = [[LeavesView alloc] initWithFrame:CGRectZero];
}
*/
/////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle
{
   if ((self = [super initWithNibName:nibName bundle:nibBundle])) {
//      [self initialize];
   }
   return self;
}

/////////////////////////////////////////////////////////////////////////////////////////////
- (id)init {
   return [self initWithNibName:nil bundle:nil];
}

/////////////////////////////////////////////////////////////////////////////////////////////
- (void) awakeFromNib {
	[super awakeFromNib];
//	[self initialize];
}

/////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
	[leavesView_ release];
    [super dealloc];
}

#pragma mark -
#pragma mark LeavesViewDataSource methods
/////////////////////////////////////////////////////////////////////////////////////////////
- (NSUInteger) numberOfPagesInLeavesView:(LeavesView*)leavesView {
	return 0;
}

/////////////////////////////////////////////////////////////////////////////////////////////
- (void) renderPageAtIndex:(NSUInteger)index inContext:(CGContextRef)ctx {
	
}

#pragma mark -
/////////////////////////////////////////////////////////////////////////////////////////////
- (void)loadView {
	[super loadView];
    if (leavesView_) {
        leavesView_.frame = self.view.bounds;
        leavesView_.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:leavesView_];
    }
}

/////////////////////////////////////////////////////////////////////////////////////////////
- (void) viewDidLoad {
	[super viewDidLoad];
    if (leavesView_) {
        leavesView_.dataSource = self;
        leavesView_.delegate = self;
        [leavesView_ reloadData];
    }
}

@end
