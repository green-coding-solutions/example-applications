const puppeteer = require("puppeteer");
const microtime = require("microtime");
const firefoxOptions = {
  product: 'firefox',
  defaultViewport: {
            width: 1280,
            height: 700,
        },
  extraPrefsFirefox: {
    // Enable additional Firefox logging from its protocol implementation
    // 'remote.log.level': 'Trace',
  },
  // Make browser logs visible
  dumpio: true,
  headless: false
};
(async () => {
    const browser = await puppeteer.launch(firefoxOptions);

    
    console.log(microtime.now()," Launching Browser");
    /*const browser = await puppeteer.launch({
        defaultViewport: {
            width: 1920,
            height: 1080,
        },
        headless: false,
        args: ["--no-sandbox", "--disable-setuid-sandbox"], // Otherwise it won't run on Docker
    });*/

    const page = await browser.newPage();
    console.log(await browser.version());

    const dimensions = await page.evaluate(() => {
        return {
            width: document.documentElement.clientWidth,
            height: document.documentElement.clientHeight,
            deviceScaleFactor: window.devicePixelRatio,
        };
    });
    console.log("Dimensions:", dimensions); // Only to double-check if the dimensions are as expected

    
    console.log(microtime.now()," Home Page");
    await page.goto("http://www.green-coding.org", {
        waitUntil: "networkidle2",
    });

    await page.screenshot({ path: "/tmp/filled-form.png", fullPage: true });

    console.log(microtime.now()," Closing Browser");
    await browser.close();
})();
