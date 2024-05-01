<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-md-5 mt-5">
            <div class="card mt-3 mb-3 shadow login-page">
                <div class="card-body">
                    <div class="row justify-content-center">
                        <div class="col-10">
                            <form action="<?= base_url('register/register') ?>" method="POST" class="form-signin">
                                <div class="text-center">
                                    <img src="<?= base_url() ?>/images/logo/klann.png" width="100" alt="logo"
                                        loading="lazy">
                                </div>

                                <h1 class="h3 mb-3 font-weight-normal text-center">Halaman Pendaftaran</h1>
                                <br>
                                <?php $this->load->view('layouts/_alert') ?>

                                <div class="form-group">
                                    <input type="text" class="form-control login-form" name="name"
                                        placeholder="Full Name">
                                    <?= form_error('name', '<small class="text-danger ml-2 mt-1">', '</small>'); ?>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control login-form" name="email"
                                        placeholder="Email">
                                    <?= form_error('email', '<small class="text-danger ml-2 mt-1">', '</small>'); ?>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control login-form" name="password"
                                        placeholder="Password">
                                    <?= form_error('password', '<small class="text-danger ml-2 mt-1">', '</small>'); ?>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control login-form" name="password2"
                                        placeholder="Confirmation Password">
                                    <?= form_error('password2', '<small class="text-danger ml-2 mt-1">', '</small>'); ?>
                                </div>

                                <button class="btn btn-lg btn-warning text-white btn-block login-form mb-3"
                                    type="submit">SUBMIT</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>