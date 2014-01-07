var getSessionInfo = function(e) {
    var NEW_DOMAIN = 'https://tweetdeck.twitter.com';
    var session;
    var accountInfo;
    var email;
    var data = {};

    if (e.origin === NEW_DOMAIN && e.data === 'getSession') {
        try {
            storage = localStorage;
        } catch (e) {
            storage = null;
        }

        if (storage) {
            session = localStorage.getItem('_session');
            accountInfo = localStorage.getItem('tweetdeckAccount') ||
                localStorage.getItem('tweetdeck_account');
            if (accountInfo) {
                accountInfo = JSON.parse(accountInfo);
                email = accountInfo.email;
            }

            // Clear local storage
            storage.clear();
        }

        if (email) {
            data = {
                session : session,
                email : email,
                sessionExists : true,
                staySignedIn : true
            }
        }

        e.source.postMessage(data, NEW_DOMAIN);
    }
};

window.addEventListener('message', getSessionInfo, false);