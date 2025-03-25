# Organize Photo and Video Files on Windows OS

This PowerShell script organizes photos and videos from a source directory into subfolders based on the year they were last modified. It separates photos and videos into distinct folders and ensures files are not duplicated.

## Features

- Automatically creates subfolders for each year.
- Separates photos and videos into different subfolders:
  - **Photos**: `YYYY Photo Reel`
  - **Videos**: `YYYY Video Reel`
- Skips files that already exist in the destination folder.
- Sorts directories in the destination folder by creation date.

## Requirements

- Windows operating system with PowerShell installed.
- Access to the source and destination directories.

## Usage

1. Clone or download this repository to your local machine.
2. Open the script file `OrganizePhotoVideoFiles.ps1` in a text editor or PowerShell.
3. Update the following variables in the script:
   - `$sourceDirectory`: Path to the folder containing your media files.
   - `$destinationDirectory`: Path to the folder where organized files will be stored.
4. Run the script in PowerShell:
   ```powershell
   .\OrganizePhotoVideoFiles.ps1
   ```

## Example

If your source directory contains the following files:
```
C:\Directory\Containing\MediaFiles
├── photo1.jpg (Last modified: 2023)
├── video1.mp4 (Last modified: 2022)
├── photo2.png (Last modified: 2023)
```

After running the script, the destination directory will look like this:
```
D:\Directory\For\OrganizedMediaFiles
├── 2022 Video Reel
│   └── video1.mp4
├── 2023 Photo Reel
    ├── photo1.jpg
    └── photo2.png
```

## Notes

- Supported file types:
  - Photos: `.jpg`, `.jpeg`, `.png`, `.heic`
  - Videos: `.mp4`, `.mov`, `.mpeg`, `.mpg`, `.3gp`
- Files that already exist in the destination folder will be skipped.

## Troubleshooting

- **Permission Denied**: Ensure you have read/write access to both the source and destination directories.
- **File Already Exists**: The script skips files that already exist in the destination folder to prevent overwriting.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Feel free to submit issues or pull requests to improve the script.

## Author

Created by **dswartz007**.
```

### Instructions:
1. Copy the content above.
2. Save it in a file named `README.md` in the root of your project directory.

Let me know if you need further assistance!
