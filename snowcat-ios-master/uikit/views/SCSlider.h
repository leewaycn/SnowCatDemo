//
//  SCSlider.h
//  SnowCat
//
//  Created by Moky on 14-4-2.
//  Copyright (c) 2014 Slanissue.com. All rights reserved.
//

#import "SCControl.h"

@interface SCSlider : UISlider<SCUIKit>

+ (BOOL) setAttributes:(NSDictionary *)dict to:(UISlider *)slider;

// Value Event Interfaces
- (void) onChange:(id)sender;

@end
