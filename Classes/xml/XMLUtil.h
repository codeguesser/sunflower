

#import <Foundation/Foundation.h>
@interface XMLUtil : NSObject<NSXMLParserDelegate> {
	NSXMLParser *xmlRead;
	
	NSString *callBackMethod;
	int errorCode;
	BOOL needOrNot[10];
	NSMutableArray *stringarray;
	NSMutableDictionary *tmpdic;
	
}

@property (nonatomic,retain)NSMutableArray *stringarray;
@property (nonatomic,retain)NSMutableDictionary *tmpdic;
-(int)getErrorCode;
-(void)xmlParserByUrl:(NSString*)str :(NSMutableArray*)strarray;
@end
