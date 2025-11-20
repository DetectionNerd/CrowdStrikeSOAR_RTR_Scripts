<h1><b>✨ Quick References for CrowdStrike Query Language</b></h1>
<hr>

<h2><b>1. Convert Epoch Time to DD Month YYYY, HH:MM:SS</b></h2>
<span style="color:#00aa00;"><!-- //"America/Los_Angeles" ≅ PST; "America/New_York" ≅ EST (https://library.humio.com/data-analysis/syntax-time-timezones.html) --></span>
<pre><code>|formatTime(format="%d %B %Y, %H:%M:%S", as="PacificTime", field="@timestamp", timezone="America/Los_Angeles")</code></pre>
<hr>

<h2><b>2. IP Geolocation</b></h2>
<span style="color:#00aa00;"><!-- //Use the fields - IP.country, IP.state, IP.city, IP.lat, IP.lon in  your table --></span>
<pre><code>| ipLocation(field=Vendor.ClientIP, as=IP)</code></pre>
<hr>

<h2><b>3. Rename</b></h2>
<pre><code>| rename("Vendor.response_code", as="ResponseCode")</code></pre>
<hr>

<h2><b>4. Change Text Case</b></h2>
<h3><b>Uppercase</b></h3>
<pre><code>| upper("Vendor.SHA256Hash", as=SHA256Hash)</code></pre>

<h3><b>Lowercase</b></h3>
<pre><code>| lower("Vendor.SHA256Hash", as=SHA256Hash)</code></pre>
<hr>

<h2><b>5. CIDR</b></h2>
<h3><b>Match CIDR</b></h3>
<pre><code>| cidr(aip, subnet=["130.130.130.130/24"])</code></pre>

<h3><b>Exclude CIDR</b></h3>
<pre><code>| !cidr(aip, subnet=["130.130.130.130/24"])</code></pre>
<hr>

<h2><b>6. Replace</b></h2>
<pre><code>| replace("_", with="@", field=Vendor.UserId, as="UserId")</code></pre>
<hr>

<h2><b>7. Case (convert specific field value to a custom string)</b></h2>
<pre><code>| case {
        LogonType = "2"  | LoginType := "Interactive" ;
        LogonType = "3"  | LoginType := "Network" ;
        * }</code></pre>
<hr>

<h2><b>8. Add a new field/column with an embedded link</b></h2>
<pre><code>| rootURL := "https://security.microsoft.com/quarantine?viewid=Files"<br><br>
| format("[Link To View Or Release File](%s)", field=[rootURL], as="M365Defender")</code></pre>
<hr>
