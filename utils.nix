{ lib }: rec {
  getModulesFromDir = dir:
    if lib.pathExists (lib.path.append dir "default.nix") then
      [ (lib.path.append dir "default.nix") ]
    else
      lib.lists.unique (builtins.map (lib.path.append dir) (lib.attrNames
        (lib.attrsets.filterAttrs
          (name: type: type == "regular" && lib.strings.hasSuffix ".nix" name)
          (builtins.readDir dir))));
  getModulesFromDirs = dirs:
    lib.lists.unique (lib.lists.flatten (builtins.map getModulesFromDir dirs));
  getModulesFromDirRec = dir:
    if lib.pathExists (lib.path.append dir "default.nix") then
      [ dir ]
    else
      lib.lists.unique (lib.lists.flatten (lib.mapAttrsToList (name: type:
        (lib.optional (type == "regular" && lib.strings.hasSuffix ".nix" name)
          (lib.path.append dir name)) ++ (lib.optional (type == "directory")
            (getModulesFromDirRec (lib.path.append dir name))))
        (builtins.readDir dir)));
  getModulesFromDirsRec = dirs:
    lib.lists.unique
    (lib.lists.flatten (builtins.map getModulesFromDirRec dirs));
}

