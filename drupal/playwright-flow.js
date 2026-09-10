const { chromium } = require("playwright");
const microtime = require("microtime");

(async () => {
    console.log(microtime.now()," Launching Browser");
    const browser = await chromium.launch({
        headless: true,
        args: ["--no-sandbox", "--disable-setuid-sandbox"], // Otherwise it won't run on Docker
    });

    const page = await browser.newPage({
        viewport: {
            width: 1920,
            height: 1080,
        },
    });
    page.setDefaultTimeout(60000);

    try {
        const dimensions = await page.evaluate(() => {
            return {
                width: document.documentElement.clientWidth,
                height: document.documentElement.clientHeight,
                deviceScaleFactor: window.devicePixelRatio,
            };
        });
        // console.log("Dimensions:", dimensions); // Only to double-check if the dimensions are as expected

        console.log(microtime.now()," Home Page");
        await page.goto("http://drupal-apache:9876", {
            waitUntil: "networkidle",
        });

        await page.screenshot({ path: "/tmp/filled-form.png", fullPage: true });

        console.log(microtime.now()," Contact Page");
        await page.click("a[href='/contact/feedback']");
        await page.waitForSelector(".block__content form input");

        console.log(microtime.now()," Long Text Page");
        await page.click("a[href='/node/1']");

        await page.waitForSelector('xpath=//*[contains(text(), "Lorem ipsum dolor sit amet")]');

        console.log(microtime.now()," Closing Browser");
    } catch (err) {
        // A bare timeout doesn't say whether the click navigated at all, got blocked, or
        // landed on an error/access-denied page - print what the page actually was so the
        // next failure is diagnosable from the CI log instead of another blind guess.
        console.error("FAILURE DIAGNOSTICS");
        console.error("URL:", page.url());
        console.error("Title:", await page.title().catch(() => "<could not read title>"));
        const bodyText = await page.evaluate(() => document.body?.innerText?.slice(0, 2000)).catch(() => "<could not read body>");
        console.error("Body text (first 2000 chars):", bodyText);
        await page.screenshot({ path: "/tmp/failure.png", fullPage: true }).catch(() => {});
        throw err;
    } finally {
        await browser.close();
    }
})();
