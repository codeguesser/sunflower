

#import <UIKit/UIKit.h>


@interface EnquirViewMyWeb : UIViewController<UITableViewDataSource,UITableViewDelegate> {

	UIButton *btnfoot;
	UIButton *back;
	UIScrollView *scrollview;
	NSString *backkind;
	UITableView *c_tableview;
	NSArray * titles,*titles2;
	UILabel *tittle,*tittle3;
	NSString *bundle;
	UILabel *verison;
	int c_number;
	//int c_tabbtn;
	NSString *c_tabbtn;
	UIButton *c_Secret1,*c_Secret2,*c_Secret3;
}

@property (retain,nonatomic)NSString *backkind;
@property (retain,nonatomic)NSString *c_tabbtn;
-(IBAction)back:(UIButton *)sender;
//-(IBAction)back2:(UIButton *)sender;
//-(UIViewController *) createWebViewController: (NSString *) urlString;
//-(void)se1:(id)sender;
//-(void)se2:(id)sender;
//-(void)se3:(id)sender;
-(void)dosomething1;
//-(void)dosomething2;
-(void)btn3;

@end
