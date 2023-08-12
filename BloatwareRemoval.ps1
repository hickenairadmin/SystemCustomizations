# Tested successfully on Windows 11 Enterprise
# DELL 5430 Latitude

# This script will remove the following apps:
$APPS = @(
	'Dell Peripheral Manager' #Dell Peripheral Manager
	'DellInc.DellCommandUpdate_htrsf667h5kn2' #Dell Command | Update
	'DellInc.DellDigitalDelivery_htrsf667h5kn2' #Dell Digital Delivery
	'DellInc.DellOptimizer_htrsf667h5kn2' #Dell Optimizer
	'DellInc.DellPowerManager_htrsf667h5kn2' #Dell Power Manager
	'DellInc.DellSupportAssistforPCs_htrsf667h5kn2' #Dell SupportAssist for Home PCs
	'DellInc.PartnerPromo_htrsf667h5kn2' #Partner Promo
	'9P1J8S7CCWWT' #Microsoft Clipchamp
	'Microsoft.BingNews_8wekyb3d8bbwe' #Microsoft News
	'Microsoft.BingWeather_8wekyb3d8bbwe' #MSN Weather
	'Microsoft.GamingApp_8wekyb3d8bbwe' #Xbox
	'Microsoft.Getstarted_8wekyb3d8bbwe' #Microsoft Tips
	'Microsoft.MSPaint_8wekyb3d8bbwe' #Paint 3D
	'Microsoft.Microsoft3DViewer_8wekyb3d8bbwe' #3D Viewer
	'Microsoft.MicrosoftOfficeHub_8wekyb3d8bbwe' #Microsoft 365 (Office)
	'Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe' #Solitaire & Casual Games
	'Microsoft.MicrosoftStickyNotes_8wekyb3d8bbwe' #Microsoft Sticky Notes
	'Microsoft.MixedReality.Portal_8wekyb3d8bbwe' #Mixed Reality Portal
	'Microsoft.Office.OneNote_8wekyb3d8bbwe' #OneNote for Windows 10
	'OneNoteFreeRetail - en-us' #OneNote DELL Bloatware
	'OneNoteFreeRetail - es-es' #OneNote DELL Bloatware
	'OneNoteFreeRetail - fr-fr' #OneNote DELL Bloatware
	'OneNoteFreeRetail - pt-br' #OneNote DELL Bloatware
	'Microsoft.Paint_8wekyb3d8bbwe' #Paint
	'Microsoft.People_8wekyb3d8bbwe' #Microsoft People
	'Microsoft.PowerAutomateDesktop_8wekyb3d8bbwe' #Power Automate
	'Microsoft.ScreenSketch_8wekyb3d8bbwe' #Snipping Tool
	'Microsoft.SkypeApp_kzf8qxf38zg5c' #Skype
	'Microsoft.Todos_8wekyb3d8bbwe' #Microsoft To Do
	'Microsoft.WindowsFeedbackHub_8wekyb3d8bbwe' #Feedback Hub
	'Microsoft.WindowsMaps_8wekyb3d8bbwe' #Windows Maps
	'Microsoft.WindowsNotepad_8wekyb3d8bbwe' #Windows Notepad
	'Microsoft.WindowsSoundRecorder_8wekyb3d8bbwe' #Windows Voice Recorder
	'Microsoft.Xbox.TCUI_8wekyb3d8bbwe' #Xbox TCUI
	'Microsoft.XboxApp_8wekyb3d8bbwe' #Xbox Console Companion
	'Microsoft.XboxGameOverlay_8wekyb3d8bbwe' #Xbox Game Bar Plugin
	'Microsoft.XboxGamingOverlay_8wekyb3d8bbwe' #Xbox Game Bar
	'Microsoft.XboxIdentityProvider_8wekyb3d8bbwe' #Xbox Identity Provider
	'Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe' #Xbox Game Speech Window
	'Microsoft.YourPhone_8wekyb3d8bbwe' #Phone Link
	'Microsoft.ZuneMusic_8wekyb3d8bbwe' #Windows Media Player
	'Microsoft.ZuneVideo_8wekyb3d8bbwe' #Movies & TV
	'MicrosoftTeams_8wekyb3d8bbwe' #Microsoft Teams
	'O365HomePremRetail - en-us' #Microsoft 365 - en-us
	'O365HomePremRetail - es-es' #Microsoft 365 - es-es
	'O365HomePremRetail - fr-fr' #Microsoft 365 - fr-fr
	'O365HomePremRetail - pt-br' #Microsoft 365 - pt-br
	'microsoft.windowscommunicationsapps_8wekyb3d8bbwe' #Mail and Calendar
	'{17268bdc-8263-4bc2-a5e2-7de6ce0122bd}' #Dell SupportAssist Remediation
	'{286A9ADE-A581-43E8-AA85-6F5D58C7DC88}' #Dell Optimizer Core
	'{2a8bafd6-22ae-4d0e-87a4-686b2a4a2ab0}' #Dell SupportAssist OS Recovery Plugin for Del
	'{3E3B2B7F-B114-4EB0-B957-276A0FACC730}' #ExpressConnect Drivers & Services
	'{5BC2B5AB-80DE-4E83-B8CF-426902051D0A}' #Realtek Card Reader
	'{6250A087-31F9-47E2-A0EF-56ABF31B610E}' #Dell Core Services
	'{A21A0E9A-A083-47C6-AEAA-695348A25779}' #Dell Digital Delivery Services
	'{A8DFE386-5055-48F6-95C9-8DF312812625}' #Dell Power Manager Service
	'{D5BD7604-A1C8-47DC-8C0A-70F9BED27245}' #Dell SupportAssist
)

# Communicate with the user
Write-Host -NoNewline "Checking for WinGet Now ..."
# Make sure that winget is installed
if (!(Get-Command winget -ErrorAction SilentlyContinue)) {
	# Download and install winget
	Write-Host " not found, so we are installing WinGet Now ..."
	Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe
} else {
	Write-Host " found."
}

# Communicate with the user
Write-Host "Checking for Bloatware Now ..."
# Loop through the apps and uninstall them
foreach ($APP in $APPS){
	# Check if the app is installed
	Write-Host -NoNewline "`tChecking for `'$APP`' now ..."
	if (winget list --query $APP){
		# Uninstall the app
		Write-Host " found!"
		winget uninstall --id $APP --force --purge
	} else {
		Write-Host " not found."
	}
}
Write-Host "Bloatware Removal Complete!"
