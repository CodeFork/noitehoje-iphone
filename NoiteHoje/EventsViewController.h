//
//  EventsViewController.h
//  Noite Hoje
//
//  Created by felipe on 8/12/12.
//  Copyright (c) 2012 Noite Hoje. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UITableView.h>
#import "NoiteHojeViewController.h"

@interface EventsViewController : NoiteHojeViewController<UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate>

@property (nonatomic, strong) NSMutableArray *events;
@property (weak, nonatomic) IBOutlet UITableView *eventsTableView;

- (IBAction)addButtonTapped:(id)sender;
@end
