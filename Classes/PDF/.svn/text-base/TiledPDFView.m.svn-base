


#import "TiledPDFView.h"
#import <QuartzCore/QuartzCore.h>

@implementation TiledPDFView


// Create a new TiledPDFView with the desired frame and scale.
- (id)initWithFrame:(CGRect)frame andScale:(CGFloat)scale{
    if ((self = [super initWithFrame:frame])) {
		
		CATiledLayer *tiledLayer = (CATiledLayer *)[self layer];
        tiledLayer.levelsOfDetail = 4;
		tiledLayer.levelsOfDetailBias = 4;
		tiledLayer.tileSize = CGSizeMake(512.0, 512.0);
		
		myScale = scale;
    }
    return self;
}

// Set the layer's class to be CATiledLayer.
+ (Class)layerClass {
	return [CATiledLayer class];
}

// Set the CGPDFPageRef for the view.
- (void)setPage:(CGPDFPageRef)newPage
{
    CGPDFPageRelease(self->pdfPage);
    self->pdfPage = CGPDFPageRetain(newPage);
}


-(void)drawRect:(CGRect)r
{
    
}


// Draw the CGPDFPageRef into the layer at the correct scale.
-(void)drawLayer:(CALayer*)layer inContext:(CGContextRef)context
{
	// First fill the background with white.
	CGContextSetRGBFillColor(context, 1,1,1,1);
    CGContextFillRect(context,self.bounds);
	
	CGContextSaveGState(context);
	// Flip the context so that the PDF page is rendered
	// right side up.
	CGContextTranslateCTM(context, 0, self.bounds.size.height);
	CGContextScaleCTM(context, 1, -1);
	
	// Scale the context so that the PDF page is rendered 
	// at the correct size for the zoom level.
	CGContextScaleCTM(context, myScale,myScale);	
	CGContextDrawPDFPage(context, pdfPage);
	CGContextRestoreGState(context);
	
}

// Clean up.
- (void)dealloc {
	CGPDFPageRelease(pdfPage);
	
    [super dealloc];
}


@end
