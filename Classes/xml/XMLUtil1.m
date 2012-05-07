
#import "XMLUtil1.h"

#import "MainView.h"
BOOL c_xmlread;


@implementation XMLUtil1
@synthesize stringarray,tmpdic;
-(XMLUtil1*)init{
	self = [super init];
	return self;
}

-(void)initialMyPraseror:(NSString*)str :(NSMutableArray*)strarray {
	stringarray = strarray;
	tmpdic = [[NSMutableDictionary alloc]init];
	for (int i=0;i<[stringarray count];i++) {
		[tmpdic setObject:[[NSMutableArray alloc]init] forKey:[stringarray objectAtIndex:i]];
	}
	NSString *path = [[NSBundle mainBundle] pathForResource:str ofType:@"xml"];
	NSFileHandle *file = [NSFileHandle fileHandleForReadingAtPath:path];
	NSData *getData = [file readDataToEndOfFile];//得到xml文件
	[file closeFile];
	xmlRead = [[NSXMLParser alloc] initWithData:getData];//初始化NSXMLParser对象
	[getData release];
	[xmlRead setDelegate:self];//设置NSXMLParser对象的解析方法代理
	
	[xmlRead setShouldProcessNamespaces:NO]; // We don't care about namespaces
    [xmlRead setShouldReportNamespacePrefixes:NO]; //
    [xmlRead setShouldResolveExternalEntities:NO]; // We just want data, no other stuff
	
	BOOL success = [xmlRead parse];//调用代理解析NSXMLParser对象，看解析是否成功*/
	c_xmlread=success;
	NSLog(@"xml read parse is succeed %@",(success ? @"YES":@"NO"));
}
//start to parser document
- (void)parserDidStartDocument:(NSXMLParser *)parser{
	NSLog(@" parser start...");
	
}

//解析器，从两个结点之间读取内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
	//printf("test %s\n", [string UTF8String]);
	//NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
	//string = [string stringByTrimmingCharactersInSet:whitespace];
	//[whitespace release];
	for (int i=0;i<[stringarray count];i++) 
	{
		if (needOrNot[i]) 
		{
			NSLog(@"%@:%@",[stringarray objectAtIndex:i],string);
			[[tmpdic objectForKey:[stringarray objectAtIndex:i]] addObject:string];
		}
	}
}

//获得结点结尾的值
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	//NSLog(elementName);
	for (int i=0;i<[stringarray count];i++)
	{
		if ([elementName isEqualToString:[stringarray objectAtIndex:i]]) 
		{
			needOrNot[i] = NO;
			return;
		}
	}
}

//获得结点头的值
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
	attributes:(NSDictionary *)attributeDict {
	for (int i=0;i<[stringarray count];i++) 
	{
		if ([elementName isEqualToString:[stringarray objectAtIndex:i]]) 
		{
			needOrNot[i] = YES;
			return;
		}
	}
	
}
	
- (void)parserDidEndDocument:(NSXMLParser *)parser{
	[[NSNotificationCenter defaultCenter] postNotificationName:callBackMethod object:nil];
}
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
	NSLog(@"xml error %@",parseError);
	errorCode = [parseError code];
	[[NSNotificationCenter defaultCenter] postNotificationName:callBackMethod object:nil];
}
-(int)getErrorCode{
	if(errorCode==5)
	{
		UIAlertView *netWorkError = 
		[[UIAlertView alloc] 
		 initWithTitle:@"連接伺服器時發生錯誤" 
		 message:@"請檢查互聯網連接後再登入" 
		 delegate:self 
		 cancelButtonTitle:nil 
		 otherButtonTitles:@"確定",nil];
		[netWorkError show];
		[netWorkError release];
	}
	return errorCode;
}

-(void)dealloc{
	while ([stringarray count]==0) {
		NSMutableArray* tmparray = [tmpdic objectForKey:[stringarray objectAtIndex:[stringarray count]-1]];
		[tmparray release];
		[stringarray removeLastObject];
	}
	[tmpdic release];
	[stringarray release];
	[callBackMethod release];
	[super dealloc];
}

-(void) xmlParserByUrl:(NSString*)str :(NSMutableArray*)strarray{
	stringarray = strarray;//[[NSArray alloc]initWithObjects:@"id",@"image",nil];
	tmpdic = [[NSMutableDictionary alloc]init];
	for (int i=0;i<[stringarray count];i++) {
		[tmpdic setObject:[[NSMutableArray alloc]init] forKey:[stringarray objectAtIndex:i]];
	}
	
	NSURL *urls = [[NSURL alloc] initWithString:str];
	NSLog(@"%@",urls);
	NSData *xmldata = [NSData dataWithContentsOfURL:urls];
	xmlRead = [[NSXMLParser alloc] initWithData:xmldata];
	NSLog(@"create xmlRead is %@",xmlRead);
	[xmlRead setDelegate:self];//设置NSXMLParser对象的解析方法代理
	
	[xmlRead setShouldProcessNamespaces:NO]; // We don't care about namespaces
	[xmlRead setShouldReportNamespacePrefixes:NO]; //
	[xmlRead setShouldResolveExternalEntities:NO]; // We just want data, no other stuff
 
	/***********************************************************/
	BOOL success = [xmlRead parse];//调用代理解析NSXMLParser对象，看解析是否成功
	NSLog(@"xml read parse is succeed %@",(success ? @"YES":@"NO"));
	[urls release];
	[xmlRead release];
	NSLog(@"xmlParserByUrl start");
}

@end
