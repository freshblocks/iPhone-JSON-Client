//
//  SettingsController.h
//  iPhone JSON
//
//  Created by John Wang on 4/21/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingEditorController.h"

@interface SettingsController : UITableViewController {
	NSString *_baseURL;
	NSString *_path;
	NSString *_format;
	
}

@property (nonatomic, retain) NSString *_baseURL;
@property (nonatomic, retain) NSString *_path;
@property (nonatomic, retain) NSString *_format;

@end
