
#include <dlfcn.h>


%ctor {
NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.yourcompany.showopenurl.plist"] ;
NSString *libraryPath = @"/Library/Application Support/ShowOpenUrl/showopenurldylib.dylib";

NSString *keyPath = [NSString stringWithFormat:@"ShowOpenUrl-%@", [[NSBundle mainBundle] bundleIdentifier]];
NSLog(@"++++++++++ before loaded %@,keyPath = %@,prefs = %@", libraryPath,keyPath,prefs);
if ([[prefs objectForKey:keyPath] boolValue]) {
if ([[NSFileManager defaultManager] fileExistsAtPath:libraryPath]){
void *haldel = dlopen([libraryPath UTF8String], RTLD_NOW);
if (haldel == NULL) {
char *error = dlerror();
NSLog(@"dlopen error: %s", error);
} else {
NSLog(@"dlopen load framework success.");


}

NSLog(@"++++++++++ loaded %@", libraryPath);
} else {
NSLog(@"++++++++++ file not exists %@", libraryPath);
}
}
else {
NSLog(@"++++++++++ not enabled %@", libraryPath);
}

NSLog(@"++++++++++ after loaded %@", libraryPath);


[pool drain];
}



