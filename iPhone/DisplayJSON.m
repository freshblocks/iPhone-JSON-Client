//
//  DisplayJSON.m
//  iPhone JSON
//
//  Created by John Wang on 4/10/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import "DisplayJSON.h"


@implementation DisplayJSON
@synthesize method, _jsonActivity, _jsonProgress, _jsonDetails;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

-(void)hideKeyboard:(id)sender {
	[sender resignFirstResponder];
}
-(void)backgroundClick:(id)sender {
	[_idField resignFirstResponder];
	[_titleField resignFirstResponder];
	[_summaryField resignFirstResponder];
	[_urlField resignFirstResponder];
	[_addrField resignFirstResponder];
	[_bdayField resignFirstResponder];
	[_phoneField resignFirstResponder];
}
/*
 GET    /items        #=> index
 GET    /items/1      #=> show
 GET    /items/new    #=> new
 GET    /items/1/edit #=> edit
 PUT    /items/1      #=> update
 POST   /items        #=> create
 DELETE /items/1      #=> destroy

 */

- (void)goAppEngine:(id)sender {
	UIApplication* app = [UIApplication sharedApplication]; app.networkActivityIndicatorVisible = YES; // to stop it, set this to NO 
	responseData = [[NSMutableData data] retain];
	//NSString *requestURL = @"http://www.iphone-json.appspot.com/contacts.json";
	
	//NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURL]];

	
	
	// if PUT
	if ([method isEqualToString:@"PUT"]) {
		//requestURL = [NSString stringWithFormat:@"http://www.iphone-json.appspot.com/contacts/%@.json",_idField.text];
		
		NSDictionary *requestData = [NSDictionary dictionaryWithObjectsAndKeys:
									 _titleField.text, @"title",
									 _summaryField.text, @"summary",
									 _urlField.text, @"url",
									 _phoneField.text, @"phone",
									 _bdayField.text, @"birthday",
									 _addrField.text, @"address",
									 nil];
		NSString* jsonString = [requestData JSONRepresentation];
		NSLog(@"generated JSON:");
		NSLog(@"%@", jsonString);
		NSLog(@"length: %d",[jsonString length]);

		NSLog(@"updating: %@",_idField.text);
		NSLog(@"%@",[NSString stringWithFormat:@"/contacts/%@",_idField.text]);
		//NSDictionary *opts = [NSDictionary dictionaryWithObject:[requestData JSONRepresentation] forKey:@"body"];
		NSDictionary *opts = [NSDictionary dictionaryWithObject:@"{\"contact\": {\"address\":\"addr\",\"title\":\"test2\",\"url\":\"url\",\"summary\":\"summ\",\"phone\":\"phone number\",\"birthday\":\"2010-04-09\"}}" forKey:@"body"];
		[HRRestModel putPath:[NSString stringWithFormat:@"/contacts/%@",_idField.text] withOptions:opts object:nil];
		
	}
	// if POST
	else if ([method isEqualToString:@"POST"]) {
		//requestURL = @"http://www.iphone-json.appspot.com/contacts.json";
		NSDictionary *requestData = [NSDictionary dictionaryWithObjectsAndKeys:
									 _titleField.text, @"title",
									 _summaryField.text, @"summary",
									 _urlField.text, @"url",
									 _phoneField.text, @"phone",
									 _bdayField.text, @"birthday",
									 _addrField.text, @"address",
									 nil];
		//NSDictionary *finalData = [NSDictionary dictionaryWithObject:requestData forKey:@"Contact"];
		NSArray *finalData = [NSArray arrayWithObject:requestData];
		NSString* jsonString = [finalData JSONRepresentation]; //JSONRepresentation
		// {"firstname" : "Joe" , "lastname" : "Bloggs"}
		//	vs
		// { "Person" : {"firstname" : "Joe" , "lastname" : "Bloggs"} }
		NSLog(@"generated JSON:");
		NSLog(@"%@", jsonString);
		NSLog(@"length: %d",[jsonString length]);
		//[request setValue:[NSString stringWithFormat:@"%d",[jsonString length]] forHTTPHeaderField:@"Content-Length"];
		//[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"]; // application/x-www-form-urlencoded
		//[request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
		
		
		//NSDictionary *options = [NSDictionary dictionaryWithObject:[finalData JSONRepresentation] forKey:@"body"];
		NSDictionary *options = [NSDictionary dictionaryWithObject:@"{\"contact\": {\"address\":\"addr\",\"title\":\"test2\",\"url\":\"url\",\"summary\":\"summ\",\"phone\":\"phone number\",\"birthday\":\"2010-04-09\"}}" forKey:@"body"];
		//NSDictionary *options = [NSDictionary dictionaryWithObject:@"{\"address\":\"addr\",\"title\":\"test2\",\"url\":\"url\",\"summary\":\"summ\",\"phone\":\"phone number\",\"birthday\":\"\"}" forKey:@"body"];
		[HRRestModel postPath:@"/contacts" withOptions:options object:nil];


		
	}
	// if DELETE
	else if ([method isEqualToString:@"DELETE"]) {
		//requestURL = @"http://www.iphone-json.appspot.com/contacts.json";
		//[HRRestModel deletePath:[NSString stringWithFormat:@"person/delete/%@", [person valueForKey:@"id"]] withOptions:nil object:nil];
		[HRRestModel deletePath:@"/contacts/3" withOptions:nil object:nil];

	}
	// else do GET
	else {
		//requestURL = @"http://www.iphone-json.appspot.com/contacts.json";
		[HRRestModel getPath:@"/contacts.json" withOptions:nil object:nil];
		//[HRRestModel getPath:@"/people" withOptions:nil object:self];
		// if the id field is empty show a count of contacts in database
		
		// else get the contact
		
		//[request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
		//[request setHTTPBodyStream:self.fileStream];
		//NSNumber *contentLength = (NSNumber *) [[[NSFileManager defaultManager] attributesOfItemAtPath:@"2.json" error:NULL] objectForKey:NSFileSize];
		//[request setValue:[contentLength description] forHTTPHeaderField:@"Content-Length"];
		//NSLog(@"2.json size: %d",contentLength);
		
	}
	//Content-Type: text/plain
	//application/json
	
	//  the /contacts.json url should return a dictionary with dictionary of contacts. something's wrong over there
	//[request setHTTPMethod:method];
	
	//[[NSURLConnection alloc] initWithRequest:request delegate:self];
	//[request setHTTPMethod:method];
	//NSLog(@"request: %@",[request HTTPMethod]);
	
	[self._jsonActivity setHidden:NO];
	[self._jsonActivity startAnimating];
	
	
}

