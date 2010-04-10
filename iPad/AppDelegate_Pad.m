//
//  AppDelegate_Pad.m
//  iPhone JSON
//
//  Created by John Wang on 4/8/10.
//  Copyright Fresh Blocks 2010. All rights reserved.
//

#import "AppDelegate_Pad.h"
#import <JSON/JSON.h>
@implementation AppDelegate_Pad

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    // Override point for customization after application launch
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
