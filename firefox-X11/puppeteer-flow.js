const puppeteer = require("puppeteer");
const microtime = require('microtime');

(async () => {
    console.log(microtime.now()," Launching Browser");
    const browser = await puppeteer.launch({
        defaultViewport: {
            width: 1920,
            height: 1080,
        },
        headless: false,
        executablePath: "/usr/bin/firefox",
        product: "firefox"
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
    await page.goto("http://green-coding-wordpress", { // for this example we are running on port 80
        waitUntil: "load",
    });

    await page.waitForSelector("#language-continue");
    const text = await page.$eval('.screen-reader-text', element => element.textContent)
    console.log(microtime.now(),` Found text content: ${text}`);

    // await page.screenshot({ path: "img/filled-form.png", fullPage: true });
    // console.log(
    //     "Screenshot taken at ",
    //     process.hrtime()[0] * 1000000000 + process.hrtime()[1] / 1000
    // );
    console.log(microtime.now()," Closing Browser");
    await browser.close();
})();
