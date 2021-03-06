//
//  SCView.h
//  SnowCat
//
//  Created by Moky on 14-3-17.
//  Copyright (c) 2014 Slanissue.com. All rights reserved.
//

#import "SCResponder.h"

UIKIT_EXTERN UIViewAnimationCurve UIViewAnimationCurveFromString(NSString * string);
UIKIT_EXTERN UIViewContentMode UIViewContentModeFromString(NSString * string);
UIKIT_EXTERN UIViewAnimationTransition UIViewAnimationTransitionFromString(NSString * string);
UIKIT_EXTERN UIViewAutoresizing UIViewAutoresizingFromString(NSString * string);
//UIKIT_EXTERN UIViewAnimationOptions UIViewAnimationOptionsFromString(NSString * string);
UIKIT_EXTERN UILayoutConstraintAxis UILayoutConstraintAxisFromString(NSString * string);

@interface SCView : UIView<SCUIKit>

+ (BOOL) setAttributes:(NSDictionary *)dict to:(UIView *)view;

@end
