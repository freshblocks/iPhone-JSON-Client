//
//  PostController.m
//  iPhone JSON
//
//  Created by John Wang on 4/21/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import "PostController.h"


@implementation PostController


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Post";
	
	self.navigationItem.rightBarButtonItem =
	[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
												   target:self 
												   action:@selector(goAppEngine:)] autorelease];
}

- (void)viewWillAppear:(BOOL)animated {
	[HRRestModel setDelegate:self];
}

-(void)hideKeyboard:(id)sender {
	[sender resignFirstResponder];
}

-(void)backgroundClick:(id)sender {
	[_titleField resignFirstResponder];
	[_summaryField resignFirstResponder];
	[_urlField resignFirstResponder];
	[_addrField resignFirstResponder];
	[_bdayField resignFirstResponder];
	[_phoneField resignFirstResponder];
}


- (void)dealloc {
    [super dealloc];
}
- (void)goAppEngine:(id)sender {
	UIApplication* app = [UIApplication sharedApplication]; 
	app.networkActivityIndicatorVisible = YES; // to stop it, set this to NO 
	responseData = [[NSMutableData data] retain];

	NSDictionary *requestData = [NSDictionary dictionaryWithObjectsAndKeys:
									 _titleField.text, @"title",
									 _summaryField.text, @"summary",
									 _urlField.text, @"url",
									 _phoneField.text, @"phone",
									 _bdayField.text, @"birthday",
									 _addrField.text, @"address",
									 nil];
	NSDictionary *finalData = [NSDictionary dictionaryWithObject:requestData forKey:@"contact"];
		
	NSDictionary *options = [NSDictionary dictionaryWithObject:[finalData JSONRepresentation] forKey:@"body"];
	[HRRestModel postPath:[[NSUserDefaults standardUserDefaults] valueForKey:@"path"] withOptions:options object:nil];

}

#pragma mark HRResponseDelegate Methods
- (void)restConnection:(NSURLConnection *)connection didReturnResource:(id)resource object:(id)object {
	//NSLog(@"didReturnResource");
	UIApplication* app = [UIApplication sharedApplication]; 
	app.networkActivityIndicatorVisible = NO; // to stop it, set this to NO 
	
	NSError *error;
	
	NSArray *parsedJSON = resource;	
	if (parsedJSON == nil)
		NSLog(@"JSON Parsing Error: %@",[NSString stringWithFormat:@"JSON parsing failed: %@", [error localizedDescription]]);

}

- (void)restConnection:(NSURLConnection *)connection didFailWithError:(NSError *)error object:(id)object { 
    /*if([error code] == -1004)
	 ISAAlertWithMessage([NSString stringWithFormat:@"%@: Start the test server `ruby Source/Tests/Server/testserver.rb`", [error localizedDescription]]);
	 */
	NSLog(@"failed with error %@", [error code]);
	NSLog(@"%@",[error localizedDescription]);
}

- (void)restConnection:(NSURLConnection *)connection didReceiveParseError:(NSError *)error responseBody:(NSString *)body object:(id)object {
	/*
	 ISAAlertWithMessage([error localizedDescription]);
	 */
	NSLog(@"parse error");
	NSLog(@"%@",[error localizedDescription]);
}

- (void)restConnection:(NSURLConnection *)connection didReceiveError:(NSError *)error response:(NSHTTPURLResponse *)response object:(id)object {
    //ISAAlertWithMessage([error localizedDescription]);
	NSLog(@"did receive error");
	NSLog(@"%@",[error localizedDescription]);
}

- (void)restConnection:(NSURLConnection *)connection didReceiveResponse:(NSHTTPURLResponse *)response object:(id)object {
    //NSLog(@"RESPONSE STATUS WAS:%i", [response statusCode]);
	// open an alert with just an OK button
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Response" message:[NSString stringWithFormat:@"Reponse Status:%i", [response statusCode]]
												   delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];    
    [alert release];
	
}


@end
