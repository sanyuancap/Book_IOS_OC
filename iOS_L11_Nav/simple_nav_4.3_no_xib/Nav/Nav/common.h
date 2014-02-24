//
//  common.h
//  Nav
//
//  Created by goodmao on 12-8-22.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef Nav_common_h
#define Nav_common_h

#define __GOODMAO_DEBUG__


static inline void __goodmao_Log(NSString *aStr)
{
#ifdef __GOODMAO_DEBUG__
    NSLog(@"%s, %s, %d : %@", __FILE__, __FUNCTION__, __LINE__, aStr);
    
#endif
}

#endif
