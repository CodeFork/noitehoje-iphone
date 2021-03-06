//
//  EventDetailsViewController.h
//  NoiteHoje-v2
//
//  Created by Felipe Lima on 10/26/12.
//  Copyright (c) 2012 Noite Hoje. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"
#import "NoiteHojeViewController.h"

@interface EventDetailsViewController : NoiteHojeViewController

@property (strong, nonatomic) IBOutlet UITableView *detailsTableView;
@property (nonatomic, retain) Event *event;
@property (weak, nonatomic) IBOutlet UIImageView *flyerImageView;
@property (weak, nonatomic) IBOutlet UILabel *eventDateLabel;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UILabel *eventTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *eventVenueLabel;
@property (weak, nonatomic) IBOutlet UIView *eventDateBackground;
@property (weak, nonatomic) IBOutlet UIView *eventInfoBackground;
@property (weak, nonatomic) IBOutlet UIWebView *eventDescriptionWebView;

- (IBAction)sendButtonTapped:(id)sender;

@end
