//
//  AppDelegate_Phone.h
//  iPhone JSON
//
//  Created by John Wang on 4/8/10.
//  Copyright Fresh Blocks 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <JSON/JSON.h>
#import "DisplayJSON.h"
#import <HTTPRiot/HTTPRiot.h>

@interface AppDelegate_Phone : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	DisplayJSON *displayView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

