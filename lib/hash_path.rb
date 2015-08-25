require "hash_path/version"
require "hash_path/path"
require "hash_path/core_ext/hash/at_path"

Hash.include HashesToHashes::CoreExt::Hash::AtPath
