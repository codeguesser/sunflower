//
//  Tips1.h
//  New_Projects
//
//  Created by chen cool on 11-11-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Tips1 : UIViewController <UIWebViewDelegate>{

	UIWebView *m_pWebView;
	NSURL *temp_URL;
	NSURLRequest *temp_URLRequest;
	 UIButton *btnfoot;
}

-(IBAction)btnfoot:(UIButton*)sender;
-(void)next:(id)sender;
-(void)back:(id)sender;

-(void)dosomething1;
-(void)dosomething2;

@end
