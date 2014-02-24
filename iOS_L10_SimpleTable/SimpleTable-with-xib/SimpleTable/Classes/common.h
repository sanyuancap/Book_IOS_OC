/*
 *  common.h
 *  SwitchView
 *
 *  Created by goodmao on 12-6-12.
 *  Copyright 2012 __SDKWiki__. All rights reserved.
 *
 */

#define __GOODMAO_DEBUG__

#ifdef __GOODMAO_DEBUG__
	#define __GOODMAO_LOG__   NSLog(@"%s, %s, %d", __FILE__, __FUNCTION__, __LINE__);
#else
	#define __GOODMAO_LOG__
#endif