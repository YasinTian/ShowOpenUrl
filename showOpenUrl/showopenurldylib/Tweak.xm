%hook UIApplication
-(BOOL)openURL:(NSURL*)url{

UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Welcome" message:url.absoluteString delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
[alert show];
return %orig;
}

- (void)openURL:(NSURL*)url options:(NSDictionary<NSString *, id> *)options completionHandler:(id)completion{
UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Welcome" message:url.absoluteString delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
[alert show];
%orig;
}

%end

%hook AppDelegate

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Welcome" message:url.absoluteString delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
[alert show];
return %orig;
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Welcome" message:url.absoluteString delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
[alert show];
return %orig;
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Welcome" message:url.absoluteString delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
[alert show];
return %orig;
}

-(BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler{
UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Welcome" message:userActivity.webpageURL.absoluteString delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
[alert show];
return %orig;
}

%end


