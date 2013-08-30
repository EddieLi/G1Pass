//
//  G1SignViewController.m
//  G1Pass
//
//  Created by Eddie on 2012-12-08.
//  Copyright (c) 2012 Eddie. All rights reserved.
//
#import "G1SignViewController.h"
#import "SignTableCell.h"

@implementation G1SignViewController{
    
    NSArray *sign;
    NSArray *detail;
}

- (void)viewDidLoad
{
    
	// Do any additional setup after loading the view, typically from a nib.
    
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    sign = [dict objectForKey:@"Signs"];
    detail = [dict objectForKey:@"Sanswers"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [detail count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SignTableCell";
    
    SignTableCell *cell = (SignTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SignTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.detailLabel.text = [[detail objectAtIndex:indexPath.row] lowercaseString];
    cell.imageLabel.image = [UIImage imageNamed:[sign objectAtIndex:indexPath.row]];
    
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
    SignTableCell *cell = (SignTableCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
	
	NSString *text = cell.detailLabel.text; //[[menuList objectAtIndex:indexPath.row] objectForKey:@\"status\"];
	CGFloat height = [text sizeWithFont:cell.detailLabel.font constrainedToSize:CGSizeMake(240,70) lineBreakMode:NSLineBreakByWordWrapping].height;
	//return MAX(height, MinHeight);
	
	return height+130;
}

@end
