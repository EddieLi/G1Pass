//
//  G1CHSignViewController.m
//  G1Pass
//
//  Created by Eddie on 2012-12-15.
//  Copyright (c) 2012 Eddie. All rights reserved.
//

#import "G1CHSignViewController.h"
#import "CHSignTableCell.h"

@implementation G1CHSignViewController{
    
    NSArray *sign;
    NSArray *detail;
}

- (void)viewDidLoad
{
    
	// Do any additional setup after loading the view, typically from a nib.
    
    // Find out the path of recipes.plist
    NSString *picPath = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    NSString *answerPath = [[NSBundle mainBundle] pathForResource:@"CHQuestions" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:picPath];
    sign = [dict objectForKey:@"Signs"];
    NSDictionary *answerDict = [[NSDictionary alloc] initWithContentsOfFile:answerPath];
    detail = [answerDict objectForKey:@"Sanswers"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [detail count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CHSignTableCell";
    
    CHSignTableCell *cell = (CHSignTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CHSignTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.CHDetailLabel.text = [[detail objectAtIndex:indexPath.row] lowercaseString];
    cell.CHImageLabel.image = [UIImage imageNamed:[sign objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Use the method that you would have created above to get the cell.
    // Any other method seems to result in infinite recursion like you said.
    CHSignTableCell *cell = (CHSignTableCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
	
	NSString *text = cell.CHDetailLabel.text; //[[menuList objectAtIndex:indexPath.row] objectForKey:@\"status\"];
	CGFloat height = [text sizeWithFont:cell.CHDetailLabel.font constrainedToSize:CGSizeMake(240,70) lineBreakMode:NSLineBreakByWordWrapping].height;
	//return MAX(height, MinHeight);
	
	return height+130;
}

@end

