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
    await page.setDefaultTimeout(300000);
    await page.goto('http://app/login');

    // 1. Login
    const userElement = await page.waitForXPath('//*[@data-login-form-input-user]');
    await userElement.type('Crash');
    const passElement = await page.waitForXPath('//*[@data-login-form-input-password]');
    await passElement.type('Override');
    await page.click('.button-vue--vue-primary');
    console.log(microtime.now(),"Login clicked");


    // In some cases NextCloud displays an unsupported page because of Chromium.
    const unsupportedElement = await page.waitForSelector('.content-unsupported-browser__continue');
    await unsupportedElement.click();
    console.log(microtime.now(),"Unsupported browsers warning clicked");

    await page.waitForNavigation({
        waitUntil: 'domcontentloaded',
        url: 'http://app/apps/dashboard/',
    });

    // Wait for the modal to load. As it seems you can't close it while it is showing the opening animation.
    await new Promise(r => setTimeout(r, 3000));

    // 2. Close Modal
    const modalClose = await page.waitForSelector('.modal-container__close');
    await modalClose.click();
    console.log(microtime.now(),"Intro video modal clicked");

    // We need to sleep here as the modal animation takes some time to close and otherwise catches the click event.
    await new Promise(r => setTimeout(r, 3000));

    // 3.Go to Cal
    await page.click('a[href="/apps/calendar/"]');
    console.log(microtime.now(),"Calendar clicked");

    // 4. Open New Event Box
    const newEventSelector = await page.waitForSelector('.new-event');
    await newEventSelector.click();
    console.log(microtime.now(),"New event clicked");

    // 4. Create Event
    const titleSelector = await page.waitForSelector('input[placeholder="Event title"]');
    await titleSelector.type('NYC2600 Meeting');
    const saveSelector = await page.waitForSelector('text=Save');
    await saveSelector.click();
    console.log(microtime.now(),"Save event clicked");

    // 5. Wait for the event
    await page.waitForSelector('text=NYC2600 Meeting');
    console.log(microtime.now(),"Event found! Fin");

    await browser.close();

})();

