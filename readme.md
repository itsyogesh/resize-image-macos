# macOS Image Resizer Quick Action

A simple and efficient macOS Quick Action to resize images directly from the Finder context menu. Whether you're working with a single image or multiple ones, resize them seamlessly with this tool.

![Demo Screenshot](URL_TO_YOUR_SCREENSHOT)

## Installation

1. Clone the repository or [download the zip file](./build/Resize%20Image(s).zip). 
   `git clone git@github.com/itsyogesh/resize-image-macos`
2. If downloaded, unzip the `Resize Image(s).zip` file.
3. Double-click on `Resize Image(s).workflow` to install the Quick Action.
4. When prompted, click 'Install'. The service will be added to Finder's context menu.

## About Automator

Automator is a macOS app that lets you automate repetitive tasks without the need for complex scripting or programming. With Automator, you can create workflows, which are a series of actions that perform tasks, like renaming files, creating PDFs, or resizing images. These workflows can be saved as "Quick Actions" and accessed directly from the Finder context menu.


## Usage

1. Right-click (or control-click) on an image or multiple images in Finder.
2. Navigate to the `Services` or `Quick Actions` submenu and select `Resize Image(s)`.
3. Choose the desired size from the dropdown menu. Your images will be resized and saved with the new dimensions in their filenames.

## Customizing Resize Options

To add or remove sizes from the dropdown:

1. Open the `.workflow` file in Automator.
2. Locate the AppleScript within the workflow.
3. Modify the `sizeList` variable to include the sizes you want. For example:

```applescript
set sizeList to {"80", "160","320", "480", "640", "800", "1024", "1280", "1920", "2560"}
```


### How to Open Automator:

1. Press `Cmd + Space` to open Spotlight.
2. Type "Automator" and hit `Enter`.
3. Alternatively, you can find Automator in your Applications folder.