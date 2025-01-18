Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Create a form
$Form = New-Object System.Windows.Forms.Form
$Form.Text = "Renee Toolbox"
$Form.Size = New-Object System.Drawing.Size(566, 769)  # Adjust the initial size of the form
$Form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle  # Disable resizing
$Form.MaximizeBox = $false  # Disable maximize button
$Form.MinimizeBox = $false  # Disable minimize button

# Set the background color to grey (System.Drawing.Color::Gray is a predefined color)
$Form.BackColor = [System.Drawing.Color]::Gray

# Define the font
$Font = New-Object System.Drawing.Font("Helvetica", 12)

# Set the form icon to the default PowerShell icon
$iconPath = [System.IO.Path]::Combine([System.Environment]::SystemDirectory, "WindowsPowerShell\\v1.0\\powershell.exe")
$Form.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($iconPath)

# Create buttons
$ButtonWidth = 200  # Adjust the width of the buttons
$ButtonHeight = 40  # Adjust the height of the buttons

# Create a ToolsGroupBox for the "Tools" section
$ToolsGroupBox = New-Object System.Windows.Forms.GroupBox
$ToolsGroupBox.Text = "Tools"
$ToolsGroupBox.Location = New-Object System.Drawing.Point(10, 10)
$ToolsGroupBox.Size = New-Object System.Drawing.Size(260, 340)
$ToolsGroupBoxLabelFont = New-Object System.Drawing.Font("Helvetica", 14)  # Adjust the font size here
$ToolsGroupBox.Font = $ToolsGroupBoxLabelFont # Set the font for the ToolsGroupBox label
$Form.Controls.Add($ToolsGroupBox)

# Create buttons for the ToolsGroupBoxes
$ToolsYPosition = 30  # Initial Y position for the buttons

# Control Panel Button

$ControlPanelButton = New-Object System.Windows.Forms.Button
$ControlPanelButton.Text = "Control Panel"
$ControlPanelButton.Location = New-Object System.Drawing.Point(30, $ToolsYPosition)
$ControlPanelButton.Size = New-Object System.Drawing.Size($ButtonWidth, $ButtonHeight)
$ControlPanelButton.Font = $Font
$ControlPanelButton.Add_Click({
    # Open Control Panel
    control.exe
})
$ToolsGroupBox.Controls.Add($ControlPanelButton)
$ToolsYPosition += $ButtonHeight + 10  # Adjust the vertical spacing

# Network Connections Button

$NetworkConnectionsButton = New-Object System.Windows.Forms.Button
$NetworkConnectionsButton.Text = "Network Connections"
$NetworkConnectionsButton.Location = New-Object System.Drawing.Point(30, $ToolsYPosition)
$NetworkConnectionsButton.Size = New-Object System.Drawing.Size($ButtonWidth, $ButtonHeight)
$NetworkConnectionsButton.Font = $Font
$NetworkConnectionsButton.Add_Click({
    # Open Network Connections
    control.exe ncpa.cpl
})
$ToolsGroupBox.Controls.Add($NetworkConnectionsButton)
$ToolsYPosition += $ButtonHeight + 10  # Adjust the vertical spacing

# Programs And Features Button

$ProgramsAndFeaturesButton = New-Object System.Windows.Forms.Button
$ProgramsAndFeaturesButton.Text = "Programs and Features"
$ProgramsAndFeaturesButton.Location = New-Object System.Drawing.Point(30, $ToolsYPosition)
$ProgramsAndFeaturesButton.Size = New-Object System.Drawing.Size($ButtonWidth, $ButtonHeight)
$ProgramsAndFeaturesButton.Font = $Font
$ProgramsAndFeaturesButton.Add_Click({
    # Open Programs and Features
    control.exe appwiz.cpl
})
$ToolsGroupBox.Controls.Add($ProgramsAndFeaturesButton)
$ToolsYPosition += $ButtonHeight + 10  # Adjust the vertical spacing

# Computer Management Button

$ComputerManagementButton = New-Object System.Windows.Forms.Button
$ComputerManagementButton.Text = "Computer Management"
$ComputerManagementButton.Location = New-Object System.Drawing.Point(30, $ToolsYPosition)
$ComputerManagementButton.Size = New-Object System.Drawing.Size($ButtonWidth, $ButtonHeight)
$ComputerManagementButton.Font = $Font
$ComputerManagementButton.Add_Click({
    # Open Computer Management
    compmgmt.msc
})
$ToolsGroupBox.Controls.Add($ComputerManagementButton)
$ToolsYPosition += $ButtonHeight + 10  # Adjust the vertical spacing

