//
//  G1PassViewController.m
//  G1Pass
//
//  Created by Eddie on 2012-12-06.
//  Copyright (c) 2012 Eddie. All rights reserved.
//

#import "G1PassViewController.h"
#import "DetailTableCell.h"

@implementation G1PassViewController{
    
    NSArray *Questions;
    //NSArray *Qpics;
    NSArray *Qanswers;
}

- (void)viewDidLoad
{
    
	// Do any additional setup after loading the view, typically from a nib.
    
    // Find out the path of recipes.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    
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
    static NSString *simpleTableIdentifier = @"DetailTableCell";
    
    DetailTableCell *cell = (DetailTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DetailTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.QuestionLabel.text = [[Questions objectAtIndex:indexPath.row] lowercaseString];
    //cell.imageLabel.image = [UIImage imageNamed:[Qpics objectAtIndex:indexPath.row]];
    cell.AnswerLabel.text = [[Qanswers objectAtIndex:indexPath.row] lowercaseString];

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
    DetailTableCell *cell = (DetailTableCell*)[self tableView:tableView cellForRowAtIndexPath:indexPath];
	
	NSString *text = cell.AnswerLabel.text; //[[menuList objectAtIndex:indexPath.row] objectForKey:@\"status\"];
	CGFloat height = [text sizeWithFont:cell.AnswerLabel.font constrainedToSize:CGSizeMake(240,70) lineBreakMode:NSLineBreakByWordWrapping].height;
	//return MAX(height, MinHeight);
	
	return height+130;
}

@end
