

#import "PDFScrollView.h"
#import "TiledPDFView.h"
#import <QuartzCore/QuartzCore.h>


@interface PDFScrollView (privateMethods)
-(void)parseContent;
@end


@implementation PDFScrollView

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {		
		// Set up the UIScrollView
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.bouncesZoom = YES;
        self.decelerationRate = UIScrollViewDecelerationRateFast;
        self.delegate = self;
		[self setBackgroundColor:[UIColor grayColor]];
		self.maximumZoomScale = 5.0;
		self.minimumZoomScale = .25;
		
    }
    return self;
}


void myOperator_BMC(CGPDFScannerRef s, void *info)
{
    const char *name;
    CGPDFScannerPopName(s, &name);
	
	NSString *nameString = [NSString stringWithUTF8String:name];
	NSLog(@"nameString:%@", nameString);
}


//分析每一个link在pdf上的位置
-(void)parseContent{
	
	
	if (urlsArray != nil
		&& [urlsArray count] >= 1)
	{
		[urlsArray removeAllObjects];
	}
	
	if (urlRectStringArray != nil
		&& [urlRectStringArray count] >= 1)
	{
		[urlRectStringArray removeAllObjects];
	}
    
    CGPDFDictionaryRef pageDictionary = CGPDFPageGetDictionary(page);
	
    CGPDFArrayRef outputArray;
    if(!CGPDFDictionaryGetArray(pageDictionary, "Annots", &outputArray)) {
        return;
    }
	
    int arrayCount = CGPDFArrayGetCount( outputArray );
    if(!arrayCount) {
        return;
    }
	
    for( int j = 0; j < arrayCount; ++j ) {
        CGPDFObjectRef aDictObj;
        if(!CGPDFArrayGetObject(outputArray, j, &aDictObj)) {
            return;
        }
		
        CGPDFDictionaryRef annotDict;
        if(!CGPDFObjectGetValue(aDictObj, kCGPDFObjectTypeDictionary, &annotDict)) {
            return;
        }
		
        CGPDFDictionaryRef aDict;
        if(!CGPDFDictionaryGetDictionary(annotDict, "A", &aDict)) {
            return;
        }
		
        CGPDFStringRef uriStringRef;
        if(!CGPDFDictionaryGetString(aDict, "URI", &uriStringRef)) {
            return;
        }
		
        CGPDFArrayRef rectArray;
        if(!CGPDFDictionaryGetArray(annotDict, "Rect", &rectArray)) {
            return;
        }
		
        int arrayCount = CGPDFArrayGetCount( rectArray );
        CGPDFReal coords[4];
        for( int k = 0; k < arrayCount; ++k ) {
            CGPDFObjectRef rectObj;
            if(!CGPDFArrayGetObject(rectArray, k, &rectObj)) {
                return;
            }
			
            CGPDFReal coord;
            if(!CGPDFObjectGetValue(rectObj, kCGPDFObjectTypeReal, &coord)) {
                return;
            }
			
            coords[k] = coord;
        }               
		
        char *uriString = (char *)CGPDFStringGetBytePtr(uriStringRef);
		
        NSString *uri = [NSString stringWithCString:uriString encoding:NSUTF8StringEncoding];
        CGRect rect = CGRectMake(coords[0],coords[1],coords[2],coords[3]);
		
        CGPDFInteger pageRotate = 0;
        CGPDFDictionaryGetInteger( pageDictionary, "Rotate", &pageRotate ); 
        CGRect pageRect = CGRectIntegral( CGPDFPageGetBoxRect( page, kCGPDFMediaBox ));
        if( pageRotate == 90 || pageRotate == 270 ) {
            CGFloat temp = pageRect.size.width;
            pageRect.size.width = pageRect.size.height;
            pageRect.size.height = temp;
        }
		
        rect.size.width -= rect.origin.x;
        rect.size.height -= rect.origin.y;
		
        CGAffineTransform trans = CGAffineTransformIdentity;
        trans = CGAffineTransformTranslate(trans, 0, pageRect.size.height);
        trans = CGAffineTransformScale(trans, 1.0, -1.0);
		
        rect = CGRectApplyAffineTransform(rect, trans);
		
		CGRect newRect = CGRectMake(rect.origin.x * pdfScale, rect.origin.y * pdfScale
									, rect.size.width * pdfScale, rect.size.height * pdfScale);
		
		if (urlsArray != nil
			&& urlRectStringArray != nil
			&& uri != nil)
		{
			[urlsArray addObject:uri];
			[urlRectStringArray addObject:NSStringFromCGRect(rect)];
		}
		
		_linkViewActualFrame = rect;
		linkView.frame = newRect;
		[pdfView addSubview:linkView];
		
       
	}
	
	
	
}

