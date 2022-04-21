# SYNOPSIS
Converts a hashtable to a yml.
    
# DESCRIPTION
Converts a hashtable to a yml(string). Recursively, any depth of hashtable should be up to.

# PARAMETER input_hashtable
The hastable is what we want to transform. Required for the function.

# PARAMETER depth
At what depth it is currently in the hashtable, as it will have to be tabulated in yaml as a function of this. We do not need to enter it when calling the function.

# EXAMPLE
ConvertFrom-Hashtable $hashtable
