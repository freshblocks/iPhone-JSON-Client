//
//  Contacts.h
//  iPhone JSON
//
//  Created by John Wang on 4/22/10.
//  Copyright 2010 Fresh Blocks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SynthesizeSingleton.h"

@interface Contacts : NSObject {
	NSMutableArray *_contacts;
}

@property (nonatomic, retain) NSMutableArray *_contacts;

+ (Contacts *)sharedContacts;

@end
