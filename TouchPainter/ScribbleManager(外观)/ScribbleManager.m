//
//  ScribbleManager.m
//  TouchPainter
//
//  Created by 汪启航 on 2019/8/21.
//  Copyright © 2019年 q.h. All rights reserved.
//

#import "ScribbleManager.h"
#import "Scribble.h"

#define kScribbleDataPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data"]
#define kScribbleThumbnailPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/thumbnails"]

@interface ScribbleManager ()

- (NSString *)scribbleDataPath;
- (NSString *)scribbleThumbnailPath;
- (NSArray *)scribbleDataPaths;
- (NSArray *)scribbleThumbnailPaths;

@end

@implementation ScribbleManager

- (void)saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image {
    int newIndex = (int)[self numberOfScribbles] + 1;
    
    NSString *scribbleDataName = [NSString stringWithFormat:@"data_%d", newIndex];
    NSString *scribbleThumbnailName = [NSString stringWithFormat:@"thumbnail_%d.png",
                                       newIndex];
    
    ScribbleMemento *scribbleMemento = [scribble scribbleMemento];
    NSData *mementoData = [scribbleMemento data];
    NSString *mementoPath = [[self scribbleDataPath]
                             stringByAppendingPathComponent:scribbleDataName];
    [mementoData writeToFile:mementoPath atomically:YES];
    
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    NSString *imagePath = [[self scribbleThumbnailPath]
                           stringByAppendingPathComponent:scribbleThumbnailName];
    [imageData writeToFile:imagePath atomically:YES];
}
- (NSInteger)numberOfScribbles {
    NSArray *scribbleDataPathsArray = [self scribbleDataPaths];
    return [scribbleDataPathsArray count];
}
- (Scribble *)scribbleAtIndex:(NSInteger)index {
    Scribble *loadedScribble = nil;
    NSArray *scribbleDataPathsArray = [self scribbleDataPaths];
    NSString *scribblePath = [scribbleDataPathsArray objectAtIndex:index];
    if (scribblePath) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSData *scribbleData = [fileManager contentsAtPath:[kScribbleDataPath
                                                            stringByAppendingPathComponent:
                                                            scribblePath]];
        ScribbleMemento *scribbleMemento = [ScribbleMemento mementoWithData:scribbleData];
        loadedScribble = [Scribble scribbleWithMemento:scribbleMemento];
    }
    return loadedScribble;
}
- (UIView *)scribbleThumbnailViewAtIndex:(NSInteger)index {
    return nil;
}

#pragma mark - Private
- (NSString *)scribbleDataPath {
    if(![[NSFileManager defaultManager] fileExistsAtPath:kScribbleDataPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:kScribbleDataPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    return kScribbleDataPath;
}
- (NSString *)scribbleThumbnailPath {
    if(![[NSFileManager defaultManager] fileExistsAtPath:kScribbleThumbnailPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:kScribbleThumbnailPath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    return kScribbleThumbnailPath;
}
- (NSArray *)scribbleDataPaths {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleDataPathsArray = [fileManager contentsOfDirectoryAtPath:[self scribbleDataPath]
                                                                       error:&error];
    return scribbleDataPathsArray;
}
- (NSArray *)scribbleThumbnailPaths {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *scribbleThumbnailPathsArray = [fileManager contentsOfDirectoryAtPath:[self scribbleThumbnailPath]
                                                                            error:&error];
    return scribbleThumbnailPathsArray;
}
@end
