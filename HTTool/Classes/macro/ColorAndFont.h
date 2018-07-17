//
//  ColorAndFont.h
//  OwnerLoan
//
//  Created by user on 2018/4/28.
//  Copyright © 2018年 user. All rights reserved.
//

#ifndef ColorAndFont_h
#define ColorAndFont_h



//color
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIColorWithRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define UIColorFromRGBA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]
#define UIColorWithRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define BACKGROUND_COLOR  UIColorFromRGB(0xffffff)
#define MAIN_COLOR  UIColorFromRGB(0xff8c26)  //主色





// 字体
#define DiyFont(fontsize) [UIFont systemFontOfSize:fontsize]
#define BDiyFont(fontsize) [UIFont boldSystemFontOfSize:fontsize]

#endif /* ColorAndFont_h */
