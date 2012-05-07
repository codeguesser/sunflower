//
//  Tips2_pdf.h
//  New_Projects
//
//  Created by chen cool on 11-10-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Tips2_pdf : UIViewController {

	UIButton *btnfoot;
	NSString *c_xml;
	UIButton *btnback;
	
}
@property(retain,nonatomic)NSString *c_xml;
-(void)back:(id)sender;

@end
