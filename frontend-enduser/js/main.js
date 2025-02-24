$(document).ready(function () {
    $.ajax({
        url: "http://localhost/bookstore/backend/controllers/BookInfoController.php",
        type: "GET",
        dataType: "json",
        success: function (data) {
            let bookInfoList = $("#bookinfo-list");
            data.forEach(bookInfo => {
                bookInfoList.append(`<li>${bookInfo.bookTitle} - ${bookInfo.bookAuthor}</li>`);
            });
        },
        error: function () {
            console.error("Không thể tải danh sách sách.");
        }
    });
});
