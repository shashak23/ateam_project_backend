function Masking() {
    /**
     * var masking = new Masking();
     * var maskedName = masking.name("이름");
     * var maskedEmail = masking.email("emailid@domain.com");
     * var maskedPhone = masking.phone("01012345678");
     * var maskedPhone = masking.phone("010-1234-5678");
     * var maskedAddress = masking.address("주소 어쩌고 저쩌고");
     */
}

Masking.prototype.name = function(str) {
    if (!str) return str;
    else if (str.length == 2) {
        return str.substr(0, 1) + "*";
    }
    else {
        const nameArr = str.split("");
        let name = nameArr[0];
        name += "*".repeat(nameArr.length - 2);
        name += nameArr[nameArr.length - 1];
        return name;
    }
}
Masking.prototype.email = function(str) {
    if (!str) return str;
    else {
        const emailArr = str.split("@");
        const id = this.name(emailArr[0]);
        return id + emailArr[1];
    }
}
Masking.prototype.phone = function(str) {
    if (!str) return str;
    else if (str.length == "010-1234-1234".length) {
        const phoneArray = str.split("-");
        return phoneArray[0] + "-" + "*".repeat(phoneArray[1].length) + "-" + phoneArray[2];
    }
    else if (str.length == "01012341234".length) {
        return str.substr(0, 3) + "-****-" + str.substr(7);
    }
}
Masking.prototype.address = function(str) {
    if (!str) return str;
    else if (str.includes("길 ")) {
        return str.substr(0, str.lastIndexOf("길 ") + 2) + "***********";
    }
    else if (str.includes("로 ")) {
        return str.substr(0, str.lastIndexOf("로 ") + 2) + "***********";
    }
    else if (str.includes("로")) {
        return str.substr(0, str.lastIndexOf("로") + 1) + "***********";
    }
    else if (str.includes("동 ")) {
        return str.substr(0, str.lastIndexOf("동 ") + 2) + "***********";
    }
}