Pod::Spec.new do |spec|
  spec.name             = 'RSASHA1Signer'
  spec.version          = '1.0'
  spec.license          = { :type => 'BSD' }
  spec.homepage         = 'https://github.com/digitalbrain/RSASHA1Signer_iOs.git'
  spec.authors          = { 'Digital Brain' => 'digitalbrain@nomailhere.com' }
  spec.summary          = 'RSASHA1Signer'
  spec.source           = { :git => 'https://github.com/digitalbrain/RSASHA1Signer_iOs'}
  spec.source_files     = 'RSASHA1Signer/**/*.{h,m,a}'
  spec.xcconfig         = { 'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/RSASHA1Signer/RSASHA1Signer/openSSL',
                            'LIBRARY_SEARCH_PATHS' => '${PODS_ROOT}/RSASHA1Signer/RSASHA1Signer/openSSL/include'
                             }
  spec.requires_arc     = true
end

