
Pod::Spec.new do |s|
  s.name         = "SMOSmContact"
  s.version      = "1.0.0"
  s.summary      = "SMOSmContact"
  s.description  = <<-DESC
                  SMOSmContact
                   DESC
  s.homepage     = ""
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/author/SMOSmContact.git", :tag => "master" }
  s.source_files  = "SMOSmContact/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  