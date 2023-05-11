const puppeteer = require("puppeteer");
const microtime = require("microtime");

(async () => {
    console.log(microtime.now(),"Launching browser");
    const browser = await puppeteer.launch({
        defaultViewport: {
            width: 1920,
            height: 1080,
        },
        headless: true,
        executablePath: "/usr/bin/chromium-browser",
        args: ["--no-sandbox", // We need these args to make chrome run under docker
               "--disable-setuid-sandbox",
               "--disable-dev-shm-usage"],
    });

    const page = await browser.newPage();
    await page.setDefaultTimeout(60_000); // milliseconds
    await page.goto('http://app/');

    // 1. Create User
    await page.type('#adminlogin', 'Crash');
    await page.type('#adminpass', 'Override');
    await page.click('.primary');
    console.log(microtime.now(),"Create user clicked");

    // 2. Install all Apps
    const installSelector = '.button-vue--vue-primary';
    await page.waitForSelector(installSelector);
    await page.click(installSelector);
    console.log(microtime.now(),"Install apps clicked");

    // 3. Dashboard
    await page.waitForSelector('.app-dashboard');
    console.log(microtime.now(),"Dashboard found");

    await browser.close();
})();