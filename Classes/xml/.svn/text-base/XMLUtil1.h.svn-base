

#import <Foundation/Foundation.h>
@interface XMLUtil1 : NSObject<NSXMLParserDelegate> {
	NSXMLParser *xmlRead;
	
	NSString *callBackMethod;
	int errorCode;
	BOOL needOrNot[100];
	NSMutableArray *stringarray;
	NSMutableDictionary *tmpdic;
}
@property (nonatomic,retain)NSMutableArray *stringarray;
@property (nonatomic,retain)NSMutableDictionary *tmpdic;
-(int)getErrorCode;
-(void)initialMyPraseror:(NSString*)str :(NSMutableArray*)strarray;
-(void)xmlParserByUrl:(NSString*)str :(NSMutableArray*)strarray;
@end
