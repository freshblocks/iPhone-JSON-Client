//
//  DisplayJSON.h
//  iPhone JSON
//
//  Created by John Wang on 4/10/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <HTTPRiot/HTTPRiot.h>
#import <HTTPRiot/HRResponseDelegate.h>
//#import <JSON/JSON.h>

@interface DisplayJSON : UIViewController <HRResponseDelegate> {
	NSMutableData *responseData;
	NSString *method;
	IBOutlet UITextField *_idField;
	IBOutlet UITextField *_titleField;
	IBOutlet UITextField *_summaryField;
	IBOutlet UITextField *_bdayField;
	IBOutlet UITextField *_urlField;
	IBOutlet UITextField *_addrField;
	IBOutlet UITextField *_phoneField;
	IBOutlet UIProgressView *_jsonProgress;
	IBOutlet UIActivityIndicatorView *_jsonActivity;
	IBOutlet UILabel *_jsonDetails;
}

@property (nonatomic, retain) NSString *method;
@property (nonatomic, retain) UILabel *_jsonDetails;
@property (nonatomic, retain) UIProgressView *_jsonProgress;
@property (nonatomic, retain) UIActivityIndicatorView *_jsonActivity;

-(IBAction) goAppEngine:(id)sender;
-(IBAction) changeMethod:(id)sender;
-(IBAction) hideKeyboard:(id)sender;
-(IBAction)backgroundClick:(id)sender;

@end
