//
//  G1CHPassViewController.m
//  G1Pass
//
//  Created by Eddie on 2012-12-15.
//  Copyright (c) 2012 Eddie. All rights reserved.
//

#import "G1CHPassViewController.h"
#import "CHDetailTableCell.h"

@implementation G1CHPassViewController{
    
    NSArray *Questions;
    //NSArray *Qpics;
    NSArray *Qanswers;
}

- (void)viewDidLoad
{
    
	// Do any additional setup after loading the view, typically from a nib.
    
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CHQuestions" ofType:@"plist"];
    
    // Load the file content and read the data into arrays
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    Questions = [dict objectForKey:@"Questions"];
    //Qpics = [dict objectForKey:@"Qpic"];
    Qanswers = [dict objectForKey:@"Qanswers"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Questions count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CHDetailTableCell";
    
    CHDetailTableCell *cell = (CHDetailTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CHDetailTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.CHQuestions.text = [[Questions objectAtIndex:indexPath.row] lowercaseString];
    //cell.imageLabel.image = [UIImage imageNamed:[Qpics objectAtIndex:indexPath.row]];
    cell.CHAnswers.text = [[Qanswers objectAtIndex:indexPath.row] lowercaseString];
    
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
    CHDetailTableCell *cell = (CHDetailTableCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
	
	NSString *text = cell.CHAnswers.text; //[[menuList objectAtIndex:indexPath.row] objectForKey:@\"status\"];
	CGFloat height = [text sizeWithFont:cell.CHAnswers.font constrainedToSize:CGSizeMake(240,70) lineBreakMode:NSLineBreakByWordWrapping].height;
	//return MAX(height, MinHeight);
	
	return height+130;
}

@end
