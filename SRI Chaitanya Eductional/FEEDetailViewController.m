//
//  FEEDetailViewController.m
//  SRI Chaitanya Eductional
//
//  Created by susovan on 7/2/15.
//  Copyright (c) 2015 adeptpros. All rights reserved.
//

#import "FEEDetailViewController.h"
#import "CustomcellFeeDetails.h"
#import "ServiceEngine.h"
#import "DetailsViewController.h"
#import "Utility.h"
@interface FEEDetailViewController ()

@end

@implementation FEEDetailViewController

- (void)viewDidLoad
{
  self.window.backgroundColor=[UIColor clearColor];
  
    UIBarButtonItem *bar=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"Back-25(1).png"] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonAction:)];
    self.navigationItem.leftBarButtonItem=bar;
    
    [scroll1 setContentSize:(CGSizeMake(0,723))];
    
    [self.navigationItem setTitle:@"STUDENT DETAILS"];
    
    
    
    NSString *admin= [[NSUserDefaults standardUserDefaults]objectForKey:@"Admin"];
    
    NSString *jsonReQuest=[NSString stringWithFormat:@"admNo=%@;",admin];
    NSString *urlstr=[NSString stringWithFormat:@"http://202.153.37.44:9580/jsonServices/student/getStudentData;"];
    urlstr=[urlstr stringByAppendingString:jsonReQuest];
    
    NSString *encodedString = [urlstr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [[ServiceEngine CallService]setWebServiceDelegate:self];
    [[ServiceEngine CallService]PostService:encodedString body:nil context:nil authorization:nil httpMethod:HTTPMethod_POST];
    [Utility startActivityIndicatorOnView:self.view withText:@"Loading"];
    
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)backButtonAction:(UIBarButtonItem*)sende
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)backbutton:(id)sender;
{
    DetailsViewController *vi=[[DetailsViewController alloc]initWithNibName:@"DetailsViewController" bundle:nil];
    [self presentViewController:vi animated:YES completion:nil];
    
}

