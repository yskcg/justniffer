BEGIN {
D["PACKAGE_NAME"]=" \"justniffer\""
D["PACKAGE_TARNAME"]=" \"justniffer\""
D["PACKAGE_VERSION"]=" \"0.5.13\""
D["PACKAGE_STRING"]=" \"justniffer 0.5.13\""
D["PACKAGE_BUGREPORT"]=" \"info@plecno.com\""
D["PACKAGE_URL"]=" \"\""
D["JUSTNIFFER_VERSION"]=" \"0.5.13\""
D["PACKAGE"]=" \"justniffer\""
D["VERSION"]=" \"0.5.13\""
D["HAVE_LIB_PCAP"]=" /**/"
D["PACKAGE"]=" \"justniffer\""
D["VERSION"]=" \"0.5.13\""
D["STDC_HEADERS"]=" 1"
D["HAVE_SYS_TYPES_H"]=" 1"
D["HAVE_SYS_STAT_H"]=" 1"
D["HAVE_STDLIB_H"]=" 1"
D["HAVE_STRING_H"]=" 1"
D["HAVE_MEMORY_H"]=" 1"
D["HAVE_STRINGS_H"]=" 1"
D["HAVE_INTTYPES_H"]=" 1"
D["HAVE_STDINT_H"]=" 1"
D["HAVE_UNISTD_H"]=" 1"
D["HAVE_SYS_TIME_H"]=" 1"
D["HAVE_STRFTIME"]=" 1"
D["HAVE__BOOL"]=" 1"
D["HAVE_STDBOOL_H"]=" 1"
D["TIME_WITH_SYS_TIME"]=" 1"
D["HAVE_DLFCN_H"]=" 1"
D["LT_OBJDIR"]=" \".libs/\""
D["HAVE_LIB_PCAP"]=" 1"
D["HAVE_BOOST"]=" 1"
D["HAVE_BOOST_REGEX_HPP"]=" 1"
D["HAVE_BOOST_PROGRAM_OPTIONS_HPP"]=" 1"
D["HAVE_BOOST_IOSTREAMS_DEVICE_FILE_DESCRIPTOR_HPP"]=" 1"
  for (key in D) D_is_set[key] = 1
  FS = ""
}
/^[\t ]*#[\t ]*(define|undef)[\t ]+[_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ][_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]*([\t (]|$)/ {
  line = $ 0
  split(line, arg, " ")
  if (arg[1] == "#") {
    defundef = arg[2]
    mac1 = arg[3]
  } else {
    defundef = substr(arg[1], 2)
    mac1 = arg[2]
  }
  split(mac1, mac2, "(") #)
  macro = mac2[1]
  prefix = substr(line, 1, index(line, defundef) - 1)
  if (D_is_set[macro]) {
    # Preserve the white space surrounding the "#".
    print prefix "define", macro P[macro] D[macro]
    next
  } else {
    # Replace #undef with comments.  This is necessary, for example,
    # in the case of _POSIX_SOURCE, which is predefined and required
    # on some systems where configure will not decide to define it.
    if (defundef == "undef") {
      print "/*", prefix defundef, macro, "*/"
      next
    }
  }
}
{ print }
