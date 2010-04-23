//
//  SettingsController.m
//  iPhone JSON
//
//  Created by John Wang on 4/21/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import "SettingsController.h"


@implementation SettingsController
@synthesize _baseURL, _path, _format;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	self.title = @"Settings";
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	self._baseURL = [[NSUserDefaults standardUserDefaults] stringForKey:@"baseURL"];
	self._path = [[NSUserDefaults standardUserDefaults] stringForKey:@"path"];
	//self._format = [[NSUserDefaults standardUserDefaults] stringForKey:@"format"];
	[self.tableView reloadData];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 2;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
	if ([indexPath section] == 0) {
		if ([indexPath row] == 0) {
			cell.textLabel.text = @"baseURL";
			cell.detailTextLabel.text = _baseURL;
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		}
		else if([indexPath row] == 1) {
			cell.textLabel.text = @"path";
			cell.detailTextLabel.text = _path;
			cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		}
	}
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	
	 SettingEditorController *detailViewController = [[SettingEditorController alloc] initWithNibName:@"SettingEditorView" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 if ([indexPath row] == 0) {
		 detailViewController._setting = @"baseURL";
	 }
	 else if ([indexPath row] == 1) {
		 detailViewController._setting = @"path";
	 }

	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 
	
	
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
	[_format release];
	[_baseURL release];
	[_path release];
    [super dealloc];
}

@end