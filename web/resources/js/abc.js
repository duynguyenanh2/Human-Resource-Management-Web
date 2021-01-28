$(document).ready(function () {
    $('#tblInput').on('keyup', function () {
        value = $(this).val().toLowerCase();
        $('#myTable tr').filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });
    
    $('.btn-del').click(function (e) {
        e.preventDefault();
        href = $(this).attr('href');
        $('#delModal #delRef').attr('href', href);
        $('#delModal').modal();
    });
});