<h2><b>✨ Lost/Stolen Device Playbook</b></h2>
<hr>

<h4><b>1. Configure Script in Falcon Console > Host Setup and Management > Response Scripts and Files > Custom Scripts (https://https://falcon.us-2.crowdstrike.com//real-time-response/scripts/custom-scripts)</b></h4>
<pre><code></code></pre>
<hr>

<h4><b>2. Go to Fusion SOAR > Workflows > Create Workflow > Create Workflow from Scratch (https://https://falcon.us-2.crowdstrike.com//workflow/fusion/new)</b></h4>
<pre><code></code></pre>
<hr>

<h4><b>3. Trigger → Host State → Visibility → All</b></h4>
<pre><code></code></pre>
<hr>

<h4><b>4. Condition (defining target host) → Host Group=Lost-Stolen Devices</b></h4>
<h4><b>Uppercase</b></h4>
<pre><code></code></pre>

<h4><b>5. Action → Network Contain Device</b></h4>
<h4><b>Match CIDR</b></h4>
<pre><code></code></pre>

<h4><b>6. Action (email alert) → Email SOC to inform a stolen/lost device was found online, has been network contained and will be bricked in a few seconds</b></h4>
<pre><code></code></pre>
<hr>

<h4><b>7. Condition (validate os) → Host OS = Windows</b></h4>
<pre><code></code></pre>
<hr>

<h4><b>8. Action (RTR/powershell script to brick device) → Search for the script created in Step 1</b></h4>
<pre><code></code></pre>
<hr>

<h4><b>9. Action (email alert) → Email to SOC inform them about script run completion and  BitLocker Key revocation</b></h4>
<pre><code></code></pre>
<hr>

<h4><b>8. Final Flow Chart</b></h4>
<pre><code></code></pre>
<hr>

