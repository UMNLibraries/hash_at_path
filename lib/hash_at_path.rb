require "hash_at_path/version"
require "hash_at_path/path"
require "hash_at_path/core_ext/hash/at_path"

Hash.include HashAtPath::CoreExt::Hash::AtPath
