<section>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6">
                <div class="card shadow">
                    <h5 class="card-header bg-yellow text-light text-center">
                        Orders Detail <b>#<?= $order['invoice'] ?></b>
                    </h5>
                    <div class="card-body">
                        <ul>
                            <li><b>DATE :</b> <?= $order['date'] ?></li>
                            <li><b>NAME :</b> <?= $order['name'] ?></li>
                            <li><b>PHONE :</b> <?= $order['phone'] ?></li>
                            <li><b>ADDRESS :</b> <?= $order['address'] ?></li>
                            <li><b>STATUS :</b>
                                <?php if ($order['status'] == 'waiting') : ?>
                                <span class="badge badge-primary"><?= $order['status'] ?></span>
                                <?php elseif ($order['status'] == 'paid') : ?>
                                <span class="badge badge-warning text-light"><?= $order['status'] ?></span>
                                <?php elseif ($order['status'] == 'delivered') : ?>
                                <span class="badge badge-info"><?= $order['status'] ?></span>
                                <?php elseif ($order['status'] == 'cancel') : ?>
                                <span class="badge badge-danger"><?= $order['status'] ?></span>
                                <?php endif; ?>
                            </li>
                        </ul>

                        <hr>
                        <div class="text-center text-info">
                            <small class="text-dark">If you need help or information, you can contact this.</small>
                            <br>
                            <small>admin@gmail.com | 08123456789</small>
                        </div>

                        <?php if ($order['status'] == 'waiting') : ?>
                        <form action="<?= base_url('myorder/confirm/' .  $order['invoice']) ?>" method="POST">
                            <button type="submit" class="btn btn-success bg-yellow btn-sm float-right">Payment
                                Confirm</button>
                        </form>
                        <?php endif ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>