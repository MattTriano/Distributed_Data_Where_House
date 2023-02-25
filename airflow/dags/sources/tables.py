from cc_utils.socrata import SocrataTable

CHICAGO_POTHOLES_PATCHED = SocrataTable(
    table_id="wqdh-9gek",
    table_name="chicago_potholes_patched",
    schedule="47 8 * * *",
)

CHICAGO_TOWED_VEHICLES = SocrataTable(
    table_id="ygr5-vcbg",
    table_name="chicago_towed_vehicles",
    schedule="15 11,23 * * *",
)

COOK_COUNTY_NEIGHBORHOOD_BOUNDARIES = SocrataTable(
    table_id="wyzt-dzf8",
    table_name="cook_county_neighborhood_boundaries",
    schedule="0 4 3 3 *",
)

COOK_COUNTY_PARCEL_LOCATIONS = SocrataTable(
    table_id="c49d-89sn",
    table_name="cook_county_parcel_locations",
    schedule="0 7 4 * *",
)

COOK_COUNTY_PARCEL_SALES = SocrataTable(
    table_id="wvhk-k5uv",
    table_name="cook_county_parcel_sales",
    schedule="0 6 4 * *",
)
