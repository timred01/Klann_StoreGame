<section>
    <div class="container">

        <?php $this->load->view('layouts/_alert') ?>

        <div class="row">
            <div class="col-md-12">
                <div class="card shadow">
                    <div class="card-header bg-yellow text-white">
                        <h2>Change Password</h2>
                    </div>
                    <div class="card-body">
                        <form action="<?= base_url('profile/password') ?>" method="post">
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">New Password</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" name="password">
                                    <?= form_error('password', '<small class="form-text ml-2 mt-1 text-danger">', '</small>') ?>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-sm-3 col-form-label">Password Confirmation</label>
                                <div class="col-sm-9">
                                    <input type="password" class="form-control" name="password2">
                                    <?= form_error('password2', '<small class="form-text ml-2 mt-1 text-danger">', '</small>') ?>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-warning text-white btn-sm float-right">UPDATE</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>