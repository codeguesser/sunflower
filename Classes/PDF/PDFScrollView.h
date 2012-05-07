

#import <UIKit/UIKit.h>

@class TiledPDFView;

@interface PDFScrollView : UIScrollView <UIScrollViewDelegate> {
	TiledPDFView *pdfView;
	TiledPDFView *oldPDFView;
	UIImageView *backgroundImageView;
	CGFloat pdfScale;
	
	CGPDFPageRef page;
	CGPDFDocumentRef pdf;

@private
	BOOL _hadMoved;
	CGRect _linkViewActualFrame;
	
	NSMutableArray *urlsArray;
	NSMutableArray *urlRectStringArray;
	
	UIView *linkView;
}


-(void)BookReadView_URL:(NSURL *)BookURL;

@end
