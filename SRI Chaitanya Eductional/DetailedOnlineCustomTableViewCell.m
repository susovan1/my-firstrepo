//
//  DetailedOnlineCustomTableViewCell.m
//  SRI Chaitanya Eductional
//
//  Created by Adeptpros on 7/6/15.
//  Copyright (c) 2015 adeptpros. All rights reserved.
//

#import "DetailedOnlineCustomTableViewCell.h"

@implementation DetailedOnlineCustomTableViewCell
@synthesize lbl_Subject,lbl_cross,lbl_pencil,lbl_minus,lbl_plus,lbl_tick,lbl_Score;

- (void)awakeFromNib
{
  lbl_cross.adjustsFontSizeToFitWidth=YES;
  lbl_minus.adjustsFontSizeToFitWidth=YES;
  lbl_Subject.adjustsFontSizeToFitWidth=YES;
  lbl_tick.adjustsFontSizeToFitWidth=YES;
  lbl_pencil.adjustsFontSizeToFitWidth=YES;
  lbl_plus.adjustsFontSizeToFitWidth=YES;

  lbl_Score.adjustsFontSizeToFitWidth=YES;

  
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
