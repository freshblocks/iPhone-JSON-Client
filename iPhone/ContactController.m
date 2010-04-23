//
//  ContactController.m
//  iPhone JSON
//
//  Created by John Wang on 4/22/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import "ContactController.h"


@implementation ContactController
@synthesize _contact;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = [_contact objectForKey:@"title"];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_contact count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	id key = [[_contact allKeys] objectAtIndex:[indexPath row]];
	cell.textLabel.text = key;
	if ([cell.textLabel.text isEqualToString:@"id"] ) {
		cell.detailTextLabel.text = [[_contact objectForKey:key] stringValue];
	}
	else {
		cell.detailTextLabel.text = [_contact objectForKey:key];
	}
	cell.textLabel.adjustsFontSizeToFitWidth = YES;
	cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
    return cell;
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
	[_contact release];
    [super dealloc];
}


@end

