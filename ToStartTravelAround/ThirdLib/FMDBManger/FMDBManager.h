//
//  FMDBManager.h
//  ZZLCrazyBuy
//
//  Created by gorson on 3/17/15.
//  Copyright (c) 2015 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

/*
 你说你熟悉Coredata是吧？你说说coredata和SQLite的关系吧？
 
 SQLite是什么？它是移动端的轻量级数据库，Lite是简版的意思
 Coredata是什么？它是苹果基于SQLite封装的一套用于数据库管理操作的解决方案，
 它封装SQLite的增、删、改、查操作，然后拓展了一些类
 Coredata下一些类：
 1.NSManagedObjectContext：CoreData的被管理的数据上下文，增、删、改、查询都需要用到。
 2.NSManagedObjectModel：是Coredata实体模型的基类，用于加载coreData数据模型
 3.NSFetchRequest：coredata请求类（一般用于查询的请求）
 4.NSPredicate：定义查询条件的谓词（条件语句）
 
 Coredata的工作原理是：
 直接传入一个model
 把这个model保存到数据库的数据表
 数据表的名字就是model的名字     NSStringFromClass([person class]);
 数据表的字段就是model包含的属性  class_copyIvarList([person class], &outCount)
 数据表的内容就是model属性的值   [person valueForKey:@"use_id"]
 
 Coredata原则：对象关系映射（反射） ORM
 反射机制：在运行时中，能动态获取类的类名，属性及方法；能动态的获取对象的属性及方法就是反射机制
 
 -valueForKey:
 -setValue:ForKey:;
 KVC的工作原理：
 1.首先它会寻找 对象属性里面有没有这个key
 2.它会寻找    私有成员变量里面有没有这个key
 3.它会寻找    公有/私有方法
 强行为某一块内存赋值,但是不能为readonly的附值，只能读取
 */


@interface FMDBManager : NSObject

// 单例方法
+ (FMDBManager *)sharedInstace;




// 创建表
- (void)creatTable:(id)model;

/**
 *  数据库增加或更新
 *
 *  @param model 元素
 */

-(void)insertAndUpdateModelToDatabase:(id)model;

/**
 *  数据库删除元素
 *
 *  @param model 元素
 */
-(void)deleteModelInDatabase:(id)model;

/**
 *  数据库通过表名查询所有对应表的所有值
 */
- (NSArray *)selectModelArrayInDatabase:(NSString *)className;
@end
