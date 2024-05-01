<section>
    <div class="container">
        <div class="card shadow">
            <div class="card-body">
                <div class="row">
                    <div class="col-10">
                        <h3>List Users Orders</h3>
                    </div>
                </div>

                <?php $this->load->view('layouts/_alert') ?>

                <div class="row">
                    <div class="col bg-light p-4">
                        <table class="table table-bordered table-hover text-center ">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Invoice</th>
                                    <th>Date</th>
                                    <th>Total</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($orders as $o): ?>
                                    <tr>
                                        <td><a
                                                href="<?= base_url('order/detail/' . $o['id']) ?>"><strong><?= $o['invoice'] ?></strong></a>
                                        </td>
                                        <td><?= $o['date'] ?></td>
                                        <td>Rp. <?= number_format($o['total'], 2, ',', '.') ?></td>
                                        <td>
                                            <?php if ($o['status'] == 'waiting'): ?>
                                                <span class="badge badge-primary"><?= $o['status'] ?></span>
                                            <?php elseif ($o['status'] == 'paid'): ?>
                                                <span class="badge badge-warning text-light"><?= $o['status'] ?></span>
                                            <?php elseif ($o['status'] == 'delivered'): ?>
                                                <span class="badge badge-info"><?= $o['status'] ?></span>
                                            <?php elseif ($o['status'] == 'cancel'): ?>
                                                <span class="badge badge-danger"><?= $o['status'] ?></span>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>