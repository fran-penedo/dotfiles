#!/usr/bin/env python

import csv
from datetime import datetime
from pathlib import Path

import click
import xlrd


def convert_date(cell, book):
    return datetime(*xlrd.xldate_as_tuple(cell.value, book.datemode)).strftime(
        "%d/%m/%Y"
    )


def get_account_rows(wb, sh):
    def get_rows(sh, first, last, book):
        return [
            (
                sh[i][0].value,
                0,
                None,
                None,
                sh[i][2].value,
                sh[i][3].value,
                None,
                None,
            )
            for i in range(first, last + 1)
        ]

    return get_rows(sh, 4, sh.nrows - 1, wb)


def get_cc_rows(wb, sh):
    last_confirmed = -1
    for i in range(sh.nrows):
        if sh[i][0].value == "Total Crédito":
            last_confirmed = i - 1
            break

    first_pending = sh.nrows
    for i in range(last_confirmed + 1, sh.nrows):
        if sh[i][0].ctype == xlrd.XL_CELL_DATE:
            first_pending = i
            break

    def get_rows(sh, first, last, book):
        return [
            (
                convert_date(sh[i][0], book),
                0,
                None,
                None,
                sh[i][1].value,
                sh[i][2].value if sh[i][2].ctype == xlrd.XL_CELL_NUMBER else sh[i][3],
                None,
                None,
            )
            for i in range(first, last + 1)
        ]

    rows = get_rows(sh, 6, last_confirmed, wb) + get_rows(
        sh, first_pending, sh.nrows - 2, wb
    )

    return rows


@click.command()
@click.argument("fn", type=click.Path(exists=True, dir_okay=False))
def to_homebank_csv(fn):
    fn = Path(fn)
    wb = xlrd.open_workbook(fn)
    sh = wb.sheet_by_index(0)

    if sh[0][0].ctype == xlrd.XL_CELL_TEXT and sh[0][0].value.startswith("IBAN"):
        rows = get_account_rows(wb, sh)
    elif sh[0][0].ctype == xlrd.XL_CELL_TEXT and sh[0][0].value.startswith(
        "Número de tarjeta"
    ):
        rows = get_cc_rows(wb, sh)
    else:
        raise Exception("Unsupported excel file")

    header = ("date", "payment", "info", "payee", "memo", "amount", "category", "tags")
    now = datetime.now().strftime("%Y%m%d%H%M%S")

    with open(
        fn.with_stem(f"{fn.stem}-{now}").with_suffix(".csv"), "w", newline=""
    ) as f:
        writer = csv.writer(f, delimiter=";")
        writer.writerow(header)
        writer.writerows(rows)


if __name__ == "__main__":
    to_homebank_csv()
