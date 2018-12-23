using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Unique.EcommGroceryStore.Core.Notification;
using System.Web.Script.Serialization;
using System.Web.UI;

namespace NotificationHelper
{
    public static class NotificationExtensions
    {
        public static void ShowNotification(this Control control, NotificationType notificationType, string message, NotificationLayout notificationlayout)
        {
            //var totalNotificationShowingMilliseconds = timeBeforeHiding.TotalMilliseconds;
            //var jNotifyDelay = totalNotificationShowingMilliseconds > 0
            //                            ? totalNotificationShowingMilliseconds.ToString(CultureInfo.InvariantCulture)
            //                            : "undefined"; // equal to not adding anything

            //var notificationScript =
            //    string.Format(
            //        "$( function () {{ if(typeof $.noty === 'function') {{ $.noty('{0}', '{1}',  {2}); }} }} );",
            //        HttpUtility.JavaScriptStringEncode(message), notificationType.ScriptKey, jNotifyDelay);
            NotifyClass cls = new NotifyClass();
            var jsonSerializer = new JavaScriptSerializer();

            string layout = notificationlayout.ToString();
            string nType = notificationType.ToString();
            string response = jsonSerializer.Serialize(new NotifyClass { text = message, layout = layout, type = nType });

            //string animateOpen = jsonSerializer.Serialize(new animateOpen { opacity = "show" });



            var notificationScript =
            string.Format(
                "$( function () {{ if(typeof $.noty === 'function') {{ $.noty({0},{1}); }} }} );",
               response, "undefined");

            // Allow adding multiple notifications by making the key unique
            var scriptKey = Guid.NewGuid().ToString();

            // Adding the call to the pre-render event of the page, so that multiple notification calls
            //      are added in the same order they are rendered in the page, not the order the calls are processed in page life cycle
            control.PreRender += new EventHandler
                ((sender, e) =>
                 // Note that we need to use ScriptManager to be UpdatePanel friendly
                 // This will still work even if there is no ScriptManager on the page
                 ScriptManager.RegisterStartupScript(control, control.GetType(), scriptKey,
                                                         notificationScript,
                                                         // saves us from adding <script> in string and making it harder to re
                                                         addScriptTags: true));
        }

        public static void ShowNotification(this Control currentControl, NotificationType notificationType, string message)
        {
            ShowNotification(currentControl, notificationType, message, NotificationLayout.topRight);
        }

        public static void ShowSuccessfulNotification(this Control currentControl, string notificationMessage)
        {
            ShowNotification(currentControl, NotificationType.success, notificationMessage);
        }

        public static void ShowWarningNotification(this Control currentControl, string notificationMessage)
        {
            ShowNotification(currentControl, NotificationType.warning, notificationMessage);
        }

        public static void ShowErrorNotification(this Control currentControl, string notificationMessage)
        {
            ShowNotification(currentControl, NotificationType.error, notificationMessage);
        }

        public static void ShowInformationNotification(this Control currentControl, string notificationMessage)
        {
            ShowNotification(currentControl, NotificationType.information, notificationMessage);
        }

        public static void ShowConfirmationNotification(this Control currentControl, string notificationMessage)
        {
            ShowNotification(currentControl, NotificationType.confirm, notificationMessage);
        }


        public static void ShowSuccessfulNotification(this Control currentControl, string notificationMessage, NotificationLayout notificationlayout)
        {
            ShowNotification(currentControl, NotificationType.success, notificationMessage, notificationlayout);
        }

        public static void ShowWarningNotification(this Control currentControl, string notificationMessage, NotificationLayout notificationlayout)
        {
            ShowNotification(currentControl, NotificationType.warning, notificationMessage, notificationlayout);
        }

        public static void ShowErrorNotification(this Control currentControl, string notificationMessage, NotificationLayout notificationlayout)
        {
            ShowNotification(currentControl, NotificationType.error, notificationMessage, notificationlayout);
        }

        public static void ShowInformationNotification(this Control currentControl, string notificationMessage, NotificationLayout notificationlayout)
        {
            ShowNotification(currentControl, NotificationType.information, notificationMessage, notificationlayout);
        }

        public static void ShowConfirmationNotification(this Control currentControl, string notificationMessage, NotificationLayout notificationlayout)
        {
            ShowNotification(currentControl, NotificationType.confirm, notificationMessage, notificationlayout);
        }
    }
}
