

Pod::Spec.new do |s|

#私有仓库名称
  s.name         = "TCrm"

#私有仓库版本
  s.version      = "1.0.1"

#私有仓库介绍
  s.summary      = "CRM日志上传库封装"

#github上的地址
  s.homepage     = "https://github.com/zhy790026943/TCrm"

#私有仓库需要的证书
  s.license      = "MIT"

#注册邮箱和用户名
  s.author             = { "张扬" => "zhangyang@taihe.com" }

  s.platform     = :ios

#github上的地址
  s.source       = { :git => "https://github.com/zhy790026943/TCrm.git", :tag => s.version }

#对外共享的 .h和.m
  s.source_files  = "TCrm/Class/**/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

#支持ARC
   s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end







