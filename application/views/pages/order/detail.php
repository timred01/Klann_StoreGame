<section>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card shadow">
                    <h5 class="card-header bg-yellow text-light text-center">Order Detail
                        <b>#<?= $order['invoice'] ?></b>
                    </h5>
                    <div class="card-body">
                        <div class="mb-3 row">
                            <label class="col-sm-2 col-form-label">Date : </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" value="<?= $order['date'] ?>" disabled>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label class="col-sm-2 col-form-label">Name : </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" value="<?= $order['name'] ?>" disabled>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label class="col-sm-2 col-form-label">Phone : </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" value="<?= $order['phone'] ?>" disabled>
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label class="col-sm-2 col-form-label">Address : </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" value="<?= $order['address'] ?>" disabled>
                            </div>
                        </div>
                        <div class="mb-5 row">
                            <label class="col-sm-2 col-form-label">Status:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" value="
                                <?php if ($order['status'] == 'waiting') : ?>
                                   <?= $order['status'] ?>
                                <?php elseif ($order['status'] == 'paid') : ?>
                                    <?= $order['status'] ?>
                                <?php elseif ($order['status'] == 'delivered') : ?>
                                    <?= $order['status'] ?>
                                <?php elseif ($order['status'] == 'cancel') : ?>
                                    <?= $order['status'] ?>
                                <?php endif; ?>
                                " disabled>
                            </div>
                        </div>

                        <table class="table table-bordered text-center">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Game</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($order_detail as $od) : ?>
                                <tr>
                                    <td>
                                        <img src="<?= base_url('images/game/' . $od['image']) ?>" style="width:200px">
                                    </td>
                                    <td>
                                        <h5>Rp. <?= number_format($od['price'], 2, ',', '.') ?></h5>
                                    </td>
                                </tr>
                                <?php endforeach ?>
                            </tbody>
                            <tfoot class="bg-success text-light">
                                <tr>
                                    <td><strong>Total</strong></td>
                                    <td>
                                        <h5><strong>Rp.
                                                <?= number_format(array_sum(array_column($order_detail, 'subtotal')), 2, ',', '.') ?></strong>
                                        </h5>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class="card-footer">
                        <form action="<?= base_url("order/update/" . $order['id']) ?>" method="post">
                            <input type="hidden" name="id" value="<?= $order['id'] ?>">
                            <div class="input-group">
                                <select name="status" class="form-control">
                                    <option value="waiting" <?= $order['status'] == 'waiting' ? 'selected' : '' ?>>
                                        Waiting</option>
                                    <option value="paid" <?= $order['status'] == 'paid' ? 'selected' : '' ?>>Paid
                                    </option>
                                    <option value="delivered" <?= $order['status'] == 'delivered' ? 'selected' : '' ?>>
                                        Delivered</option>
                                    <option value="cancel" <?= $order['status'] == 'cancel' ? 'selected' : '' ?>>Cancel
                                    </option>
                                </select>
                                <div class="input-group-append">
                                    <button class="btn btn-info bg-yellow" type="submit">Save</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <?php if (isset($order_confirm)) : ?>
        <div class="row mt-3 mb-5">
            <div class="col-md-7">
                <div class="card shadow mb-2">
                    <h5 class="card-header bg-yellow text-light">Payments Confirmation</h5>
                    <div class="card-body">
                        <div class="mb-3 row">
                            <label class="col-sm-4 col-form-label">Account Name : </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="<?= $order_confirm['account_name'] ?>"
                                    disabled>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label class="col-sm-4 col-form-label">Account Number : </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="<?= $order_confirm['account_number'] ?>"
                                    disabled>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label class="col-sm-4 col-form-label">Nominal :</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control"
                                    value=" <?= number_format($order_confirm['nominal'], 2, ',', '.') ?>" disabled>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-sm-4 col-form-label">Note : </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" value="<?= $order_confirm['note'] ?>" disabled>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-5 text-center">
                <div class="card shadow mb-4">
                    <h5 class="card-header bg-yellow text-light">Proof of Payment</h5>
                    <div class="card-body">
                        <div class="card-text">
                            <img src="<?= base_url('images/payments/' . $order_confirm['image']) ?>" height="200px">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php endif ?>
    </div>
</section>