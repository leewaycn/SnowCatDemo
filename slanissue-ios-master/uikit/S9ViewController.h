//
//  S9ViewController.h
//  SlanissueToolkit
//
//  Created by Moky on 15-8-31.
//  Copyright (c) 2015 Slanissue.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SlanissueToolkit)

// get all children of parent, includes self
- (NSArray *) siblings;

@end
