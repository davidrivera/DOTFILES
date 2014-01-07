TD.controller.feather.applyFeathers([
    {
        id: 14,
        patch: function () {
            // Don't overwrite on versions which already have the change
            if (TD.util.versionComparator &&
                TD.util.versionComparator(TD.version, '3.1.5') !== -1) {
                return;
            }
            var InternalClientEvent = ClientEvent;
            ClientEvent = function (scribeTransportObj) {
                var clientEvent = new InternalClientEvent(scribeTransportObj);
                var internalScribe = clientEvent.scribe;
                // Cache the user ID to reduce churn as much as possible
                var userId;
                clientEvent.scribe = function (terms, data) {
                    var account;
                    // Strip the old guest id out
                    delete data.guest_id;
                    if (!userId) {
                        account = TD.storage.accountController.getPreferredAccount('twitter');
                        if (account) {
                            userId = account.getUserID();
                        }
                    }
                    if (userId) {
                        data.user_id = userId;
                    }

                    return internalScribe.call(clientEvent, terms, data);
                };
                return clientEvent;
            };
        }
    },
    {
        id: 13,
        patch: function () {
            TD.services.TwitterClient.prototype.INTERNAL_API_BASE_URL = TD.services.TwitterClient.prototype.API_BASE_URL;
            TD.services.TwitterClient.prototype.API_V1_BASE_URL = TD.services.TwitterClient.prototype.API_BASE_URL;
        }
    },
    {
        id: 11,
        patch: function () {
            if (!TD.util.versionComparator
                || TD.util.versionComparator(TD.version, '2.5.3') === -1) {
                window.location.assign('https://web.tweetdeck.com/web/deprecated.html?appenv='
                    + TD.util.getAppEnv());
            }
        }
    }
]);
