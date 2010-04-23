//
//  DeleteController.m
//  iPhone JSON
//
//  Created by John Wang on 4/21/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import "DeleteController.h"
#import "AppDelegate_Phone.h"

@implementation DeleteController

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	self.title = @"Delete";
	self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh 
																							target:self 
																							action:@selector(goAppEngine:)] autorelease];
	[self.tableView setEditing:YES animated:NO];
}

- (void)viewWillAppear:(BOOL)animated {
	[HRRestModel setDelegate:self];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[Contacts sharedContacts]._contacts count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	NSDictionary *contact = [[Contacts sharedContacts]._contacts objectAtIndex:[indexPath row]];
	for (id key in contact) {
		cell.textLabel.text = [contact objectForKey:@"title"];
		cell.detailTextLabel.text = [contact objectForKey:@"summary"];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

	}
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	NSDictionary *selectedContact = [[Contacts sharedContacts]._contacts objectAtIndex:[indexPath row]];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
		// RESTful Delete
		NSString *deletePath = [NSString stringWithFormat:@"%@/%d",
								[[NSUserDefaults standardUserDefaults] valueForKey:@"path"],
								[[selectedContact valueForKey:@"id"] intValue]];

		[HRRestModel deletePath:deletePath withOptions:nil object:nil];
		
		[[Contacts sharedContacts]._contacts removeObjectAtIndex:[indexPath row]];
		
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
		[self.tableView reloadData];
    }   
    
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
}

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc {
	[super dealloc];
}

- (void)goAppEngine:(id)sender {
	UIApplication* app = [UIApplication sharedApplication]; 
	app.networkActivityIndicatorVisible = YES; // to stop it, set this to NO 
	[HRRestModel getPath:[NSString stringWithFormat:@"%@.json",[[NSUserDefaults standardUserDefaults] valueForKey:@"path"]] withOptions:nil object:nil];
}

#pragma mark HRResponseDelegate Methods
- (void)restConnection:(NSURLConnection *)connection didReturnResource:(id)resource object:(id)object {
	//NSLog(@"didReturnResource");
	UIApplication* app = [UIApplication sharedApplication]; 
	app.networkActivityIndicatorVisible = NO;  

	NSError *error;
	
	[Contacts sharedContacts]._contacts = [resource retain];
	if ([Contacts sharedContacts]._contacts == nil)
		NSLog(@"Error Parsing JSON: %@",[error localizedDescription]);
	
	[self.tableView reloadData];
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

@end