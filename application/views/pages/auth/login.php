<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-md-4 mt-5">
            <div class="card mt-3 mb-3 shadow login-page">
                <div class="card-body mb-4">
                    <div class="row justify-content-center">
                        <div class="col-10">
                            <form action="<?= base_url('login/login') ?>" method="post" class="form-signin text-center">

                                <img src="<?= base_url() ?>/images/logo/klann.png" width="100" alt="logo"
                                    loading="lazy">

                                <?php $this->load->view('layouts/_alert') ?>

                                <h1 class="h3 mb-3 font-weight-normal">Halaman Login</h1>
                                <br>
                                <div class="form-group">
                                    <input type="email" class="form-control login-form" name="email"
                                        placeholder="Your email" required>
                                </div>

                                <div class="form-group">
                                    <input type="password" class="form-control login-form" name="password"
                                        placeholder="Your password" required>
                                </div>

                                <button class="btn btn-lg btn-warning text-white btn-block login-form"
                                    type="submit">LOGIN</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>