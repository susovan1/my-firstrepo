//
//  OfflineMarksCustomCell.m
//  SRI Chaitanya Eductional
//
//  Created by Adeptpros on 7/7/15.
//  Copyright (c) 2015 adeptpros. All rights reserved.
//

#import "OfflineMarksCustomCell.h"

@implementation OfflineMarksCustomCell
@synthesize lbl_Rank,lbl_Subject,lbl_Testcode,lbl_Testdt,lbl_Testmode,lbl_Marks;
- (void)awakeFromNib {
  
  lbl_Marks.adjustsFontSizeToFitWidth=YES;
  lbl_Rank.adjustsFontSizeToFitWidth=YES;
  lbl_Testcode.adjustsFontSizeToFitWidth=YES;
  lbl_Testdt.adjustsFontSizeToFitWidth=YES;
  lbl_Testmode.adjustsFontSizeToFitWidth=YES;
  lbl_Subject.adjustsFontSizeToFitWidth=YES;
  
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
