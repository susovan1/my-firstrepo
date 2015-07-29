//
//  DetailedOfflineMarksCustomCell.m
//  SRI Chaitanya Eductional
//
//  Created by Adeptpros on 7/7/15.
//  Copyright (c) 2015 adeptpros. All rights reserved.
//

#import "DetailedOfflineMarksCustomCell.h"

@implementation DetailedOfflineMarksCustomCell
@synthesize lbl_Marks,lbl_Rank,lbl_Subject,lbl_Testmode;

- (void)awakeFromNib {
  
  lbl_Marks.adjustsFontSizeToFitWidth=YES;

  lbl_Testmode.adjustsFontSizeToFitWidth=YES;
  lbl_Rank.adjustsFontSizeToFitWidth=YES;
  lbl_Subject.adjustsFontSizeToFitWidth=YES;

    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