- (void)openLink:(UIButton *)button
{
	NSLog(@"touch link");
}



- (void)dealloc
{
	[urlsArray release];
	[urlRectStringArray release];
	[linkView removeFromSuperview];
	linkView = nil;
	
	// Clean up
    [pdfView release];
	[backgroundImageView release];
	CGPDFPageRelease(page);
	CGPDFDocumentRelease(pdf);
    [super dealloc];
}

#pragma mark -
#pragma mark Override layoutSubviews to center content

// We use layoutSubviews to center the PDF page in the view
- (void)layoutSubviews 
{
    [super layoutSubviews];
    
    // center the image as it becomes smaller than the size of the screen
	
    CGSize boundsSize = self.bounds.size;
    CGRect frameToCenter = pdfView.frame;
    
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width)
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    else
        frameToCenter.origin.x = 0;
    
    // center vertically
    if (frameToCenter.size.height < boundsSize.height)
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    else
        frameToCenter.origin.y = 0;
    
    pdfView.frame = frameToCenter;
	backgroundImageView.frame = frameToCenter;
    
	pdfView.contentScaleFactor = 1.0;
}

#pragma mark -
#pragma mark UIScrollView delegate methods

// A UIScrollView delegate callback, called when the user starts zooming. 
// We return our current TiledPDFView.
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return pdfView;
}

// A UIScrollView delegate callback, called when the user stops zooming.  When the user stops zooming
// we create a new TiledPDFView based on the new zoom level and draw it on top of the old TiledPDFView.
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
	// set the new scale factor for the TiledPDFView
	pdfScale *=scale;
	
	// Calculate the new frame for the new TiledPDFView
	CGRect pageRect = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
	pageRect.size = CGSizeMake(pageRect.size.width*pdfScale, pageRect.size.height*pdfScale);
	
	// Create a new TiledPDFView based on new frame and scaling.
	pdfView = [[TiledPDFView alloc] initWithFrame:pageRect andScale:pdfScale];
	[pdfView setPage:page];
	
	// Add the new TiledPDFView to the PDFScrollView.
	[self addSubview:pdfView];
	
	CGRect newRect = CGRectMake(_linkViewActualFrame.origin.x * pdfScale
								, _linkViewActualFrame.origin.y * pdfScale
								, _linkViewActualFrame.size.width * pdfScale
								, _linkViewActualFrame.size.height * pdfScale);
	linkView.frame = newRect;
	[pdfView addSubview:linkView];
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
	// Remove back tiled view.
	[oldPDFView removeFromSuperview];
	[oldPDFView release];
	
	// Set the current TiledPDFView to be the old view.
	oldPDFView = pdfView;
	[self addSubview:oldPDFView];
}





#pragma mark touches methods



- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	
	_hadMoved = NO;
	
    if (!self.dragging) {
        [self.nextResponder touchesBegan: touches withEvent:event]; 
    }       
	
    [super touchesBegan: touches withEvent: event];
}


- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	
	_hadMoved = YES;
	
    if (!self.dragging) {
        [self.nextResponder touchesMoved: touches withEvent:event]; 
    }       
	
    [super touchesMoved: touches withEvent: event];
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	
    if (!self.dragging) {
        [self.nextResponder touchesEnded: touches withEvent:event]; 
		
		if (!_hadMoved) 
		{
			if (urlsArray != nil
				&& urlRectStringArray != nil
				&& pdfView != nil)
			{
				CGPoint touchPoint = [[touches anyObject] locationInView:pdfView];
				
				NSInteger urlIndex = 0;
				
				for (urlIndex = 0; urlIndex < [urlRectStringArray count]; urlIndex++)
				{
					id oneObject = [urlRectStringArray objectAtIndex:urlIndex];
					
					if ([oneObject isKindOfClass:[NSString class]])
					{
						CGRect aFrame = CGRectFromString(((NSString *)oneObject));
						CGRect newFrame = CGRectMake(aFrame.origin.x * pdfScale
													 , aFrame.origin.y * pdfScale
													 , aFrame.size.width * pdfScale
													 , aFrame.size.height *pdfScale);
						
						if (CGRectContainsPoint(newFrame, touchPoint)) 
						{
							break;
						}
					}
				}
				
				
				if (urlIndex >= 0 && urlIndex < [urlsArray count])
				{
					id oneObject = [urlsArray objectAtIndex:urlIndex];
					
					if ([oneObject isKindOfClass:[NSString class]])
					{
						UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tips"
																		message:[NSString stringWithFormat:@"是否打开网址:%@", (NSString *)oneObject]
																	   delegate:self
															  cancelButtonTitle:@"NO"
															  otherButtonTitles:@"YES", nil];
						[alert show];
						[alert release];
						alert = nil;
					}
				}
			}
		}
    }       
	
    [super touchesEnded: touches withEvent: event];
}

