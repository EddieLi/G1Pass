//
//  SignTableCell.m
//  G1Pass
//
//  Created by Eddie on 2012-12-08.
//  Copyright (c) 2012 Eddie. All rights reserved.
//

#import "SignTableCell.h"

@implementation SignTableCell

@synthesize imageLabel = _imageLabel;
@synthesize detailLabel = _detailLabel;

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
