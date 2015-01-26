/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import <CoreFoundation/CoreFoundation.h>
#import <Security/Security.h>
#import "ComObscureKeychainModule.h"
#import "KeychainItemWrapperProxy.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation ComObscureKeychainModule

#pragma mark Internal

-(id)moduleGUID
{
	//return @"acf8434d-5290-4b73-8f39-e4cd7349860a";
    //changed from appc marketplace guid
    return @"7fd1e0b4-6ee5-4e6f-b18c-b2fc36e54123";
}

-(NSString*)moduleId
{
	return @"com.obscure.keychain";
}

#pragma mark Lifecycle

-(void)startup
{
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	[super shutdown:sender];
}


#pragma Public APIs

- (id)createKeychainItem:(id)args {
    NSString * identifier;
    NSString * accessGroup;
    
    ENSURE_ARG_AT_INDEX(identifier, args, 0, NSString)
    ENSURE_ARG_OR_NIL_AT_INDEX(accessGroup, args, 1, NSString)
    
    return [[[KeychainItemWrapperProxy alloc] initWithIdentifier:identifier accessGroup:accessGroup] autorelease];
}

@end
