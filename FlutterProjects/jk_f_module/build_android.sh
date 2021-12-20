if [ -z $out ]; then
    out='FlutterProducts/android_aars'
fi

echo "准备输出所有文件到目录: $out"

echo "清除所有已编译文件"
find . -d -name build | xargs rm -rf
flutter clean
rm -rf $out
rm -rf build

flutter packages get

echo "编译flutter"

#flutter build aar --no-debug --no-profile --output=$out
flutter build aar --no-debug --no-profile

echo "编译flutter完成"
#mkdir $out

# cp -r build/ios/Release-iphoneos/*/*.framework $out
# cp -r .ios/Flutter/App.framework $out
# cp -r .ios/Flutter/engine/Flutter.framework $out

echo "复制framework库到临时文件夹: $out"

#libpath='../../JKFlutterKits/iOS'
#
#rm -rf "$libpath/ios_frameworks"
#mkdir "$libpath/ios_frameworks"
#for file in $out/Release/*;
#do
#    for subfile in $file/ios-arm64_armv7/*;
#    do
#        case "$subfile" in
#	        *.framework ) cp -r "$subfile" "$libpath/ios_frameworks";;
#        esac
#
#    done
#
#done
# cp -r "$out/Release/App.xcframework/ios-arm64_armv7/App.framework" "$libpath/ios_frameworks"
# cp -r "$out/Release/Flutter.xcframework/ios-arm64_armv7/Flutter.framework" "$libpath/ios_frameworks"
#echo "完成复制库文件到: $libpath"
