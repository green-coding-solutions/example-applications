from time import time_ns
from playwright.sync_api import sync_playwright

def log_note(message: str) -> None:
    timestamp = str(time_ns())[:16]
    print(f"{timestamp} {message}")

with sync_playwright() as playwright:
    log_note('Launching browser')

    browser = playwright.chromium.launch(headless=True)
    context = browser.new_context(ignore_https_errors=True, viewport={"width": 1920, "height": 1080})
    page = context.new_page()

    dimensions = page.evaluate("""
        () => {
            return {
                width: document.documentElement.clientWidth,
                height: document.documentElement.clientHeight,
                deviceScaleFactor: window.devicePixelRatio,
            }
        }
    """)
    # print("Dimensions:", dimensions)  # Optional check

    log_note('Home Page')
    page.goto("http://gcb-wordpress:9875", wait_until="networkidle")


    if not page.locator('p#logo').is_visible():
        page.locator('p#logo').wait_for(state="visible", timeout=30) # if we call this directly it can error if element is already visible. very annoying

    # Example of navigating to another page:
    # page.goto("http://gcb-wordpress:9875/my-sample-page", wait_until="networkidle")

    log_note('Closing browser')
    browser.close()
