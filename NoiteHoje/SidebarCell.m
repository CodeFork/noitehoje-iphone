//
//  SidebarCell.m
//  NoiteHoje-v2
//
//  Created by Felipe Lima on 11/17/12.
//  Copyright (c) 2012 Noite Hoje. All rights reserved.
//

#import "SidebarCell.h"
#import "UIColor+Extensions.h"

@implementation SidebarCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, self.frame.size.width - 20, 40)];
        [self addSubview:self.label];
        self.backgroundColor = [UIColor colorWithHex:0x211121];
        
        UIView *lineView = lineView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, self.contentView.bounds.size.height - 2.0f, self.contentView.bounds.size.width, 1.0f)];
                                       
        lineView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        lineView.backgroundColor = [UIColor colorWithHex:0x020102];

        [self addSubview:lineView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    self.label.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:16];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.textColor = [UIColor colorWithHex:0xc2acc2];
}

@end