- (void)changeMethod:(id)sender {

	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
	NSLog(@"changeMethod: selected segment = %@", [segmentedControl titleForSegmentAtIndex: [segmentedControl selectedSegmentIndex]]);
	method = [segmentedControl titleForSegmentAtIndex: [segmentedControl selectedSegmentIndex]];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	method = @"GET";
	[HRRestModel setDelegate:self];
	//[urlMethod retain];
	//NSLog(@"retain: %d",[urlMethod retainCount]);

}

#pragma mark NSURLConnection methods
/*
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	NSLog(@"didReceiveResponse");
	NSLog(@"%@",response);
	[responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	NSLog(@"didReceiveData");
	NSLog(@"%@",data);
	// Store incoming data into a string
	//NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	
	// Create a dictionary from the JSON string
	//NSDictionary *results = [jsonString JSONValue];
	//NSLog(@"count: %d", [results count]);
	//NSLog(@"data: %@",results);
	[responseData appendData:data];
	//NSLog(@"data is: %@",data);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	NSLog(@"didFailWithError");
	//label.text = [NSString stringWithFormat:@"Connection failed: %@", [error description]];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[connection release];
	[self._jsonActivity stopAnimating];
	[self._jsonActivity setHidden:YES];
	NSLog(@"didFinishLoading");
	UIApplication* app = [UIApplication sharedApplication]; app.networkActivityIndicatorVisible = NO; // to stop it, set this to NO 
	NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
	[responseData release];
	NSLog(@"response: %@",responseString);
	NSError *error;
	
	// Create a dictionary from the JSON string
	//NSDictionary *parsedJSON = [responseString JSONValue];

	
	SBJSON *json = [[SBJSON new] autorelease];
	//NSArray *luckyNumbers = [json objectWithString:responseString error:&error];
	NSArray *parsedJSON = [json objectWithString:responseString error:&error];
	//NSLog(@"dictionary: %@",parsedJSON);
	//NSDictionary *results = [responseString JSONValue];
	//NSLog(@"results: %@",results);
	
	//NSLog(@"response: %@",responseString);
	[responseString release];
	//NSLog(@"count1: %d with count2: %d",[results count], [parsedJSON count]);
	
	if (parsedJSON == nil)
		_jsonDetails.text = [NSString stringWithFormat:@"JSON parsing failed: %@", [error localizedDescription]];
	else {
		//NSMutableString *text = [NSMutableString stringWithString:@"json:\n"];
		

		NSDictionary *contact = [parsedJSON objectAtIndex:0];
		for (id key in contact) {
			NSLog(@"key: %@, value: %@", key, [contact objectForKey:key]);
		}
		_jsonDetails.text =  [contact objectForKey:@"title"];
		_titleField.text = [contact objectForKey:@"title"];
		_idField.text = [(NSDecimalNumber *)[contact objectForKey:@"id"] stringValue];
		_addrField.text = [contact objectForKey:@"address"];
		_urlField.text = [contact objectForKey:@"url"];
		_phoneField.text = [contact objectForKey:@"phone"];
		_bdayField.text = [contact objectForKey:@"birthday"];
		_summaryField.text = [contact objectForKey:@"summary"];
		
	}
}
*/

