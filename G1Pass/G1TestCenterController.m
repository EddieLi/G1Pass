//
//  G1TestCenterController.m
//  G1Pass
//
//  Created by Eddie on 2012-12-09.
//  Copyright (c) 2012 Eddie. All rights reserved.
//

#import "G1TestCenterController.h"
#import "TestCenterTableCell.h"

@implementation G1TestCenterController{
    
    NSArray *district;
    NSArray *address;
    NSArray *hours;
}

- (void)viewDidLoad
{
    
	// Do any additional setup after loading the view, typically from a nib.
    
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    district = [dict objectForKey:@"District"];
    address = [dict objectForKey:@"Street"];
    hours = [dict objectForKey: @"Hour"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [district count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"TestCenters";
    
    TestCenterTableCell *cell = (TestCenterTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TestCenters" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.district.text = [district objectAtIndex:indexPath.row];
    cell.address.text = [address objectAtIndex:indexPath.row];
    cell.hours.text = [hours objectAtIndex:indexPath.row];
    
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
    TestCenterTableCell *cell = (TestCenterTableCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
	
	NSString *text = cell.address.text; //[[menuList objectAtIndex:indexPath.row] objectForKey:@\"status\"];
	CGFloat height = [text sizeWithFont:cell.address.font constrainedToSize:CGSizeMake(240,70) lineBreakMode:NSLineBreakByWordWrapping].height;
	//return MAX(height, MinHeight);
	
	return height+130;
}

@end
