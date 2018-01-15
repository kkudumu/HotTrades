let functions = require('firebase-functions');
let admin = require('firebase-admin')
admin.initializeApp(functions.config().firebase)

exports.announcePost = functions.database
    .ref('posts/{postId}')
    .onCreate(event => {
        let posts = event.data.val()
        sendNotification(posts)
    })

    function sendNotification(posts) {
        let message = posts.message
        let date = posts.date
        let username = posts.username

        let payload = {
            notification: {
                title: 'New Signal Available',
                body: message,
                sound: 'default'
            }
        }
        console.log(payload)
        let topic = "newPosts"
        admin.messaging().sendToTopic(topic, payload)
    }