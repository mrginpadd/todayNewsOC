//
//  SceneDelegate.m
//  today_news_oc
//
//  Created by xushihao on 2023/12/1.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import "ImageUtil.h"
#import "biz_modules.h"
@interface SceneDelegate ()<UITabBarControllerDelegate> 

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
    
    MineViewController *mineViewController = [[MineViewController alloc] init];
    
//    UINavigationController *mineNavController = [[UINavigationController alloc] initWithRootViewController:mineViewController];
    mineViewController.tabBarItem.title = @"我的";
    mineViewController.tabBarItem.image =  [ImageUtil getFitImage:[UIImage imageNamed:@"home_unselected.png"]];
    mineViewController.tabBarItem.selectedImage = [ImageUtil getFitImage:[UIImage imageNamed:@"home_selected.png"]];
    
    VideoViewController *videoViewController = [[VideoViewController alloc] init];
    videoViewController.tabBarItem.title = @"视频";
    videoViewController.tabBarItem.image =  [ImageUtil getFitImage:[UIImage imageNamed:@"video_unselected.png"]];
    videoViewController.tabBarItem.selectedImage = [ImageUtil getFitImage:[UIImage imageNamed:@"video_selected.png"]];
    
    StarViewController *starViewController = [[StarViewController alloc] init];
    starViewController.tabBarItem.title = @"推荐";
    starViewController.tabBarItem.image =  [ImageUtil getFitImage:[UIImage imageNamed:@"star_unselected.png"]];
    starViewController.tabBarItem.selectedImage = [ImageUtil getFitImage:[UIImage imageNamed:@"star_selected.png"]];
    
    NewsViewController *newsViewController = [[NewsViewController alloc] init];

     
//    UINavigationController *newsController = [[UINavigationController alloc] initWithRootViewController:newsViewController];
    newsViewController.tabBarItem.title = @"新闻";
    newsViewController.tabBarItem.image =  [ImageUtil getFitImage:[UIImage imageNamed:@"news_unselected.png"]];
    newsViewController.tabBarItem.selectedImage = [ImageUtil getFitImage:[UIImage imageNamed:@"news_selected.png"]];
    
    tabbarController.view.backgroundColor = [UIColor whiteColor];
    
    tabbarController.delegate = self;
    
    [tabbarController setViewControllers: @[
        newsViewController, videoViewController, starViewController, mineViewController
    ] ];
    
    UINavigationController *rootNavigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    
    self.window.rootViewController = rootNavigationController;
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

#pragma mark - tabbar代理方法
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController API_AVAILABLE(ios(3.0)) {
    NSLog(@"shouldSelectViewController");
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    NSLog(@"didSelectViewController");
}

- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers API_AVAILABLE(ios(3.0)) API_UNAVAILABLE(tvos) {
    NSLog(@"willBeginCustomizingViewControllers");
}
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed API_AVAILABLE(ios(3.0)) API_UNAVAILABLE(tvos) {
    NSLog(@"willEndCustomizingViewControllers");
}
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers changed:(BOOL)changed API_UNAVAILABLE(tvos) {
    NSLog(@"didEndCustomizingViewControllers");
}


@end
