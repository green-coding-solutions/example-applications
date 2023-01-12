const puppeteer = require("puppeteer");
const microtime = require("microtime");

(async () => {
    console.log(microtime.now()," Launching Browser");
    const browser = await puppeteer.launch({
        defaultViewport: {
            width: 1920,
            height: 1080,
        },
        headless: true,
        executablePath: "/usr/bin/chromium-browser",
        args: ["--no-sandbox", "--disable-setuid-sandbox"], // Otherwise it won't run on Docker
    });

    const page = await browser.newPage();
    const dimensions = await page.evaluate(() => {
        return {
            width: document.documentElement.clientWidth,
            height: document.documentElement.clientHeight,
            deviceScaleFactor: window.devicePixelRatio,
        };
    });
    // console.log("Dimensions:", dimensions); // Only to double-check if the dimensions are as expected

    console.log(microtime.now()," Home Page");
    await page.goto("http://gcb-wordpress-apache:9875", {
        waitUntil: "networkidle2",
    });

    await page.screenshot({ path: "/tmp/filled-form.png", fullPage: true });

    console.log(microtime.now()," Contact Page");
    await page.click("a[href='http://gcb-wordpress-apache:9875/?page_id=34']");
    await page.waitForSelector(".wpcf7 form input");

    console.log(microtime.now()," Long Text Page");
    await page.click("a[href='http://gcb-wordpress-apache:9875/?page_id=36']");

    await page.waitForXPath('//*[contains(text(), "Lorem ipsum dolor sit amet")]')

    console.log(microtime.now()," Closing Browser");
    await browser.close();
})();