# Registry Editor Button

$RegeditButton = New-Object System.Windows.Forms.Button
$RegeditButton.Text = "Registry Editor"
$RegeditButton.Location = New-Object System.Drawing.Point(30, $ToolsYPosition)
$RegeditButton.Size = New-Object System.Drawing.Size($ButtonWidth, $ButtonHeight)
$RegeditButton.Font = $Font
$RegeditButton.Add_Click({
    # Open Registry Editor
    regedit
})
$ToolsGroupBox.Controls.Add($RegeditButton)
$ToolsYPosition += $ButtonHeight + 10  # Adjust the vertical spacing

# Power Options Button

$PowerOptionsButton = New-Object System.Windows.Forms.Button
$PowerOptionsButton.Text = "Power Options"
$PowerOptionsButton.Location = New-Object System.Drawing.Point(30, $ToolsYPosition)
$PowerOptionsButton.Size = New-Object System.Drawing.Size($ButtonWidth, $ButtonHeight)
$PowerOptionsButton.Font = $Font
$PowerOptionsButton.Add_Click({
    # Open Power Options
    powercfg.cpl
})
$ToolsGroupBox.Controls.Add($PowerOptionsButton)
$ToolsYPosition += $ButtonHeight + 10  # Adjust the vertical spacing

# Create a GroupBox for the "Tweaks" section

$TweaksGroupBox = New-Object System.Windows.Forms.GroupBox
$TweaksGroupBox.Text = "Tweaks"
$TweaksGroupBox.Location = New-Object System.Drawing.Point(280, 10)  # Adjust the X position to the right
$TweaksGroupBox.Size = New-Object System.Drawing.Size(260, 340)
$TweaksGroupBoxLabelFont = New-Object System.Drawing.Font("Helvetica", 14)  # Adjust the font size here
$TweaksGroupBox.Font = $TweaksGroupBoxLabelFont  # Set the font for the "Tweaks" GroupBox label
$Form.Controls.Add($TweaksGroupBox)

# Create buttons for the tweaks inside the "Tweaks" GroupBox
$TweaksYPosition = 30  # Initial Y position for the "Tweaks" buttons

# Show File Extensions

