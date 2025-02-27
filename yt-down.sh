#!/data/data/com.termux/files/usr/bin/bash

# Prompt user for the desired file name
read -p "Enter the desired output file name (without extension): " filename

# Prompt user for the desired video quality
echo "Select the video quality:"
echo "1) 1080p"
echo "2) 720p"
echo "3) 480p"
echo "4) 360p"
read -p "Enter the number corresponding to your choice: " quality_option

# Map user input to the appropriate yt-dlp format string
case $quality_option in
    1)
        quality="bestvideo[height=1080]+bestaudio"
        ;;
    2)
        quality="bestvideo[height=720]+bestaudio"
        ;;
    3)
        quality="bestvideo[height=480]+bestaudio"
        ;;
    4)
        quality="bestvideo[height=360]+bestaudio"
        ;;
    *)
        echo "Invalid choice. Defaulting to 1080p."
        quality="bestvideo[height=1080]+bestaudio"
        ;;
esac

# Add .mp4 extension to the file name
output_file="${filename}.mp4"

# Define the YouTube URL
video_url=$(termux-clipboard-get)

# Run yt-dlp to download the video
yt-dlp -f "$quality" -o "$output_file" "$video_url"

# Notify the user
echo "Download completed! File saved as $output_file"
