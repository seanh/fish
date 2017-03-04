function add_to_path -d "Add a directory to $PATH, but only if the directory exists and is not already on $PATH"
    set directory $argv[1]

    if not test -e $directory
      return
    end

    if contains $directory $PATH
      return
    end

    set -x PATH $directory $PATH
end
