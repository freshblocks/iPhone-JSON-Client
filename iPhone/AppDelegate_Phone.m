//
//  AppDelegate_Phone.m
//  iPhone JSON
//
//  Created by John Wang on 4/8/10.
//  Copyright Fresh Blocks 2010. All rights reserved.
//

#import "AppDelegate_Phone.h"

@implementation AppDelegate_Phone

@synthesize window, _tabBar, _contacts;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    // Override point for customization after application launch
	
	NSString * bURL = [[NSUserDefaults standardUserDefaults] stringForKey:@"baseURL"];
	NSLog(@"base: %@",bURL);
	if (bURL == NULL) {
		bURL = @"http://iphone-json.appspot.com";
		[[NSUserDefaults standardUserDefaults] setValue:bURL forKey:@"baseURL"];
		[[NSUserDefaults standardUserDefaults] setValue:@"/contacts" forKey:@"path"];
		//[[NSUserDefaults standardUserDefaults] setValue:@"JSON" forKey:@"format"];
	}
	
	[HRRestModel setBaseURL:[NSURL URLWithString:bURL]];
	//[HRRestModel setFormat:HRDataFormatXML];
	[HRRestModel setFormat:HRDataFormatJSON];

	[window addSubview:_tabBar.view];
	[window makeKeyAndVisible];
	
	return YES;
}

- (void)dealloc {
	[_contacts release];
	[_tabBar release];
    [window release];
    [super dealloc];
}


@end