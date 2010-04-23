//
//  ContactController.h
//  iPhone JSON
//
//  Created by John Wang on 4/22/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ContactController : UITableViewController {
	NSDictionary *_contact;	
}

@property (nonatomic, retain) NSDictionary *_contact;

@end
