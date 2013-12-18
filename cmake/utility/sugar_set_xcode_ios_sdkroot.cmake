# Copyright (c) 2013, Ruslan Baratov
# All rights reserved.

include(sugar_add_this_to_sourcelist)
sugar_add_this_to_sourcelist()

include(CMakeParseArguments) # CMAKE_PARSE_ARGUMENTS
include(sugar_status_print)
include(sugar_target_add_framework)
include(sugar_test_file_exists)
include(sugar_test_target_exists)

function(sugar_set_xcode_ios_sdkroot)
  set(one_arg TARGET PLIST)
  CMAKE_PARSE_ARGUMENTS(X "" "${one_arg}" "" ${ARGV})
  if(X_UNPARSED_ARGUMENTS)
    sugar_fatal_error("Unparsed: ${X_UNPARSED_ARGUMENTS}")
  endif()

  if(NOT X_TARGET)
    sugar_fatal_error("TARGET not found")
  endif()

  sugar_test_target_exists(${X_TARGET})

  set_target_properties(
      ${X_TARGET}
      PROPERTIES
      XCODE_ATTRIBUTE_SDKROOT
      "iphoneos"
  )

  set_target_properties(
      ${X_TARGET}
      PROPERTIES
      XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY
      "iPhone Developer"
  )

  set_target_properties(
      ${X_TARGET}
      PROPERTIES
      XCODE_ATTRIBUTE_ARCHS
      "$(ARCHS_STANDARD_INCLUDING_64_BIT)"
  )

  if(X_PLIST)
    sugar_status_print("Info.plist source: ${X_PLIST}")
    sugar_test_file_exists("${X_PLIST}")
    set_target_properties(
        ${X_TARGET}
        PROPERTIES
        MACOSX_BUNDLE_INFO_PLIST
        "${X_PLIST}"
    )
  endif()

  # add default frameworks
  sugar_target_add_framework(${X_TARGET} CoreGraphics)
  sugar_target_add_framework(${X_TARGET} Foundation)
  sugar_target_add_framework(${X_TARGET} UIKit)
endfunction()
