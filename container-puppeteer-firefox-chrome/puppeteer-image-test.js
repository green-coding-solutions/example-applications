const puppeteer = require("puppeteer");
const microtime = require('microtime');

(async () => {
    console.log(microtime.now()," Launching Browser");
    const browser = await puppeteer.launch({
        defaultViewport: {
            width: 1920,
            height: 1080,
        },
        product: "firefox",
        headless: false,
        executablePath: "/usr/bin/firefox"
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
    await page.goto("https://www.green-coding.org", { // for this example we are running on port 80
        waitUntil: "load",
    });

    await page.waitForSelector(".data-content-one");
    const text = await page.$eval('.credits', element => element.textContent)
    console.log(microtime.now(),` Found text content: ${text}`);

    console.log(microtime.now()," Closing Browser");
    await browser.close();
})();
