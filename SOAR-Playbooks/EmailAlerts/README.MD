<h2><b>NG-SIEM Detection Email Alert Playbook</b></h2>
<img src="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/SOAR-Playbooks/EmailAlerts/PlaybookImages/2.10.png">
<hr>

<h4><b>1. Configure detection in Next-Gen SIEM >  > <a href="https://https://falcon.us-2.crowdstrike.com//xdr/rules"> Rules </a></b></h4>
<hr>

<h4><b>2. Go to Fusion SOAR > Workflows > Create Workflow > <a href="https://https://falcon.us-2.crowdstrike.com//workflow/fusion/new">Create Workflow from Scratch</a></b></h4>
<hr>

<h4><b>3. Trigger → NG-SIEM Detection</b></h4>
<img src="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/SOAR-Playbooks/EmailAlerts/PlaybookImages/2.1.png">
<hr>

<h4><b>4. Condition (define detection) → Name = Enter the detection name created in Step 1</b></h4>
<img src="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/SOAR-Playbooks/EmailAlerts/PlaybookImages/2.2.png">
<hr>

<h4><b>5. Action → Create Event Query → Workflow Specific Query</b></h4>
<img src="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/SOAR-Playbooks/EmailAlerts/PlaybookImages/2.3.png">
<img src="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/SOAR-Playbooks/EmailAlerts/PlaybookImages/2.4.png">

<h5><b>5.1 Paste the query used in detection → Check the “Automatically generate schema” box → Run the query and ensure it generated results → Click Next</b></h5>
<img src="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/SOAR-Playbooks/EmailAlerts/PlaybookImages/2.5.png">

<h5><b>5.2 Check the Output Schema tab and ensure all the fields are configured correctly → Close</b></h5>
<img src="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/SOAR-Playbooks/EmailAlerts/PlaybookImages/2.6.png">

<h5><b>5.3 Under “CSV header fields to export” → search and select all the fields you want to get in final alert/report</b></h5>
<img src="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/SOAR-Playbooks/EmailAlerts/PlaybookImages/2.7.png">
<hr>

<h4><b>6. Configure Loop (for each)</b></h4>
<img src="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/SOAR-Playbooks/EmailAlerts/PlaybookImages/2.8.png">
<hr>

<h4><b>7. Action (email alert) → Configure final email alert format (copy and paste <a href="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/SOAR-Playbooks/EmailAlerts/EmailAlertTemplate1.html"> Template 1</a> OR <a href="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/SOAR-Playbooks/EmailAlerts/EmailAlertTemplate2-EmbedLink.html"> Template 2</a>) in the message box</b></h4>
<img src="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/SOAR-Playbooks/EmailAlerts/PlaybookImages/2.9.png">
<hr>

<h4><b>8. Final Flow Chart</b></h4>
<img src="https://github.com/DetectionNerd/CrowdStrikeSOAR_RTR_Scripts/blob/main/SOAR-Playbooks/EmailAlerts/PlaybookImages/2.10.png">
<hr>

