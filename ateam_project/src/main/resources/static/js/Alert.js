/**
 * 
 */
var alertLength = 0;
var nextPosition = 0;
function AlertBox(message, duration = 1500) {
    if (!message) {
        return;
    }
    
    nextPosition += 50;
    
    var alertDiv = $(`<div>${message}</div>`);
    alertDiv.css({
        "background-color": "#0000FF53",
        "border-radius": "5px",
        "border": "1px solid #555",
        "padding": "10px",
        "position": "absolute",
        "right": "10px",
        "top": `${nextPosition}px`,
        "display": "none"
    });
    
    alertLength++;
    $("body").append(alertDiv);
    alertDiv.fadeIn();
    
    setTimeout(function () {
        alertDiv.remove();
        alertLength--
        
        if (alertLength <= 0) {
            nextPosition = 50;
        }
    }, duration);
}