$(document).ready(function () {
    toggleJobContactUrl();
    $("#job_contact_by_email, #job_contact_by_url").change(function () {
        toggleJobContactUrl();
    });
});

function toggleJobContactUrl () {
    if ($('#job_contact_by_url:checked').length > 0) {
        $('.job_contact_url').show();
    }
    else {
        $('.job_contact_url').hide();
    }
}
