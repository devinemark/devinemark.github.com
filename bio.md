---
title: About Me
layout: default
---

About Me
--------

Pura Vida!

Welcome to the love of photography shown here at Devine Mark Imagery. Megan is a dog mom, a wife, and a health advocate from Portland, Oregon.
She enjoys traveling the world and capturing the art on the other side of her lens. Please enjoy the images not only in her home state but those
also acquired through travels all over the world. For inquiries about portraits, engagements, pet shots, family photos, landscapes and many other
styles of photography please contact her below!

<div class="alert alert-success contact__msg" style="display: none" role="alert">
    Your message was sent successfully.
</div>

<form action="{{ site.contactme_url }}" id="contact-form" class="contact-form" method="post">
<input type="hidden" name="g-recaptcha-response">
<div>
<label>
    <span>Name</span>
    <input name="subject" type="text" tabindex="1" required="required" placeholder="Please enter your name">
</label>
</div>
<div>
<label>
    <span>Email</span>
    <input name="email" type="email" tabindex="2" required="required" placeholder="Please enter your email address">
</label>
</div>
<div>
<label>
    <span>Message</span>
    <textarea name="message" tabindex="3" placeholder="Include all the details you like"></textarea>
</label>
</div>
<div>
<button type="submit" name="dsubmit" id="contact-submit" class="btn btn-success">Send Email</button>
</div>
</form>

<br/>
<br/>
<br/>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js?render={{ site.recaptcha_sitekey }}"></script>
<style>
.grecaptcha-badge {
    z-index: 60;
}
</style>
<script>
(function($) {
    'use strict';
    var form = $('.contact-form'),
        message = $('.contact__msg'),
        form_data;
    // Success function
    function done_func(response) {
        form.fadeOut();
        message.fadeIn().removeClass('alert-danger').addClass('alert-success');
        message.text(response.responseJSON.success);
        setTimeout(function () {
            message.fadeOut();
        }, 2000);
        form.find('input:not([type="submit"]), textarea').val('');
    }
    // fail function
    function fail_func(data) {
        message.fadeIn().removeClass('alert-success').addClass('alert-success');
        message.text(data.responseJSON.error);
        setTimeout(function () {
            message.fadeOut();
        }, 2000);
    }

    form.submit(function (e) {
        e.preventDefault();
        form_data = $(this).serialize();
        $.ajax({
            type: 'POST',
            url: form.attr('action'),
            data: form_data
        })
        .done(done_func)
        .fail(fail_func);
    });

})(jQuery);
/*
(function() {
// Change text inside send button on submit
    var send = document.getElementById('contact-submit');
    if(send) {
        send.onclick = function () {
            if (form.el.checkValidity()) {
                this.innerHTML = '...Sending';
            }
        }
    }
})();
*/
grecaptcha.ready(function() {
    grecaptcha.execute('{{ site.recaptcha_sitekey }}', {action: '/api/contactme'}).then(function(token) {
        var form = document.getElementById("contact-form");
        form["g-recaptcha-response"].value = token;
    });
});
</script>


