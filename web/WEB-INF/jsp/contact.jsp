<%@ page pageEncoding="utf-8"%>
<h1>Contact us</h1>
<div class="container contact" style="margin-left: 150px;">
    <div class="row">
        <div class="col-md-8 text-center">
            <p class="text-muted lead">We are looking forward to hearing from you</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-8">
            <form action="contact" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" class="form-control" name="name" placeholder="Name">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="email" class="form-control" name="email" placeholder="Email address">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="tel" class="form-control" name="phone" placeholder="Phone number">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <input type="text" class="form-control" name="subject" placeholder="Subject">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <textarea rows="5" class="form-control" name="message" placeholder="Message"></textarea>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <input type="file" class="form-control" name="attachment">
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <button class="btn btn-primary">Send</button>
                </div>
            </form>
        </div>
    </div>
</div>