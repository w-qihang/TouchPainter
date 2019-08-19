//
//  ConsoleCommands.h
//  TouchPainter
//
//  Created by 汪启航 on 2019/7/31.
//  Copyright © 2019年 q.h. All rights reserved.
//


/*
 例如在设计游戏平台时,有两个主要组件-操作系统和用户输入的控制面板.一组仿真器(操作系统)会有他们的类层次,同时一组虚拟控制器(输入面板)也会单独有自己的类层次.
 两个层次结构有不同的接口.通过对象组合关系,在两个层次结构的上层抽象类之间形成"桥接",从而联系起来
 */

#ifndef ConsoleCommands_h
#define ConsoleCommands_h

typedef enum
{
    kConsoleCommandUp,
    kConsoleCommandDown,
    kConsoleCommandLeft,
    kConsoleCommandRight,
    kConsoleCommandSelect,
    kConsoleCommandStart,
    kConsoleCommandAction1,
    kConsoleCommandAction2,
} ConsoleCommand;


#endif /* ConsoleCommands_h */
