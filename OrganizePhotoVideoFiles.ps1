# Define the source directory containing the pictures and videos
$sourceDirectory = "C:\Directory\Containing\MediaFiles"

# Define the destination directory where the organized folders will be created
$destinationDirectory = "D:\Directory\For\OrganizedMediaFiles"

# Create the destination directory if it doesn't exist
if (-not (Test-Path -Path $destinationDirectory)) {
    New-Item -ItemType Directory -Path $destinationDirectory
}

# Get all pictures and videos in the source directory
$mediaFiles = Get-ChildItem -Path $sourceDirectory -Recurse -Include *.jpg, *.jpeg, *.png, *.mp4, *.mov, *.heic, *.mpeg, *.mpg, *.3gp

foreach ($file in $mediaFiles) {
    # Get the year the file was last modified
    $year = $file.LastWriteTime.Year

    # Determine the subfolder name based on the file extension
    if ($file.Extension -match "\.mp4$" -or $file.Extension -match "\.mov$" -or $file.Extension -match "\.mpeg$" -or $file.Extension -match "\.mpg$" -or $file.Extension -match "\.3gp$") {
        $subFolderName = "$year Swartz Video Reel"
    } else {
        $subFolderName = "$year Swartz Photo Reel"
    }

    # Determine the subfolder path
    $subFolderPath = Join-Path -Path $destinationDirectory -ChildPath $subFolderName

    # Check if the subfolder exists; if not, create it
    if (-not (Test-Path -Path $subFolderPath)) {
        New-Item -ItemType Directory -Path $subFolderPath
    }

    # Move the file to the appropriate subfolder if it doesn't already exist
    $destinationPath = Join-Path -Path $subFolderPath -ChildPath $file.Name
    if (-not (Test-Path -Path $destinationPath)) {
        Move-Item -Path $file.FullName -Destination $destinationPath
    } else {
        Write-Host "Skipping file '$($file.Name)' as it already exists in the destination."
    }
}

# Sort the directories in the destination folder by creation date
$sortedDirectories = Get-ChildItem -Path $destinationDirectory -Directory | Sort-Object -Property CreationTime

Write-Host "Sorted directories by creation date:"
foreach ($dir in $sortedDirectories) {
    Write-Host "$($dir.Name) - Created on $($dir.CreationTime)"
}

Write-Host "Media files have been organized successfully."