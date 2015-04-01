Pod::Spec.new do |s|
  s.name                = "VideoCore"
  s.version             = "0.3.0.3"
  s.summary             = "An audio and video manipulation and streaming pipeline with support for RTMP."
  s.description      = <<-DESC
                          This is a work-in-progress library with the
                          intention of being an audio and video manipulation
                          and streaming pipeline for iOS.
                          DESC
  s.homepage            = "https://github.com/jgh-/VideoCore"
  s.license             = 'MIT'
  s.authors             = { "James Hurley" => "jamesghurley@gmail.com" }
  # s.source              = { :git => "https://github.com/wao813/VideoCore", :tag => s.version.to_s }
  # s.source              = { path: '../..' }
  s.requires_arc        = false

  s.header_dir          = 'videocore'
  s.header_mappings_dir = '.'

  s.libraries           = 'c++'

  s.dependency          'boost', '~> 1.51.0'
  s.dependency          'glm', '~> 0.9.4.6'
  s.dependency          'UriParser-cpp', '~> 0.1.3'

  s.xcconfig            = { "HEADER_SEARCH_PATHS" => "${PODS_ROOT}/boost" }

  # Before we can get OS X deployment working, we'll need to use sub-specs to
  # separate out the source files for OS X vs. iOS
  s.subspec 'OSX' do |sx|
    sx.source_files        = [ 'mixers/*.h*', 'mixers/*.cpp', 'mixers/*.m*', 
                            'mixers/Apple/*.h*', 'mixers/Apple/*.cpp', 'mixers/Apple/*.m*',
                            'mixers/OSX/*.h*', 'mixers/OSX/*.cpp', 'mixers/OSX/*.m*',
                            'rtmp/**/*.h*', 'rtmp/**/*.cpp', 'rtmp/**/*.m*',
                            'sources/*.h*', 'sources/*.cpp', 'sources/*.m*',
                            'sources/Apple/*.h*', 'sources/Apple/*.cpp', 'sources/Apple/*.m*',
                            'sources/OSX/*.h*', 'sources/OSX/*.cpp', 'sources/OSX/*.m*',
                            'stream/**/*.h*', 'stream/**/*.cpp', 'stream/**/*.m*',
                            'system/**/*.h*', 'system/**/*.cpp', 'system/**/*.m*',
                            'transforms/*.h*', 'transforms/*.cpp', 'transforms/*.m*',
                            'transforms/Apple/*.h*', 'transforms/Apple/*.cpp', 'transforms/Apple/*.m*',
                            'transforms/OSX/*.h*', 'transforms/OSX/*.cpp', 'transforms/OSX/*.m*',
                            'transforms/RTMP/*.h*', 'transforms/RTMP/*.cpp', 'transforms/RTMP/*.m*',
                            'api/OSX/*.h*', 'api/OSX/*.m*',
                            'filters/**/*.cpp', 'filters/**/*.h*' ]
    sx.frameworks          = [ 'VideoToolbox', 'AudioToolbox', 'AVFoundation', 'CFNetwork', 'CoreMedia',
                            'CoreVideo', 'OpenGL', 'Foundation', 'CoreGraphics' ]

    s.osx.deployment_target = '10.7'
  end
end
