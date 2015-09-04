//
//  S9String.m
//  SlanissueToolkit
//
//  Created by Moky on 15-8-24.
//  Copyright (c) 2015 Slanissue.com. All rights reserved.
//

/**
 *  Identifier Addition for UIDevice:
 *      https://github.com/gekitz/UIDevice-with-UniqueIdentifier-for-iOS-5
 */
// 'libs/IdentifierAddition'
#import "NSString+MD5Addition.h"

#import "s9Macros.h"
#import "S9Object.h"
#import "S9String.h"

@implementation NSString (SlanissueToolkit)

+ (NSString *) stringBySerializingObject:(NSObject *)object
{
	return JSONStringFromNSObject(object);
}

- (NSString *) MD5String
{
	return [self stringFromMD5];
}

- (NSString *) trim
{
	NSCharacterSet * charset = [NSCharacterSet whitespaceAndNewlineCharacterSet];
	return [self stringByTrimmingCharactersInSet:charset];
}

- (NSString *) trim:(NSString *)chars
{
	NSCharacterSet * charset = [NSCharacterSet characterSetWithCharactersInString:chars];
	return [self stringByTrimmingCharactersInSet:charset];
}

- (NSString *) escape
{
	NSString * string = self;
	string = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	string = [string stringByReplacingOccurrencesOfString:@" " withString:@"+"];
	return string;
}

- (NSString *) unescape
{
	NSString * string = self;
	string = [string stringByReplacingOccurrencesOfString:@"+" withString:@" "];
	string = [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
	return string;
}

- (NSString *) simplifyPath
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	NSString * string = self;
	NSRange range1, range2;
	
	while ((range1 = [string rangeOfString:@"/../"]).location != NSNotFound) {
		if (range1.location < 1 || [string characterAtIndex:range1.location - 1] == '/') {
			S9Log(@"error: %@", string);
			break;
		}
		range2 = [string rangeOfString:@"/"
							   options:NSBackwardsSearch
								 range:NSMakeRange(0, range1.location)];
		if (range2.location == NSNotFound) {
			range2.location = -1;
		}
		NSString * str1 = [string substringWithRange:NSMakeRange(0, range2.location + 1)];
		NSString * str2 = [string substringFromIndex:range1.location + 4];
		string = [str1 stringByAppendingString:str2];
	}
	
	[string retain];
	[pool release];
	
	return [string autorelease];
}

- (NSString *) calculate
{
	NSString * string = self;
	
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	NSRange range;
	
	NSInteger pos1, pos2;
	unichar ch;
	NSString * substr;
	
	for (pos1 = [string length] - 1; pos1 >= 0; --pos1) {
		
		for (pos2 = pos1; pos2 >= 0; --pos2) {
			ch = [string characterAtIndex:pos2];
			if (ch != '{' && ch != '}' && ch != ',') {
				break;
			}
		}
		
		for (pos1 = pos2; pos1 >= 0; --pos1) {
			ch = [string characterAtIndex:pos1];
			if (ch == '{' || ch == '}' || ch == ',') {
				break;
			}
		}
		
		range.location = pos1 + 1;
		range.length = pos2 - pos1;
		substr = [string substringWithRange:range];
		substr = [substr trim];
		if ([substr length] > 0) {
			string = [NSString stringWithFormat:@"%@%.1f%@",
					  [string substringToIndex:pos1 + 1],
					  CGFloatFromString(substr),
					  [string substringFromIndex:pos2 + 1]];
		}
	}
	
	[string retain];
	[pool release];
	
	return [string autorelease];
}

@end
