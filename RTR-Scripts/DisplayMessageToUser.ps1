$Message = -join

(

            " If you see this message, please email us at ITHelpDesk@example.com or call us at 000-000-0000 to inform us about the physical location of this device. We have been trying to locate it"

)

$strCmd = "c:\WINDOWS\system32\msg.exe * /time:999999" + $Message

iex $strCmd
