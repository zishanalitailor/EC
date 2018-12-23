using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Unique.EcommGroceryStore.Core.Notification
{
    //type of class "{\"text\":\"This is a success notification\",\"layout\":\"topLeft\",\"type\":\"success\"}"
    public class NotifyClass
    {
        public string text { get; set; }
        public string layout { get; set; }
        public string type { get; set; }
    }
    public class animateOpen
    {
        public string opacity { get; set; }
    }
    public enum NotificationLayout
    {
        top,
        topLeft,
        topCenter,
        topRight,
        centerLeft,
        center,
        centerRight,
        bottomLeft,
        bottomCenter,
        bottomRight,
        bottom

    }
    public enum NotificationType
    {
        success,
        error,
        warning,
        information,
        confirm
    }
}
