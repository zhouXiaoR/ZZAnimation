//
//  ZZTableViewController.m
//  ZZAnimationDemo
//
//  Created by 周晓瑞 on 2017/11/2.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ZZTableViewController.h"
#import "ZZTableViewCell.h"

@interface ZZTableViewController ()
@property(nonatomic,strong)NSMutableArray<NSNumber*> *percentArray;
@end

@implementation ZZTableViewController

-(NSMutableArray<NSNumber*> *)percentArray{
    if (_percentArray == nil) {
        _percentArray = [NSMutableArray array];
        for (int i = 0; i < 100; i++) {
            CGFloat randomNum = arc4random()%9 + 1;
            CGFloat value = 1.0 * randomNum / 10;
            [_percentArray addObject:[NSNumber numberWithFloat:value]];
        }
    }
    return _percentArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)nextStyle:(UIBarButtonItem *)sender {
    [self changeStyle];
}

- (void)changeStyle{
    [[NSNotificationCenter defaultCenter]postNotificationName:ZZChangeProgressTypeNotification object:nil];
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.percentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZZTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.percent = self.percentArray[indexPath.row].floatValue;
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
