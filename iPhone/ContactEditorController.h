//
//  ContactEditorController.h
//  iPhone JSON
//
//  Created by John Wang on 4/22/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HTTPRiot/HTTPRiot.h>

@interface ContactEditorController : UIViewController <HRResponseDelegate> {
	IBOutlet UITextField *_titleField;
	IBOutlet UITextField *_summaryField;
	IBOutlet UITextField *_bdayField;
	IBOutlet UITextField *_urlField;
	IBOutlet UITextField *_addrField;
	IBOutlet UITextField *_phoneField;
	IBOutlet UILabel *_infoLabel;
	
	NSMutableData *responseData;
	NSDictionary *_contact;
}

@property (nonatomic, retain) NSDictionary *_contact;

-(IBAction) hideKeyboard:(id)sender;
-(IBAction) backgroundClick:(id)sender;
@end
