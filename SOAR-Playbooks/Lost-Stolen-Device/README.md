<h2><b>Lost/Stolen Device Playbook</b></h2>
<hr>

<h4><b>1. Configure Script in Falcon Console > Host Setup and Management > Response Scripts and Files > <a href="https://falcon.us-2.crowdstrike.com/real-time-response/scripts/custom-scripts">Custom Scripts</a></b></h4>
<p>Copy and paste the script from <a href="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/RTR-Scripts/Lost-Stolen-Device-Script.ps1">./DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/</a></a></p>
<hr>

<h4><b>2. Go to Fusion SOAR > Workflows > Create Workflow > <a href="https://https://falcon.us-2.crowdstrike.com//workflow/fusion/new">Create Workflow from Scratch</a></b></h4>
<hr>

<h4><b>3. Trigger → Host State → Visibility → All</b></h4>
<hr>

<h4><b>4. Condition (defining target host) → Host Group=Lost-Stolen Devices</b></h4>
<hr>

<h4><b>5. Action → Network Contain Device</b></h4>
<hr>

<h4><b>6. Action (email alert) → Email SOC to inform a stolen/lost device was found online, has been network contained and will be bricked in a few seconds</b></h4>
<hr>

<h4><b>7. Condition (validate os) → Host OS = Windows</b></h4>
<hr>

<h4><b>8. Action (RTR/powershell script to brick device) → Search for the script created in Step 1</b></h4>
<hr>

<h4><b>9. Action (email alert) → Email SOC to inform them about script run completion, credential removal and  BitLocker Key revocation</b></h4>
<hr>

<h4><b>10. Final Flow Chart</b></h4>
<hr>

