

class NotificationManager {
    constructor() {
        this.container = document.getElementById('notification-container');
        this.notifications = new Map();
        this.notificationId = 0;


        this.init();
    }

    init() {

        this.postMessage('nuiReady', {});


        window.addEventListener('message', (event) => {
            const data = event.data;

            if (data.action === 'showNotification') {
                this.showNotification(data.message, data.type, data.duration);
            }
        });
    }

    showNotification(message, type = 'info', duration = 5000) {
        const id = ++this.notificationId;
        const notification = this.createNotificationElement(id, message, type, duration);


        this.container.appendChild(notification);
        this.notifications.set(id, notification);


        requestAnimationFrame(() => {
            notification.classList.add('show');
        });


        if (duration > 0) {
            setTimeout(() => {
                this.hideNotification(id);
            }, duration);
        }

        return id;
    }

    createNotificationElement(id, message, type, duration) {
        const notification = document.createElement('div');
        notification.className = `notification ${type}`;
        notification.dataset.id = id;


        const icon = this.getIcon(type);

        notification.innerHTML = `
            <div class="notification-icon">
                <i class="${icon}"></i>
            </div>
            <div class="notification-content">${this.escapeHtml(message)}</div>
            ${duration > 0 ? '<div class="notification-progress"><div class="notification-progress-bar"></div></div>' : ''}
        `;


        notification.addEventListener('click', () => {
            this.hideNotification(id);
        });


        if (duration > 0) {
            const progressBar = notification.querySelector('.notification-progress-bar');
            if (progressBar) {

                progressBar.style.width = '0%';
                progressBar.style.transition = 'none';
                progressBar.style.transformOrigin = 'left center';


                progressBar.offsetWidth;


                setTimeout(() => {
                    progressBar.style.transition = `width ${duration}ms linear`;
                    progressBar.style.width = '100%';
                }, 50);
            }
        }

        return notification;
    }

    hideNotification(id) {
        const notification = this.notifications.get(id);
        if (!notification) return;

        notification.classList.add('hide');


        setTimeout(() => {
            if (notification.parentNode) {
                notification.parentNode.removeChild(notification);
            }
            this.notifications.delete(id);
        }, 300);
    }

    getIcon(type) {
        const icons = {
            success: 'fas fa-check-circle',
            error: 'fas fa-exclamation-circle',
            warning: 'fas fa-exclamation-triangle',
            info: 'fas fa-info-circle'
        };

        return icons[type] || icons.info;
    }

    escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }

    postMessage(action, data) {
        fetch(`https://${GetParentResourceName()}/${action}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify(data)
        }).catch(() => {

        });
    }


    clearAll() {
        this.notifications.forEach((notification, id) => {
            this.hideNotification(id);
        });
    }
}


document.addEventListener('DOMContentLoaded', () => {
    window.notificationManager = new NotificationManager();
});


if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
        if (!window.notificationManager) {
            window.notificationManager = new NotificationManager();
        }
    });
} else {
    window.notificationManager = new NotificationManager();
}