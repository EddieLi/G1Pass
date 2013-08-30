//
//  TestCenterTableCell.m
//  G1Pass
//
//  Created by Eddie on 2012-12-09.
//  Copyright (c) 2012 Eddie. All rights reserved.
//

#import "TestCenterTableCell.h"

@implementation TestCenterTableCell

@synthesize district=_district;
@synthesize address = _address;
@synthesize hours = _hours;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
