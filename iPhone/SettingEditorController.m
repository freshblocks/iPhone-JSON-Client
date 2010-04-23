//
//  SettingEditorController.m
//  iPhone JSON
//
//  Created by John Wang on 4/22/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import "SettingEditorController.h"


@implementation SettingEditorController
@synthesize _setting, _textField;

- (void) cancel:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}

- (void) save:(id)sender {
	// save the setting to the NSUserDefaults
	if ([_setting isEqualToString:@"baseURL"]) {
		[[NSUserDefaults standardUserDefaults] setValue:[_textField text] forKey:@"baseURL"];
		[HRRestModel setBaseURL:[NSURL URLWithString:[_textField text]]];
	}
	else if ([_setting isEqualToString:@"path"]) {
		[[NSUserDefaults standardUserDefaults] setValue:[_textField text] forKey:@"path"];
	}
	
	[self.navigationController popViewControllerAnimated:YES];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = _setting;
	
	self.navigationItem.leftBarButtonItem =
	[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
												   target:self 
												   action:@selector(cancel:)] autorelease];
	
	self.navigationItem.rightBarButtonItem =
	[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
												   target:self 
												   action:@selector(save:)] autorelease];
	
	if ([_setting isEqualToString:@"baseURL"]) {
		_textField.text = [[NSUserDefaults standardUserDefaults]valueForKey:@"baseURL"];
	}
	else if ([_setting isEqualToString:@"path"]) {
		_textField.text = [[NSUserDefaults standardUserDefaults]valueForKey:@"path"];
	}
	
	
}

-(void)hideKeyboard:(id)sender {
	[sender resignFirstResponder];
}

-(void)backgroundClick:(id)sender {
	[_textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[_setting release];
	[_textField release];
    [super dealloc];
}

@end