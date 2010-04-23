//
//  SettingEditorController.h
//  iPhone JSON
//
//  Created by John Wang on 4/22/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HTTPRiot/HTTPRiot.h>

@interface SettingEditorController : UIViewController {
	NSString *_setting;
	UITextField *_textField;

}
@property (nonatomic, retain) NSString *_setting;
@property (nonatomic, retain) IBOutlet UITextField *_textField;

-(IBAction) hideKeyboard:(id)sender;
-(IBAction) backgroundClick:(id)sender;

@end
