let functions = require('firebase-functions');
let admin = require('firebase-admin')
admin.initializeApp(functions.config().firebase)



exports.announcePost = functions.database
    .ref('posts_for_notifications/{postId}')
    .onCreate(event => {
        let posts = event.data.val()
        sendNotification(posts)
    })

    function sendNotification(posts) {
        let signal = posts.signal
        let pair = posts.pair
        let price = posts.price

        let payload = {
            notification: {
                title: 'New Signal Available',
                body: signal + "  " + pair + "  " + price,
                sound: 'default'
            }
        }
        console.log(payload)
        let topic = "newPosts"
        admin.messaging().sendToTopic(topic, payload)
    }