#pragma mark HRResponseDelegate Methods
- (void)restConnection:(NSURLConnection *)connection didReturnResource:(id)resource object:(id)object {
    /*if(_isDeleting) {
        //[_people removeObjectAtIndex:_indexPathOfItemToDelete.row];
        //[self.tableView beginUpdates];
        //[self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:_indexPathOfItemToDelete, nil] withRowAnimation:YES];
        //[self.tableView endUpdates];
        //[self.tableView reloadData];
        _isDeleting = false;
        _indexPathOfItemToDelete = nil;
    } else {
        [_people removeAllObjects];
        [_people addObjectsFromArray:resource];
        [self.tableView reloadData];
    }*/
	
	[self._jsonActivity stopAnimating];
	[self._jsonActivity setHidden:YES];
	NSLog(@"didReturnResource");
	UIApplication* app = [UIApplication sharedApplication]; app.networkActivityIndicatorVisible = NO; // to stop it, set this to NO 
	NSLog(@"%@",resource);
	//NSString *responseString = [[NSString alloc] initWithData:[(NSArray *)resource objectAtIndex:0] encoding:NSUTF8StringEncoding];
	
	//NSLog(@"response: %@",responseString);
	NSError *error;
	
	// Create a dictionary from the JSON string
	//NSDictionary *parsedJSON = [responseString JSONValue];
	
	
	//SBJSON *json = [[SBJSON new] autorelease];
	//NSArray *luckyNumbers = [json objectWithString:responseString error:&error];
	NSArray *parsedJSON = resource;//[json objectWithString:responseString error:&error];
	//NSLog(@"dictionary: %@",parsedJSON);
	//NSDictionary *results = [responseString JSONValue];
	//NSLog(@"results: %@",results);
	
	//NSLog(@"response: %@",responseString);
	//[responseString release];
	//NSLog(@"count1: %d with count2: %d",[results count], [parsedJSON count]);
	
	if (parsedJSON == nil)
		_jsonDetails.text = [NSString stringWithFormat:@"JSON parsing failed: %@", [error localizedDescription]];
	else {
		//NSMutableString *text = [NSMutableString stringWithString:@"json:\n"];
		
		
		NSDictionary *contact = [parsedJSON objectAtIndex:0];
		for (id key in contact) {
			NSLog(@"key: %@, value: %@", key, [contact objectForKey:key]);
		}
		_jsonDetails.text =  [contact objectForKey:@"title"];
		_titleField.text = [contact objectForKey:@"title"];
		_idField.text = [(NSDecimalNumber *)[contact objectForKey:@"id"] stringValue];
		_addrField.text = [contact objectForKey:@"address"];
		_urlField.text = [contact objectForKey:@"url"];
		_phoneField.text = [contact objectForKey:@"phone"];
		_bdayField.text = [contact objectForKey:@"birthday"];
		_summaryField.text = [contact objectForKey:@"summary"];
		
	}
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
    NSLog(@"RESPONSE STATUS WAS:%i", [response statusCode]);

	
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	[_jsonDetails release];
	[_jsonActivity release];
	[_jsonProgress release];
	
    [super dealloc];
}


@end
