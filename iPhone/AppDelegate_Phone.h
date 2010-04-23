//
//  AppDelegate_Phone.h
//  iPhone JSON
//
//  Created by John Wang on 4/8/10.
//  Copyright Fresh Blocks 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HTTPRiot/HTTPRiot.h>

@interface AppDelegate_Phone : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	UITabBarController *_tabBar;
	NSMutableArray *_contacts;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *_tabBar;
@property (nonatomic, retain) NSMutableArray *_contacts;

@end

