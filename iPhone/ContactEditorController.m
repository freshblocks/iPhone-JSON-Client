    //
//  ContactEditorController.m
//  iPhone JSON
//
//  Created by John Wang on 4/22/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import "ContactEditorController.h"


@implementation ContactEditorController
@synthesize _contact;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = [_contact objectForKey:@"title"];
	self.navigationItem.rightBarButtonItem =
	[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
									 target:self 
									 action:@selector(goAppEngine:)] autorelease];
	
	_infoLabel.text = [NSString stringWithFormat:@"Editing contact id: %d",[(NSDecimalNumber *)[_contact objectForKey:@"id"] stringValue]];
	_titleField.text = [_contact objectForKey:@"title"];
	_addrField.text = [_contact objectForKey:@"address"];
	_urlField.text = [_contact objectForKey:@"url"];
	_phoneField.text = [_contact objectForKey:@"phone"];
	_bdayField.text = [_contact objectForKey:@"birthday"];
	_summaryField.text = [_contact objectForKey:@"summary"];

}

- (void)viewWillAppear:(BOOL)animated {
	[HRRestModel setDelegate:self];
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
    [super dealloc];
}

-(void)hideKeyboard:(id)sender {
	[sender resignFirstResponder];
}

-(void)backgroundClick:(id)sender {
	[_contact release];
	[_titleField resignFirstResponder];
	[_summaryField resignFirstResponder];
	[_urlField resignFirstResponder];
	[_addrField resignFirstResponder];
	[_bdayField resignFirstResponder];
	[_phoneField resignFirstResponder];
}

@end