//
//  AppDelegate_Phone.m
//  iPhone JSON
//
//  Created by John Wang on 4/8/10.
//  Copyright Fresh Blocks 2010. All rights reserved.
//

#import "AppDelegate_Phone.h"
#import "DisplayJSON.h"

@implementation AppDelegate_Phone

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    // Override point for customization after application launch
	//[HRRestModel setBaseURL:[NSURL URLWithString:@"http://iphone-json.appspot.com"]];
	[HRRestModel setBaseURL:[NSURL URLWithString:@"http://localhost:8080"]];
	//[HRRestModel setFormat:HRDataFormatXML]; //HRDataFormatJSON
	[HRRestModel setFormat:HRDataFormatJSON];
	displayView = [[DisplayJSON alloc] initWithNibName:@"DisplayJSON" bundle:nil];
	[window addSubview:displayView.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
	[displayView release];
    [window release];
    [super dealloc];
}


@end