$ShowFileExtensionsButton = New-Object System.Windows.Forms.CheckBox
$ShowFileExtensionsButton.Text = "Show File Extensions"
$ShowFileExtensionsButton.Location = New-Object System.Drawing.Point(30, $TweaksYPosition)
$ShowFileExtensionsButton.Size = New-Object System.Drawing.Size($ButtonWidth, $ButtonHeight)
$ShowFileExtensionsButton.Font = $Font
$TweaksGroupBox.Controls.Add($ShowFileExtensionsButton)
$TweaksYPosition += $ButtonHeight + 10
function ShowFileExtensions {
    if((Test-Path -LiteralPath "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced") -ne $true) {  New-Item "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -force -ea SilentlyContinue };
    New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
#    taskkill.exe /F /IM "explorer.exe"
#    cmd.exe /c 'start "" "%windir%\explorer.exe"'
    Start-Sleep 2
}
function UndoShowFileExtensions {
    if((Test-Path -LiteralPath "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced") -ne $true) {  New-Item "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -force -ea SilentlyContinue };
    New-ItemProperty -LiteralPath 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
#    taskkill.exe /F /IM "explorer.exe"
#    cmd.exe /c 'start "" "%windir%\explorer.exe"'
    Start-Sleep 2
}
# Enable Dark Mode

$DarkModeCheckbox = New-Object System.Windows.Forms.CheckBox
$DarkModeCheckbox.Text = "Enable Dark Mode"
$DarkModeCheckbox.Location = New-Object System.Drawing.Point(30, $TweaksYPosition)
$DarkModeCheckbox.Size = New-Object System.Drawing.Size($ButtonWidth, $ButtonHeight)
$DarkModeCheckbox.Font = $Font
$TweaksGroupBox.Controls.Add($DarkModeCheckbox)
$TweaksYPosition += $ButtonHeight + 10
function DarkMode {
    if ((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize") -ne $true) { New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -force -ea SilentlyContinue };
    New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
    New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'SystemUsesLightTheme' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
}
function UndoDarkMode {
    if ((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize") -ne $true) { New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -force -ea SilentlyContinue };
    New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
    New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'SystemUsesLightTheme' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
}

# Computer Info

$ComputerInfoButton = New-Object System.Windows.Forms.CheckBox
$ComputerInfoButton.Text = "Computer Info"
$ComputerInfoButton.Location = New-Object System.Drawing.Point(30, $TweaksYPosition)
$ComputerInfoButton.Size = New-Object System.Drawing.Size($ButtonWidth, $ButtonHeight)
$ComputerInfoButton.Font = $Font
$TweaksGroupBox.Controls.Add($ComputerInfoButton)
$TweaksYPosition += $ButtonHeight + 10
function Get-ComputerInfoToFile {
    $outputPath = [System.Environment]::GetFolderPath("Desktop") + "\Computer Info.txt"
    $computerInfo = Get-ComputerInfo -Property "CsManufacturer", "CsModel", "OsName", "CsProcessors", "OSDisplayVersion", "CsName", "CsUserName", "CsDomain", "CsSystemType"

    # Check if the file already exists, and if so, remove it
    if (Test-Path -Path $outputPath) {
        Remove-Item -Path $outputPath -Force
    }

    # Save the Get-ComputerInfo output to a text file
    $computerInfo | Out-File -FilePath $outputPath

    Write-Output "Computer information saved to $outputPath."
}

# Disk Clean Up

$DiskCleanUpButton = New-Object System.Windows.Forms.CheckBox
$DiskCleanUpButton.Text = "Disk Clean Up"
$DiskCleanUpButton.Location = New-Object System.Drawing.Point(30, $TweaksYPosition)
$DiskCleanUpButton.Size = New-Object System.Drawing.Size($ButtonWidth, $ButtonHeight)
$DiskCleanUpButton.Font = $Font
$TweaksGroupBox.Controls.Add($DiskCleanUpButton)
$TweaksYPosition += $ButtonHeight + 10
function DiskCleanUp {
    cleanmgr.exe /d C: /VERYLOWDISK
    Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
}

# Create the "Run Tweaks" button
$RunTweaksButton = New-Object System.Windows.Forms.Button
$RunTweaksButton.Text = "Run Tweaks"
$RunTweaksButton.Location = New-Object System.Drawing.Point(30, $TweaksYPosition)
$RunTweaksButton.Size = New-Object System.Drawing.Size($ButtonWidth, $ButtonHeight)
$RunTweaksButton.Font = $Font
$TweaksGroupBox.Controls.Add($RunTweaksButton)
$TweaksYPosition += $ButtonHeight + 10
$RunTweaksButton.Add_Click({
    if ($DarkModeCheckbox.Checked) {
        DarkMode  # Call the DarkMode function only when the checkbox is checked
    }
    if ($ShowFileExtensionsButton.Checked) {
        ShowFileExtensions
    }
    if ($DiskCleanUpButton.Checked) {
        DiskCleanUp
    }
    if ($ComputerInfoButton.Checked) {
        Get-ComputerInfoToFile
    }
})

# Create the "Undo Selected Tweaks" button
$UndoSelectedTweaksButton = New-Object System.Windows.Forms.Button
$UndoSelectedTweaksButton.Text = "Undo Selected Tweaks"
$UndoSelectedTweaksButton.Location = New-Object System.Drawing.Point(30, $TweaksYPosition)
$UndoSelectedTweaksButton.Size = New-Object System.Drawing.Size($ButtonWidth, $ButtonHeight)
$UndoSelectedTweaksButton.Font = $Font
$TweaksGroupBox.Controls.Add($UndoSelectedTweaksButton)
$TweaksYPosition += $ButtonHeight + 10
$UndoSelectedTweaksButton.Add_Click({
    if ($DarkModeCheckbox.Checked) {
        UndoDarkMode
    }
    if ($ShowFileExtensionsButton.Checked) {
        UndoShowFileExtensions
    }
})

# Create a GroupBox for the "Winget" section
$WingetGroupBox = New-Object System.Windows.Forms.GroupBox
$WingetGroupBox.Text = "Winget"
$WingetGroupBox.Location = New-Object System.Drawing.Point(10, 360)  # Adjust the X position to the right
$WingetGroupBox.Size = New-Object System.Drawing.Size(530, 350)
$WingetGroupBoxLabelFont = New-Object System.Drawing.Font("Helvetica", 14)  # Adjust the font size here
$WingetGroupBox.Font = $WingetGroupBoxLabelFont  # Set the font for the "Winget" GroupBox label
$Form.Controls.Add($WingetGroupBox)

# Create the "Install" button
$InstallButton = New-Object System.Windows.Forms.Button
$InstallButton.Text = "Install Selection"
$InstallButton.Location = New-Object System.Drawing.Point(190, 20)  # Adjust the X and Y positions
$InstallButton.Size = New-Object System.Drawing.Size(150, 30)  # Adjust the width and height
$InstallButton.Font = $Font
$WingetGroupBox.Controls.Add($InstallButton)
$InstallButton.Add_Click({
    if ($BrowsersButton1.Checked) {
        ChromeInstall  # Call the ChromeInstall function only when the checkbox is checked
    }
    if ($BrowsersButton2.Checked) {
        FirefoxInstall
    }
    if ($BrowsersButton3.Checked) {
        BraveInstall
    }
    if ($BrowsersButton4.Checked) {
        ChromiumInstall
    }
    if ($BrowsersButton5.Checked) {
        ThoriumInstall
    }
    if ($BrowsersButton6.Checked) {
        WaterFoxInstall
    }
    if ($BrowsersButton7.Checked) {
        LibreWolfInstall
    }
    if ($BrowsersButton8.Checked) {
        VivaldiInstall
    }
    if ($DevelopmentButton1.Checked) {
        DockerInstall
    }
    if ($DevelopmentButton2.Checked) {
        GitHubInstall
    }
    if ($DevelopmentButton3.Checked) {
        GitInstall
    }
    if ($DevelopmentButton4.Checked) {
        VSCodeInstall
    }
    if ($DevelopmentButton5.Checked) {
        Python3Install
    }
    if ($DevelopmentButton6.Checked) {
        NodeJSInstall
    }
    if ($DevelopmentButton7.Checked) {
        Java8Install
    }
    if ($UtilitiesButton1.Checked) {
        7zipInstall
    }
    if ($UtilitiesButton2.Checked) {
        BitwardenInstall
    }
    if ($UtilitiesButton3.Checked) {
        KeePassInstall
    }
    if ($UtilitiesButton4.Checked) {
        PowerToysInstall
    }
    if ($UtilitiesButton5.Checked) {
        DDUInstall
    }
    if ($UtilitiesButton6.Checked) {
        NVCleanstallInstall
    }
})

# Create the "Upgrade" button
$UpgradeButton = New-Object System.Windows.Forms.Button
$UpgradeButton.Text = "Upgrade All"
$UpgradeButton.Location = New-Object System.Drawing.Point(359, 20)  # Adjust the X and Y positions
$UpgradeButton.Size = New-Object System.Drawing.Size(150, 30)  # Adjust the width and height
$UpgradeButton.Font = $Font
$WingetGroupBox.Controls.Add($UpgradeButton)
$UpgradeButton.Add_Click({
    UpgradeAll
})
function UpgradeAll {
    Start-Process "winget" -ArgumentList "upgrade --all" -Wait
}

# Create the "Browsers" inner GroupBox
$BrowsersGroupBox = New-Object System.Windows.Forms.GroupBox
$BrowsersGroupBox.Text = "Browsers"
$BrowsersGroupBox.Location = New-Object System.Drawing.Point(21, 60)  # Adjust the X position
$BrowsersGroupBox.Size = New-Object System.Drawing.Size(150, 278)  # Adjust the size as needed
$BrowsersGroupBoxLabelFont = New-Object System.Drawing.Font("Helvetica", 12)  # Adjust the font size here
$BrowsersGroupBox.Font = $BrowsersGroupBoxLabelFont  # Set the font for the "Browsers" GroupBox label
$WingetGroupBox.Controls.Add($BrowsersGroupBox)

# Create buttons for the "Browsers" inner GroupBox
$BrowsersButton1 = New-Object System.Windows.Forms.CheckBox
$BrowsersButton1.Text = "Chrome"
$BrowsersButton1.Location = New-Object System.Drawing.Point(20, 30)  # Adjust the X and Y positions
$BrowsersGroupBox.Controls.Add($BrowsersButton1)
function ChromeInstall {
    Start-Process "winget" -ArgumentList "install Google.Chrome" -Wait
}

# Create buttons for the "Browsers" inner GroupBox
$BrowsersButton2 = New-Object System.Windows.Forms.CheckBox
$BrowsersButton2.Text = "Firefox"
$BrowsersButton2.Location = New-Object System.Drawing.Point(20, 60)  # Adjust the X and Y positions
$BrowsersGroupBox.Controls.Add($BrowsersButton2)
function FirefoxInstall {
    Start-Process "winget" -ArgumentList "install Mozilla.Firefox" -Wait
}

# Create buttons for the "Browsers" inner GroupBox
$BrowsersButton3 = New-Object System.Windows.Forms.CheckBox
$BrowsersButton3.Text = "Brave"
$BrowsersButton3.Location = New-Object System.Drawing.Point(20, 90)  # Adjust the X and Y positions
$BrowsersGroupBox.Controls.Add($BrowsersButton3)
function BraveInstall {
    Start-Process "winget" -ArgumentList "install Brave.Brave" -Wait
}

# Create buttons for the "Browsers" inner GroupBox
$BrowsersButton4 = New-Object System.Windows.Forms.CheckBox
$BrowsersButton4.Text = "Chromium"
$BrowsersButton4.Location = New-Object System.Drawing.Point(20, 120)  # Adjust the X and Y positions
$BrowsersGroupBox.Controls.Add($BrowsersButton4)
function ChromiumInstall {
    Start-Process "winget" -ArgumentList "install Hibbiki.Chromium" -Wait
}

# Create buttons for the "Browsers" inner GroupBox
$BrowsersButton5 = New-Object System.Windows.Forms.CheckBox
$BrowsersButton5.Text = "Thorium"
$BrowsersButton5.Location = New-Object System.Drawing.Point(20, 150)  # Adjust the X and Y positions
$BrowsersGroupBox.Controls.Add($BrowsersButton5)
function ThoriumInstall {
    Start-Process "winget" -ArgumentList "install EDRLab.Thorium" -Wait
}

# Create buttons for the "Browsers" inner GroupBox
$BrowsersButton6 = New-Object System.Windows.Forms.CheckBox
$BrowsersButton6.Text = "Waterfox"
$BrowsersButton6.Location = New-Object System.Drawing.Point(20, 180)  # Adjust the X and Y positions
$BrowsersGroupBox.Controls.Add($BrowsersButton6)
function WaterFoxInstall {
    Start-Process "winget" -ArgumentList "install Waterfox.Waterfox" -Wait
}

# Create buttons for the "Browsers" inner GroupBox
$BrowsersButton7 = New-Object System.Windows.Forms.CheckBox
$BrowsersButton7.Text = "LibreWolf"
$BrowsersButton7.Location = New-Object System.Drawing.Point(20, 210)  # Adjust the X and Y positions
$BrowsersGroupBox.Controls.Add($BrowsersButton7)
function LibreWolfInstall {
    Start-Process "winget" -ArgumentList "install LibreWolf.LibreWolf" -Wait
}

# Create buttons for the "Browsers" inner GroupBox
$BrowsersButton8 = New-Object System.Windows.Forms.CheckBox
$BrowsersButton8.Text = "Vivaldi"
$BrowsersButton8.Location = New-Object System.Drawing.Point(20, 240)  # Adjust the X and Y positions
$BrowsersGroupBox.Controls.Add($BrowsersButton8)
function VivaldiInstall {
    Start-Process "winget" -ArgumentList "install VivaldiTechnologies.Vivaldi" -Wait
}

# Update the Y position for the next set of buttons
$WingetYPosition += 120  # Adjust the value based on the height of the "Browsers" GroupBox

# Create the "Development" inner GroupBox
$DevelopmentGroupBox = New-Object System.Windows.Forms.GroupBox
$DevelopmentGroupBox.Text = "Development"
$DevelopmentGroupBox.Location = New-Object System.Drawing.Point(190, 60)  # Adjust the X position
$DevelopmentGroupBox.Size = New-Object System.Drawing.Size(150, 278)  # Adjust the size as needed
$DevelopmentGroupBoxLabelFont = New-Object System.Drawing.Font("Helvetica", 12)  # Adjust the font size here
$DevelopmentGroupBox.Font = $DevelopmentGroupBoxLabelFont  # Set the font for the "Development" GroupBox label
$WingetGroupBox.Controls.Add($DevelopmentGroupBox)

# Create buttons for the "Development" inner GroupBox
$DevelopmentButton1 = New-Object System.Windows.Forms.CheckBox
$DevelopmentButton1.Text = "Docker Desktop"
$DevelopmentButton1.Size = New-Object System.Drawing.Size(120, 40)  # Adjust the width and height
$DevelopmentButton1.Location = New-Object System.Drawing.Point(20, 25)  # Adjust the X and Y positions
$DevelopmentGroupBox.Controls.Add($DevelopmentButton1)
function DockerInstall {
    Start-Process "winget" -ArgumentList "install Docker.DockerDesktop" -Wait
}

# Create buttons for the "Development" inner GroupBox
$DevelopmentButton2 = New-Object System.Windows.Forms.CheckBox
$DevelopmentButton2.Text = "GitHub Desktop"
$DevelopmentButton2.Size = New-Object System.Drawing.Size(120, 40)  # Adjust the width and height
$DevelopmentButton2.Location = New-Object System.Drawing.Point(20, 70)  # Adjust the X and Y positions
$DevelopmentGroupBox.Controls.Add($DevelopmentButton2)
function GitHubInstall {
    Start-Process "winget" -ArgumentList "install GitHub.GitHubDesktop" -Wait
}

# Create buttons for the "Development" inner GroupBox
$DevelopmentButton3 = New-Object System.Windows.Forms.CheckBox
$DevelopmentButton3.Text = "Git"
$DevelopmentButton3.Location = New-Object System.Drawing.Point(20, 115)  # Adjust the X and Y positions
$DevelopmentGroupBox.Controls.Add($DevelopmentButton3)
function GitInstall {
    Start-Process "winget" -ArgumentList "install Git.Git" -Wait
}

# Create buttons for the "Development" inner GroupBox
$DevelopmentButton4 = New-Object System.Windows.Forms.CheckBox
$DevelopmentButton4.Text = "VS Code"
$DevelopmentButton4.Size = New-Object System.Drawing.Size(120, 40)  # Adjust the width and height
$DevelopmentButton4.Location = New-Object System.Drawing.Point(20, 140)  # Adjust the X and Y positions
$DevelopmentGroupBox.Controls.Add($DevelopmentButton4)
function VSCodeInstall {
    Start-Process "winget" -ArgumentList "install Microsoft.VisualStudioCode" -Wait
}

# Create buttons for the "Development" inner GroupBox
$DevelopmentButton5 = New-Object System.Windows.Forms.CheckBox
$DevelopmentButton5.Text = "Python3"
$DevelopmentButton5.Location = New-Object System.Drawing.Point(20, 180)  # Adjust the X and Y positions
$DevelopmentGroupBox.Controls.Add($DevelopmentButton5)
function Python3Install {
    Start-Process "winget" -ArgumentList "install Python.Python.3.11" -Wait
}

# Create buttons for the "Development" inner GroupBox
$DevelopmentButton6 = New-Object System.Windows.Forms.CheckBox
$DevelopmentButton6.Text = "NodeJS"
$DevelopmentButton6.Size = New-Object System.Drawing.Size(120, 40)  # Adjust the width and height
$DevelopmentButton6.Location = New-Object System.Drawing.Point(20, 205)  # Adjust the X and Y positions
$DevelopmentGroupBox.Controls.Add($DevelopmentButton6)
function NodeJSInstall {
    Start-Process "winget" -ArgumentList "install OpenJS.NodeJS" -Wait
}

# Create buttons for the "Development" inner GroupBox
$DevelopmentButton7 = New-Object System.Windows.Forms.CheckBox
$DevelopmentButton7.Text = "Java 8"
$DevelopmentButton7.Size = New-Object System.Drawing.Size(120, 40)  # Adjust the width and height
$DevelopmentButton7.Location = New-Object System.Drawing.Point(20, 235)  # Adjust the X and Y positions
$DevelopmentGroupBox.Controls.Add($DevelopmentButton7)
function Java8Install {
    Start-Process "winget" -ArgumentList "install Oracle.JavaRuntimeEnvironment" -Wait
}

# Update the Y position for the next set of buttons
$WingetYPosition += 120  # Adjust the value based on the height of the "Development" GroupBox

# Create the "Utilities" inner GroupBox
$UtilitiesGroupBox = New-Object System.Windows.Forms.GroupBox
$UtilitiesGroupBox.Text = "Utilities"
$UtilitiesGroupBox.Location = New-Object System.Drawing.Point(359, 60)  # Adjust the X position
$UtilitiesGroupBox.Size = New-Object System.Drawing.Size(150, 278)  # Adjust the size as needed
$UtilitiesGroupBoxLabelFont = New-Object System.Drawing.Font("Helvetica", 12)  # Adjust the font size here
$UtilitiesGroupBox.Font = $UtilitiesGroupBoxLabelFont  # Set the font for the "Utilities" GroupBox label
$WingetGroupBox.Controls.Add($UtilitiesGroupBox)

# Create buttons for the "Utilities" inner GroupBox
$UtilitiesButton1 = New-Object System.Windows.Forms.CheckBox
$UtilitiesButton1.Text = "7-Zip"
$UtilitiesButton1.Location = New-Object System.Drawing.Point(20, 39)  # Adjust the X and Y positions
$UtilitiesGroupBox.Controls.Add($UtilitiesButton1)
function 7zipInstall {
    Start-Process "winget" -ArgumentList "install 7zip.7zip" -Wait
}

# Create buttons for the "Utilities" inner GroupBox
$UtilitiesButton2 = New-Object System.Windows.Forms.CheckBox
$UtilitiesButton2.Text = "Bitwarden"
$UtilitiesButton2.Location = New-Object System.Drawing.Point(20, 77)  # Adjust the X and Y positions
$UtilitiesGroupBox.Controls.Add($UtilitiesButton2)
function BitwardenInstall {
    Start-Process "winget" -ArgumentList "install Bitwarden.Bitwarden" -Wait
}

# Create buttons for the "Utilities" inner GroupBox
$UtilitiesButton3 = New-Object System.Windows.Forms.CheckBox
$UtilitiesButton3.Text = "KeePassXC"
$UtilitiesButton3.Location = New-Object System.Drawing.Point(20, 115)  # Adjust the X and Y positions
$UtilitiesGroupBox.Controls.Add($UtilitiesButton3)
function KeePassInstall {
    Start-Process "winget" -ArgumentList "install KeePassXCTeam.KeePassXC" -Wait
}

# Create buttons for the "Utilities" inner GroupBox
$UtilitiesButton4 = New-Object System.Windows.Forms.CheckBox
$UtilitiesButton4.Text = "PowerToys"
$UtilitiesButton4.Size = New-Object System.Drawing.Size(120, 40)  # Adjust the width and height
$UtilitiesButton4.Location = New-Object System.Drawing.Point(20, 145)  # Adjust the X and Y positions
$UtilitiesGroupBox.Controls.Add($UtilitiesButton4)
function PowerToysInstall {
    Start-Process "winget" -ArgumentList "install Microsoft.PowerToys" -Wait
}

# Create buttons for the "Utilities" inner GroupBox
$UtilitiesButton5 = New-Object System.Windows.Forms.CheckBox
$UtilitiesButton5.Text = "DDU"
$UtilitiesButton5.Location = New-Object System.Drawing.Point(20, 191)  # Adjust the X and Y positions
$UtilitiesGroupBox.Controls.Add($UtilitiesButton5)
function DDUInstall {
    Start-Process "winget" -ArgumentList "install ddu" -Wait
}

# Create buttons for the "Utilities" inner GroupBox
$UtilitiesButton6 = New-Object System.Windows.Forms.CheckBox
$UtilitiesButton6.Text = "NVCleanstall"
$UtilitiesButton6.Size = New-Object System.Drawing.Size(120, 40)  # Adjust the width and height
$UtilitiesButton6.Location = New-Object System.Drawing.Point(20, 221)  # Adjust the X and Y positions
$UtilitiesGroupBox.Controls.Add($UtilitiesButton6)
function NVCleanstallInstall {
    Start-Process "winget" -ArgumentList "install TechPowerUp.NVCleanstall" -Wait
}

# Update the Y position for the next set of buttons if needed
$WingetYPosition += 120  # Adjust the value based on the height of the "Utilities" GroupBox

# Show the form
$Form.ShowDialog()