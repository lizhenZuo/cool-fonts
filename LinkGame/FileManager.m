//
//  FileManager.m
//  LinkGame
//
//  Created by zorro on 16/3/10.
//  Copyright © 2016年 zorro. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager

//获取根目录
- (NSString *)getHomePath
{
    NSString *homePath = NSHomeDirectory();
    return homePath;
}

//获取Documents文件夹目录
- (NSString *)getDocumentPath
{
    NSArray *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [docPath objectAtIndex:0];
    return documentsPath;
}

//获取Cache目录
- (NSString *)getCachePath
{
    NSArray *cacPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cacPath objectAtIndex:0];
    return cachePath;
}

//获取Library目录
- (NSString *)getLibraryPath
{
    NSArray *libsPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryPath = [libsPath objectAtIndex:0];
    return libraryPath;
}

//获取temp目录
- (NSString *)getTempPath
{
    NSString *tempPath = NSTemporaryDirectory();
    return tempPath;
}

- (void)writeDataToDocumentFile:(NSString *)data
{
    NSString *documents = [self getDocumentPath];
    NSString *filePath = [documents stringByAppendingPathComponent:@"test.tex"];
    [data writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

- (NSString *)readDataFromDocumentFile
{
    NSString *documents = [self getDocumentPath];
    NSString *filePath = [documents stringByAppendingPathComponent:@"test.tex"];
    NSString *data = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    return data;
}

- (NSString *)createFilePath:(NSString *)fileName
{
    //获取文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentsPath = [self getDocumentPath];
    //文件目录名
    NSString *fileDirectory = [documentsPath stringByAppendingPathComponent:fileName];
    //执行创建
    BOOL isSucess = [fileManager createDirectoryAtPath:fileDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    if (isSucess)
    {
        return fileDirectory;
    }
    return @"";
}

- (BOOL)writeStringToFileWithFileName:(NSString *)fileName data:(NSString *)data
{
    NSString *fileDirectory = [self createFilePath:@"test"];
    NSString *filePath = [fileDirectory stringByAppendingPathComponent:@"test.txt"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager createFileAtPath:filePath contents:[data dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
}

- (NSArray *)getAllFileAtFileDirectory:(NSString *)fileDirectory
{
    NSFileManager *fileManger = [NSFileManager defaultManager];
    NSArray *arrayFile = [fileManger subpathsAtPath:fileDirectory];
    return arrayFile;
}


@end
