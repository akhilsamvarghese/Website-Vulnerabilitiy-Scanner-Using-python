import requests
from bs4 import BeautifulSoup as bs
from urllib.parse import urljoin


def scan_xss(url):
    """
    Given a `url`, it scans for XSS vulnerable forms and returns True if any are vulnerable, False otherwise.
    """
    forms = bs(requests.get(url).content, "html.parser").find_all("form")
    print(f"[+] Detected {len(forms)} forms on {url}.")

    js_script = "<script>alert('hi')</script>"
    is_vulnerable = False

    for form in forms:
        action = form.attrs.get("action", "").lower()
        method = form.attrs.get("method", "get").lower()

        inputs = []
        for input_tag in form.find_all("input"):
            input_type = input_tag.attrs.get("type", "text")
            input_name = input_tag.attrs.get("name")
            inputs.append({"type": input_type, "name": input_name})

        data = {}
        for input in inputs:
            if input["type"] in ["text", "search"]:
                input["value"] = js_script
            input_name = input.get("name")
            input_value = input.get("value")
            if input_name and input_value:
                data[input_name] = input_value

        target_url = urljoin(url, action)
        print(f"[+] Submitting malicious payload to {target_url}")
        print(f"[+] Data: {data}")

        if method == "post":
            response = requests.post(target_url, data=data)
        else:
            response = requests.get(target_url, params=data)

        if js_script in response.content.decode():
            print(f"[+] XSS Detected on {url}")
            print(f"[*] Form details:")
            print(f"Action: {action}")
            print(f"Method: {method}")
            print(f"Inputs: {inputs}")
            is_vulnerable = True

    return is_vulnerable


if __name__ == "__main__":
    import sys
    url = sys.argv[1]
    print(scan_xss(url))
