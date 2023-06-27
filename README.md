# Website-Vulnerabilitiy-Scanner-Using-python
This is a Python-based Terminal application which is designed to identify any potential security flaws and vulnerabilities in websites. With its robust scanning capabilities and intelligent algorithms, it thoroughly analyzes web applications, identifies weaknesses, and provides actionable insights to enhance website security.


 * make sure to change directory path in the bash script.
 * try to run this in a virtual environment.
 * make sure to install all the presequsites as given in the requirements.txt file.

# How xss.py works 

1. The necessary modules are imported:
   - `requests`: Allows sending HTTP requests to the target URL.
   - `BeautifulSoup` (imported as `bs`): Used for parsing HTML content and extracting information from it.
   - `urljoin` from `urllib.parse`: Helps in joining the base URL with the form's action URL.

2. The `scan_xss` function is defined, which takes a `url` parameter representing the target URL to scan for XSS vulnerabilities.

3. Inside the `scan_xss` function:
   - The content of the target URL is retrieved using `requests.get`.
   - The HTML content is parsed using `BeautifulSoup` with the "html.parser" parser.
   - All `<form>` elements are found using `find_all("form")`.
   - The number of detected forms is printed.

4. A JavaScript payload (`js_script`) is defined. This payload will be used to test for XSS vulnerabilities by injecting it into input fields.

5. The script iterates over each form found on the target URL:
   - The `action` attribute of the form (representing the form's action URL) is extracted and converted to lowercase.
   - The `method` attribute of the form (representing the HTTP method) is extracted and converted to lowercase.
   - The input fields of the form are extracted and stored in a list of dictionaries (`inputs`). Each dictionary contains the input field's type and name.
   - For input fields of type "text" or "search," the value is replaced with the `js_script`. This is done to inject the JavaScript payload into those fields.
   - The input data is collected and stored in a dictionary (`data`). The dictionary maps input names to their corresponding values.
   - The target URL for form submission is created by joining the base URL (`url`) and the form's action URL using `urljoin`.
   - The payload data is submitted to the target URL using either a POST or GET request, depending on the form's method.
   - The response from the target URL is received.
   - If the response content contains the `js_script`, it indicates a possible XSS vulnerability. In that case:
     - Information about the vulnerable form, including the action URL, method, and input fields, is printed.
     - The `is_vulnerable` flag is set to `True`.

6. The `is_vulnerable` flag is returned from the `scan_xss` function. If `is_vulnerable` is `True`, it means at least one form was found to be vulnerable to XSS.

7. Finally, if the script is executed directly (not imported as a module), it retrieves the target URL from the command-line arguments using `sys.argv[1]`. The `scan_xss` function is called with the target URL, and the result is printed.

It detects forms on a given URL, injects a JavaScript payload into certain input fields, submits the forms, and checks if the response contains the payload. If it does, it indicates a potential XSS vulnerability.
