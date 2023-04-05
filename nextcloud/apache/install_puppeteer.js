const puppeteer = require("puppeteer");
const microtime = require("microtime");

(async () => {
    console.log(microtime.now()," Launching browser");
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
    await page.goto("http://app:80", {
        waitUntil: "networkidle2",
    });

    // then continue with your code from here:
    //await page.goto("http://gcb-wordpress:9875/my-sample-page", {
    //    waitUntil: "networkidle2",
    //});

    // ....
    console.log(microtime.now()," Closing browser");
    await browser.close();
})();