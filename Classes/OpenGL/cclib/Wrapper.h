//
//  Wrapper.h
//  iDemo
//
//  Created by Dr.Watson on 31/05/08.
//  Copyright 2008 (c) Dr.Watson. All rights reserved.
//

class CCTexture;

#define SCREEN_WIDTH			320
#define SCREEN_HEIGHT			480

CCTexture *CCTextureCreate(const char *filename, const char *directory="");
const char *GetPath(const char *s, const char *directory = 0);

void changeAlphra(int type);
void Enable2D();
void Enable3D();