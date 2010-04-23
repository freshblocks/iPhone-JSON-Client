//
//  PostController.h
//  iPhone JSON
//
//  Created by John Wang on 4/21/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HTTPRiot/HTTPRiot.h>
#import <HTTPRiot/HRResponseDelegate.h>

@interface PostController : UIViewController <HRResponseDelegate, UIAlertViewDelegate> {
	IBOutlet UITextField *_titleField;
	IBOutlet UITextField *_summaryField;
	IBOutlet UITextField *_bdayField;
	IBOutlet UITextField *_urlField;
	IBOutlet UITextField *_addrField;
	IBOutlet UITextField *_phoneField;
	NSMutableData *responseData;
}

-(IBAction) hideKeyboard:(id)sender;
-(IBAction) backgroundClick:(id)sender;

@end
