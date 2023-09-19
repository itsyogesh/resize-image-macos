on run {input, parameters}
    -- Define list of sizes
    set sizeList to {"80", "160","320", "480", "640", "800", "1024", "1280", "1920", "2560"}

    -- Ask user to choose a size
    set chosenSize to choose from list sizeList with prompt "Select the desired size:" default items {"1280"}
    if chosenSize is false then
        -- User cancelled
        return
    end if
    set chosenSize to item 1 of chosenSize as integer

    tell application "Finder"
        repeat with anItem in input
            set itemPath to (quoted form of (POSIX path of anItem))
            set itemParent to (quoted form of (POSIX path of (parent of anItem as alias)))
            set itemName to name of anItem
            set baseName to name of anItem
            set itemExtension to name extension of anItem
            
            if (itemName contains ".") then
                set baseName to (text 1 through ((offset of "." in itemName) - 1) of itemName)
            end if
            
            -- Define a temporary path for resizing
            set tempPath to itemParent & "/" & baseName & "_temp." & itemExtension
            
            -- Use sips command to resize the image to the temporary path
            do shell script "sips -Z " & chosenSize & " " & itemPath & " --out " & tempPath
            
            -- Get new dimensions of the resized image
            set dimensions to do shell script "sips -g pixelWidth -g pixelHeight " & tempPath & " | awk '/pixelWidth/ {width=$2} /pixelHeight/ {height=$2} END {print width \"x\" height}'"
            
            set newPath to itemParent & "/" & baseName & "_" & dimensions & "." & itemExtension
            
            -- Rename the temporary resized file with new dimensions
            do shell script "mv " & tempPath & " " & newPath
        end repeat
    end tell
    return input
end run
