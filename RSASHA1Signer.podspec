Pod::Spec.new do |spec|
  spec.name             = 'RSASHA1Signer'
  spec.version          = '1.0'
  spec.license          = { :type => 'BSD' }
  spec.homepage         = 'https://github.com/digitalbrain/RSASHA1Signer_iOs.git'
  spec.authors          = { 'Digital Brain' => 'digitalbrain@nomailhere.com' }
  spec.summary          = 'RSASHA1Signer'
  spec.source           = { :git => 'https://github.com/digitalbrain/RSASHA1Signer_iOs'}
  spec.source_files     = 'RSASHA1Signer/*.{h,m,a}'
  spec.requires_arc     = true
end