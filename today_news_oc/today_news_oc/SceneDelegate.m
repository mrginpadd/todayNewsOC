//
//  SceneDelegate.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/1.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import "ImageUtil.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    UIViewController *mineController = [[UIViewController alloc] init];
    mineController.tabBarItem.title = @"我的";
    mineController.tabBarItem.image =  [ImageUtil getFitImage:[UIImage imageNamed:@"home_unselected.png"]];
    mineController.tabBarItem.selectedImage = [ImageUtil getFitImage:[UIImage imageNamed:@"home_selected.png"]];
    
    UIViewController *videoController = [[UIViewController alloc] init];
    videoController.tabBarItem.title = @"视频";
    videoController.tabBarItem.image =  [ImageUtil getFitImage:[UIImage imageNamed:@"video_unselected.png"]];
    videoController.tabBarItem.selectedImage = [ImageUtil getFitImage:[UIImage imageNamed:@"video_selected.png"]];
    
    UIViewController *starController = [[UIViewController alloc] init];
    starController.tabBarItem.title = @"推荐";
    starController.tabBarItem.image =  [ImageUtil getFitImage:[UIImage imageNamed:@"star_unselected.png"]];
    starController.tabBarItem.selectedImage = [ImageUtil getFitImage:[UIImage imageNamed:@"star_selected.png"]];
    
    UIViewController *newsController = [[UIViewController alloc] init];
    newsController.tabBarItem.title = @"新闻";
    newsController.tabBarItem.image =  [ImageUtil getFitImage:[UIImage imageNamed:@"news_unselected.png"]];
    newsController.tabBarItem.selectedImage = [ImageUtil getFitImage:[UIImage imageNamed:@"news_selected.png"]];
    
    tabbarController.view.backgroundColor = [UIColor whiteColor];
    [tabbarController setViewControllers: @[
        videoController, newsController, starController, mineController
    ] ];
    
    
    self.window.rootViewController = tabbarController;
    [self.window makeKeyAndVisible];
 
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.

    // Save changes in the application's managed object context when the application transitions to the background.
    [(AppDelegate *)UIApplication.sharedApplication.delegate saveContext];
}


@end
