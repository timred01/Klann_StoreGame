<section>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="card shadow">
                    <div class="card-header bg-yellow text-light text-center">
                        <h3>Checkout Success</h3>
                    </div>
                    <div class="card-body">
                        <h4><strong>Order Number : <?= $content['invoice'] ?></strong></h4>
                        <h4>Thank you for order 🙏</h4>
                        <br>
                        <p>Please pass payment with the following procedures:</p>
                        <ol>
                            <li>Make payment to the account <strong>BCA 0123456789</strong> An. KLANN</li>
                            <li>Include information with the order number <strong><?= $content['invoice'] ?></strong>
                            </li>
                            <li>Total payment <strong>Rp. <?= number_format($content['total'], 0, ',', '.') ?></strong>
                            </li>
                        </ol>
                        <p>If you have already made a payment, please send proof of transfer <a
                                href="<?= base_url('myorder/detail/' . $content['invoice']) ?>"
                                class="btn btn-primary text-light">to this
                                link</a></p>
                        <a href="<?= base_url('store') ?>" class="btn btn-outline-danger btn-sm">Back</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>