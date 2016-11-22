INSERT INTO calaccess_processed_form460scheduleb2item (
    filing_id,
    line_item,
    lender_code,
    lender_committee_id,
    lender_title,
    lender_lastname,
    lender_firstname,
    lender_name_suffix,
    lender_city,
    lender_state,
    lender_zip,
    lender_employer,
    lender_occupation,
    lender_is_self_employed,
    treasurer_title,
    treasurer_lastname,
    treasurer_firstname,
    treasurer_name_suffix,
    treasurer_city,
    treasurer_state,
    treasurer_zip,
    intermediary_title,
    intermediary_lastname,
    intermediary_firstname,
    intermediary_name_suffix,
    intermediary_city,
    intermediary_state,
    intermediary_zip,
    amount_guaranteed_this_period,
    balance_outstanding_to_date,
    cumulative_ytd_amount,
    loan_date,
    transaction_id,
    memo_reference_number, 
    reported_on_b1
)
SELECT 
    filing.filing_id,
    item_version.line_item,
    item_version.lender_code,
    item_version.lender_committee_id,
    item_version.lender_title,
    item_version.lender_lastname,
    item_version.lender_firstname,
    item_version.lender_name_suffix,
    item_version.lender_city,
    item_version.lender_state,
    item_version.lender_zip,
    item_version.lender_employer,
    item_version.lender_occupation,
    item_version.lender_is_self_employed,
    item_version.treasurer_title,
    item_version.treasurer_lastname,
    item_version.treasurer_firstname,
    item_version.treasurer_name_suffix,
    item_version.treasurer_city,
    item_version.treasurer_state,
    item_version.treasurer_zip,
    item_version.intermediary_title,
    item_version.intermediary_lastname,
    item_version.intermediary_firstname,
    item_version.intermediary_name_suffix,
    item_version.intermediary_city,
    item_version.intermediary_state,
    item_version.intermediary_zip,
    item_version.amount_guaranteed_this_period,
    item_version.balance_outstanding_to_date,
    item_version.cumulative_ytd_amount,
    item_version.loan_date,
    item_version.transaction_id,
    item_version.memo_reference_number,
    item_version.reported_on_b1
FROM calaccess_processed_form460filing filing
JOIN calaccess_processed_form460filingversion filing_version
ON filing.filing_id = filing_version.filing_id
AND filing.amendment_count = filing_version.amend_id
JOIN calaccess_processed_form460scheduleb2itemversion item_version
ON filing_version.id = item_version.filing_version_id;