-(void)WebServiceRequestCompleted:(NSDictionary *)result context:(NSString *)context
{
    NSLog(@"%@",result);
    
    [Utility stopActivityIndicatorFromView:self.view];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithDictionary:[[result objectForKey:@"ns2.Student"] mutableCopy]];
    
    for(id obj in [dict allKeys])
    {
        id value = [NSString stringWithFormat:@"%@",[dict objectForKey:obj]];
        
        if([value isEqualToString:@"Null"])
        {
            [dict setObject:@"-" forKey:obj];
        }
        
    }
    
    campus.text=[NSString stringWithFormat:@"  %@",[dict objectForKey:@"campus"]];
    
    studebtname.text=[NSString stringWithFormat:@"  %@",[dict objectForKey:@"studentName"]];
    
    admnNo.text=[NSString stringWithFormat:@"  %@",[dict objectForKey:@"admNo"]];
    
    studyclass.text=[NSString stringWithFormat:@"  %@",[dict objectForKey:@"studyClass"]];
    
    coursetrack.text=[NSString stringWithFormat:@"  %@",[dict objectForKey:@"courseTrack"]];
    
    group.text=[NSString stringWithFormat:@"  %@",[dict objectForKey:@"group"]];
    
    section.text=[NSString stringWithFormat:@"  %@",[dict objectForKey:@"section"]];
    
    
    concessionfirstyear.text=[NSString stringWithFormat:@"₹  %@",[dict objectForKey:@"fyconcessionAmount"]];
    
    concessionseacondyear.text=[NSString stringWithFormat:@"₹  %@",[dict objectForKey:@"syconcessionAmount"]];
    if ([concessionseacondyear.text isEqualToString:@"₹  (null)"])
    {
        concessionseacondyear.text=@"₹ 0";
    }
    
    givenfirstyear.text=[NSString stringWithFormat:@"%@",[dict objectForKey:@"fyconcessionGivenBy"]];
    
    givenseacondyear.text=[NSString stringWithFormat:@"%@",[dict objectForKey:@"syconcessionGivenBy"]];
    
    if ([givenseacondyear.text isEqualToString:@"(null)"])
    {
        givenseacondyear.text=@"-";
    }
    
    reasonfirstyear.text=[NSString stringWithFormat:@"%@",[dict objectForKey:@"fyconcessionReason"]];
    
    reasonseacondyear.text=[NSString stringWithFormat:@"%@",[dict objectForKey:@"syconcessionReason"]];
    if ([reasonseacondyear.text isEqualToString:@"(null)"])
    {
        reasonseacondyear.text=@"-";
    }
    
    coursefeefirstyear.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"fycourseAmount"]];
    
    coursefeeseacondyear.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"sycourseAmount"]];
    if ([coursefeeseacondyear.text isEqualToString:@"₹ (null)"])
    {
        coursefeeseacondyear.text=@"₹ 0";
    }
    
    
    //   ₹₹₹₹₹
    
    concfeefirstyear.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"fyconcessionAmount"]];
    
    concfeeseacondyear.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"syconcessionAmount"]];
    if ([concfeeseacondyear.text isEqualToString:@"₹ (null)"])
    {
        concfeeseacondyear.text=@"₹ 0";
    }

    
    additfeefirstyear.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"fyAdditionalAmt"]];
    
    additfeeseacondyear.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"syAdditionalAmt"]];
    if ([additfeeseacondyear.text isEqualToString:@"₹ (null)"])
    {
        additfeeseacondyear.text=@"₹ 0";
    }

    
    lblfyNetFeeAmt.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"fyNetFeeAmt"]];
    
    lblsyNetFeeAmt.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"syNetFeeAmt"]];
    if ([lblsyNetFeeAmt.text isEqualToString:@"₹ (null)"])
    {
        lblsyNetFeeAmt.text=@"₹ 0";
    }
    
    lblfyfeepaid.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"fyfeepaid"]];
    
    lblsyfeepaid.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"syfeepaid"]];
    if ([lblsyfeepaid.text isEqualToString:@"₹ (null)"])
    {
        lblsyfeepaid.text=@"₹ 0";
    }
    
    lblfydeduction.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"fydeduction"]];
    
    lblsydeduction.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"sydeduction"]];
    if ([lblsydeduction.text isEqualToString:@"₹ (null)"])
    {
        lblsydeduction.text=@"₹ 0";
    }
    
    lblfyFeeRefundAmt.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"fyFeeRefundAmt"]];
    
    lblsyFeeRefundAmt.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"syFeeRefundAmt"]];
    if ([lblsyFeeRefundAmt.text isEqualToString:@"₹ (null)"])
    {
        lblsyFeeRefundAmt.text=@"₹ 0";
    }
    
    
    lblfyFeeDue.text=[NSString stringWithFormat:@"%@",[dict objectForKey:@"fyFeeDue"]];
    
    lblsyFeeDue.text=[NSString stringWithFormat:@"%@",[dict objectForKey:@"syFeeDue"]];
    
    
    lblfyexcess.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"fyexcess"]];
    if ([lblfyexcess.text isEqualToString:@"₹ (null)"])
    {
        lblfyexcess.text=@"₹ 0";
    }
    
    lblsyexcess.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"syexcess"]];
    if ([lblsyexcess.text isEqualToString:@"₹ (null)"])
    {
        lblsyexcess.text=@"₹ 0";
    }

    
    
    if ([[lblfyFeeDue text] intValue]<0)
        
    {
        NSString *str=lblfyFeeDue.text;

        lblfyFeeDue.text=[NSString stringWithFormat:@"₹ %d",0];
        
        str = [str stringByReplacingOccurrencesOfString:@"-"
                                             withString:@""];
        
        lblfyexcess.text=[NSString stringWithFormat:@"₹ %@",str];

    }
    else
    {
        lblfyFeeDue.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"fyFeeDue"]];
        
        if ([lblfyFeeDue.text isEqualToString:@"₹ (null)"])
        {
            lblfyFeeDue.text=@"₹ 0";
        }
        
    }
    
    if ([[lblsyFeeDue text] intValue]<0)
        
    {
        NSString *str=lblsyFeeDue.text;

        lblsyFeeDue.text=[NSString stringWithFormat:@"₹ %d",0];
        
        str = [str stringByReplacingOccurrencesOfString:@"-"
                                             withString:@""];
        
        lblsyexcess.text=[NSString stringWithFormat:@"₹ %@",str];

    }
    else
    {
        lblsyFeeDue.text=[NSString stringWithFormat:@"₹ %@",[dict objectForKey:@"syFeeDue"]];
        
        if ([lblsyFeeDue.text isEqualToString:@"₹ (null)"])
        {
            lblsyFeeDue.text=@"₹ 0";
        }
        
        
        

    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
