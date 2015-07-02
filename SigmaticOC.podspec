Pod::Spec.new do |s|
  s.name     = 'SigmaticOC'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'Coaoa UI Platform and Utilities.'
  s.homepage = 'https://github.com/Sigmatic/SigmaticOC'
  s.authors  = { 'Hisham Alabri' => 'hisham@alabri.co' }
  s.source   = { :git => 'https://github.com/Sigmatic/SigmaticOC.git', :tag => s.version, :submodules => true }
  s.requires_arc = true

  s.ios.deployment_target = '6.0'

  s.public_header_files = 'SigmaticOC/*.h'
  s.source_files = 'SigmaticOC/SigmaticOC.h'

  s.subspec 'Array' do |ss|
    ss.dependency 'SigmaticOC/Number'
    ss.source_files = 'SigmaticOC/Array/*.{h,m}'
  end

  s.subspec 'Bool' do |ss|
    ss.source_files = 'SigmaticOC/Bool/*.{h,m}'
  end

  s.subspec 'Date' do |ss|
    ss.source_files = 'SigmaticOC/Date/*.{h,m}'
  end

  s.subspec 'Dictionary' do |ss|
      ss.source_files = 'SigmaticOC/Dictionary/*.{h,m}'
  end

  s.subspec 'JSON' do |ss|
      ss.source_files = 'SigmaticOC/JSON/*.{h,m}'
  end

  s.subspec 'Number' do |ss|
      ss.source_files = 'SigmaticOC/Number/*.{h,m}'
  end

  s.subspec 'Protocol' do |ss|
      ss.source_files = 'SigmaticOC/Protocol/*.{h,m}'
  end

  s.subspec 'String' do |ss|
        ss.source_files = 'SigmaticOC/String/*.{h,m}'
  end

end