- (void) touchesCancelled: (NSSet *) touches withEvent: (UIEvent *) event {
	
	_hadMoved = YES;
	
    if (!self.dragging) {
        [self.nextResponder touchesCancelled: touches withEvent:event]; 
    }       
	
    [super touchesCancelled: touches withEvent: event];
}


-(void)BookReadView_URL:(NSURL *)BookURL
{
	CFURLRef pdfURL = (CFURLRef)BookURL;
	
	pdf = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
	
	
	
	
	urlsArray = [[NSMutableArray alloc] initWithCapacity:100];
	urlRectStringArray = [[NSMutableArray alloc] initWithCapacity:100];
	
	// Open the PDF document
	
	
	//NSString *temp_URL = [[NSString alloc] initWithString:@"oo.pdf"];
	//		
	//		CFStringRef aCFString = (CFStringRef)temp_URL;
	//		CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), aCFString, NULL, NULL);
	
	//		NSURL *pdfURL = [[NSBundle mainBundle] URLForResource:@"TestPage.pdf" withExtension:nil];
	//pdf = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
	
	
	
	
	
	
	
	// Get the PDF Page that we will be drawing
	page = CGPDFDocumentGetPage(pdf, 1);
	CGPDFPageRetain(page);
	
	[self parseContent];
	
	// determine the size of the PDF page
	CGRect pageRect = CGPDFPageGetBoxRect(page, kCGPDFMediaBox);
	pdfScale = self.frame.size.width/pageRect.size.width;
	pageRect.size = CGSizeMake(pageRect.size.width*pdfScale, pageRect.size.height*pdfScale);
	
	
	// Create a low res image representation of the PDF page to display before the TiledPDFView
	// renders its content.
	UIGraphicsBeginImageContext(pageRect.size);
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	// First fill the background with white.
	CGContextSetRGBFillColor(context, 1.0,1.0,1.0,1.0);
	CGContextFillRect(context,pageRect);
	
	CGContextSaveGState(context);
	// Flip the context so that the PDF page is rendered
	// right side up.
	CGContextTranslateCTM(context, 0.0, pageRect.size.height);
	CGContextScaleCTM(context, 1.0, -1.0);
	
	// Scale the context so that the PDF page is rendered 
	// at the correct size for the zoom level.
	CGContextScaleCTM(context, pdfScale,pdfScale);	
	CGContextDrawPDFPage(context, page);
	CGContextRestoreGState(context);
	
	UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	backgroundImageView = [[UIImageView alloc] initWithImage:backgroundImage];
	backgroundImageView.frame = pageRect;
	backgroundImageView.contentMode = UIViewContentModeScaleAspectFit;
	[self addSubview:backgroundImageView];
	[self sendSubviewToBack:backgroundImageView];
	
	
	// Create the TiledPDFView based on the size of the PDF page and scale it to fit the view.
	pdfView = [[TiledPDFView alloc] initWithFrame:pageRect andScale:pdfScale];
	[pdfView setPage:page];
	
	[self addSubview:pdfView];
	
	linkView = [[UIView alloc] initWithFrame:CGRectZero];
	linkView.backgroundColor = [UIColor greenColor];
	linkView.alpha = 0.5;
	[pdfView addSubview:linkView];
	
	
}


#pragma mark UIAlertViewDelegate methods




- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

	if (alertView != nil)
	{
		NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
		
		if ([buttonTitle isEqualToString:@"YES"])
		{
			NSString *urlString = @"http://www.apple.com";
			
			if (alertView.message != nil)
			{
				NSString *message = alertView.message;
				
				urlString = [message stringByReplacingOccurrencesOfString:@"是否打开网址:" withString:@""];
			}
			
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
		}
		
		[alertView dismissWithClickedButtonIndex:buttonIndex animated:YES];
	}	
}


@end
