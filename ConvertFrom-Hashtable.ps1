<#
    .SYNOPSIS
     Converts a hashtable to a yml.
    
    .DESCRIPTION
     Converts a hashtable to a yml(string). Recursively, any depth of hashtable should be up to.

    .PARAMETER input_hashtable
     The hastable is what we want to transform. Required for the function.

    .PARAMETER depth
     At what depth it is currently in the hashtable, as it will have to be tabulated in yaml as a function of this. We do not need to enter it when calling the function.

    .EXAMPLE
     # Convert a hashtable to yml(string).
     ConvertFrom-Hashtable $hashtable
#>

function ConvertFrom-Hashtable {
    param (
        [Parameter(Mandatory=$true)]
        [hashtable] $input_hashtable,
        [Parameter(Mandatory=$false)]
        [Int32] $depth = 0
    )

    [string] $output = ""
    foreach ($key in $input_hashtable.Keys)
    {
        [string] $row = ""
        if ($input_hashtable[$key] -is [hashtable])
        {
            $depth++
            $result = ConvertFrom-Hashtable $input_hashtable[$key] $depth
            $depth--
        }

        for ($spaces = 0; $spaces -lt $depth * 4; $spaces++)
        {
            $row += " "
        }

        if ($input_hashtable[$key] -is [hashtable])
        {
            $row += $key + ": `r`n" + $result
        }
        else {
            $row += $key + ": " + $input_hashtable[$key] + "`r`n"
        }

        $output += $row
    }

    return $output
}