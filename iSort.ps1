# THE EXTENSIONS WAS FOUND HERE https://www.computerhope.com/issues/ch001789.htm 


# First to get the path to sort
$Current_path = (Get-Item -Path ".\").FullName
# make the main and sub folders for the sorted files
$Main_folder = "$Current_path\iSort"
$Sub_floders = "$Main_folder\music\","$Main_folder\videos\","$Main_folder\documents\","$Main_folder\compressed\","$Main_folder\softwares\","$Main_folder\images\","$Main_folder\others\"
# check if the main folder is exists >>> in short the sript has been run before ?
try
{
        New-Item -ItemType directory -Path $Main_folder
        New-Item -ItemType directory $Sub_floders
}
catch [System.IO.IOException],[System.UnauthorizedAccessException]
{
    WriteOutput $_.Exception.Message
    WriteOutput $_.FullyQualifiedErrorId
    Continue 
}
# move sound files to iSort\music path
# Note ! that you can add another sound extensions to $Sound_Extensions list 
[String[]]$Sound_Extensions = @(".mp3", ".wma", ".wav", ".ra", ".ram", ".rm", ".mid", ".ogg", ".aif")
foreach ($extension in $Sound_Extensions){
    $Targets = Get-ChildItem $Current_path\*$extension
    foreach ($Target in $Targets) {
        Move-Item -Path $Target -Destination $Main_folder\music\
        $Target
    }
}
# move video files to iSort\video path
# Note ! that you can add another video extensions to $Video_Extensions list 
[String[]]$Video_Extensions = @(".mp4", ".wmv", ".3gp", ".avi", ".flv", ".mov", ".mkv", ".amv", ".m4v", "mpg", "mpeg")
foreach ($extension in $Video_Extensions){
    $Targets = Get-ChildItem $Current_path\*$extension
    foreach ($Target in $Targets) {
        Move-Item -Path $Target -Destination $Main_folder\videos\
        $Target
    }
}
# move documents files to iSort\documents path
# Note ! that you can add another document extensions to $Document_Extensions list 
[String[]]$Document_Extensions = @(".doc", ".docx", ".pptx", ".ppt", ".key", ".odp", ".pdf"
                                    , ".pps", ".txt", ".xlr", ".xls", ".xlsx", ".odt", ".wks", ".wps", ".rtf", ".htm", ".html")
foreach ($extension in $Document_Extensions){
    $Targets = Get-ChildItem $Current_path\*$extension
    foreach ($Target in $Targets) {
        Move-Item -Path $Target -Destination $Main_folder\documents\
        $Target
    }
}
# move program and software files to iSort\softwares path
# Note ! that you can add another program and executable extensions to $Program_Extensions list 
[String[]]$Program_Extensions = @(".exe", ".msi", ".bat", ".bin", ".com", ".jar", ".py", ".wsf",".apk")
foreach ($extension in $Program_Extensions){
    $Targets = Get-ChildItem $Current_path\*$extension
    foreach ($Target in $Targets) {
        Move-Item -Path $Target -Destination $Main_folder\softwares\
        $Target
    }
}
# move compressed files to iSort\compressed path
# Note ! that you can add another compressed extensions to $Compressed_Extensions list 
[String[]]$Compressed_Extensions = @(".zip", ".rar", ".7z", ".arj", ".deb", ".pkg", ".rpm", ".tar.gz", ".z")
foreach ($extension in $Compressed_Extensions){
    $Targets = Get-ChildItem $Current_path\*$extension
    foreach ($Target in $Targets) {
        Move-Item -Path $Target -Destination $Main_folder\compressed\
        $Target
    }
}
# move Images files to iSort\images path
# Note ! that you can add another images extensions to $Images_Extensions list 
[String[]]$Images_Extensions = @(".bmp", ".gif", ".jpeg", ".jpg", ".png", ".svg", ".tif", ".tiff", ".ico")
foreach ($extension in $Images_Extensions){
    $Targets = Get-ChildItem $Current_path\*$extension
    foreach ($Target in $Targets) {
        Move-Item -Path $Target -Destination $Main_folder\images\
        $Target
    }
}

# move Images files to iSort\images path
$Targets = Get-ChildItem $Current_path\*.*
    foreach ($Target in $Targets) {
        Move-Item -Path $Target -Destination $Main_folder\images\
        $Target
    }
