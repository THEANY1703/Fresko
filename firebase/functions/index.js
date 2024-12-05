const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("User/" + user.uid);
  await firestore.collection("User").doc(user.uid).delete();
  await firestore
    .collection("PrList")
    .where("Owner", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(`Deleting document ${doc.id} from collection PrList`);
        await doc.ref.delete();
      }
    });
});
