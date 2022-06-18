console.log(
    "Starting puppeteer.js at time ",
    process.hrtime()[0] * 1000000000 + process.hrtime()[1] / 1000
);
const puppeteer = require("puppeteer");

(async () => {
    const browser = await puppeteer.launch({
        defaultViewport: {
            width: 1920,
            height: 1080,
        },
        headless: true,
        args: ["--no-sandbox", "--disable-setuid-sandbox"], // Otherwise it won't run on Docker
    });
    console.log(
        "Browser launched at ",
        process.hrtime()[0] * 1000000000 + process.hrtime()[1] / 1000
    );

    const page = await browser.newPage();
    const dimensions = await page.evaluate(() => {
        return {
            width: document.documentElement.clientWidth,
            height: document.documentElement.clientHeight,
            deviceScaleFactor: window.devicePixelRatio,
        };
    });
    // console.log("Dimensions:", dimensions); // Only to double-check if the dimensions are as expected

    console.log(
        "Going to home page ",
        process.hrtime()[0] * 1000000000 + process.hrtime()[1] / 1000
    );

    await page.goto("http://green-coding-wordpress-apache-basic-container:9875", {
        waitUntil: "networkidle2",
    });


    console.log(
        "Connect Success ",
        process.hrtime()[0] * 1000000000 + process.hrtime()[1] / 1000
    );

    // then continue with your code from here:
    //await page.goto("http://green-coding-wordpress-apache-basic-container:9875/my-sample-page", {
    //    waitUntil: "networkidle2",
    //});

    // ....
    await browser.close();
    console.log(
        "Browser closed at ",
        process.hrtime()[0] * 1000000000 + process.hrtime()[1] / 1000
    );
})();
console.log(
    "Finishing puppeteer.js at ",
    process.hrtime()[0] * 1000000000 + process.hrtime()[1] / 1000
);
