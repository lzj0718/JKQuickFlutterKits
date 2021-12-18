class Tool {
  //获取资源图片
  static String getImage(String name) {
    String temp = 'assets/image/';
    //补全路径
    if (!name.contains(temp)) {
      temp = 'assets/image/$name';
    }
    //补全类型
    if (!temp.contains('png')) {
      temp = '$temp.png';
    }
    return temp;
  }
}
