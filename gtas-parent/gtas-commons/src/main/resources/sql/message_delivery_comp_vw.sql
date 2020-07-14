CREATE OR REPLACE VIEW message_delivery_comp_vw AS SELECT  msg.id as id, msg.create_date as gtas_message_create_dtm, 'PNR' as 'message_type', pnr.transmission_date as transmission_date, f.id_tag as flight_id_tag, f.id as flight_id, f.flight_number as flight_number, f.full_flight_number as full_flight_number, f.carrier as carrier, f.direction as direction, f.origin as origin, f.origin_country as origin_country, f.destination as destination, f.destination_country as destination_country, mfd.full_utc_etd_timestamp as full_utc_etd_timestamp, mfd.full_utc_eta_timestamp as full_utc_eta_timestamp, fpc.fp_count as passenger_count, TIMESTAMPDIFF(HOUR, pnr.transmission_date, full_utc_etd_timestamp) as msg_trans_comp_hrs, TIMESTAMPDIFF(MINUTE, pnr.transmission_date, full_utc_etd_timestamp) as msg_trans_comp_mins	  FROM gtas.message msg INNER JOIN gtas.message_status mst ON msg.id = mst.ms_message_id INNER JOIN gtas.pnr pnr ON msg.id = pnr.id INNER JOIN gtas.pnr_flight pfl ON pnr.id = pfl.pnr_id INNER JOIN gtas.flight f ON pfl.flight_id = f.id INNER JOIN gtas.mutable_flight_details mfd ON f.id = mfd.flight_id INNER JOIN  gtas.flight_passenger_count fpc ON fpc.fp_flight_id = f.id AND f.id_tag IS NOT NULL   UNION ALL  SELECT  msg.id as id, msg.create_date as gtas_message_create_dtm, 'APIS' as 'message_type', apm.transmission_date as transmission_date, f.id_tag as flight_id_tag, f.id as flight_id, f.flight_number as flight_number, f.full_flight_number as full_flight_number, f.carrier as carrier, f.direction as direction, f.origin as origin, f.origin_country as origin_country, f.destination as destination, f.destination_country as destination_country, mfd.full_utc_etd_timestamp as full_utc_etd_timestamp, mfd.full_utc_eta_timestamp as full_utc_eta_timestamp, fpc.fp_count as passenger_count, TIMESTAMPDIFF(HOUR, apm.transmission_date, full_utc_etd_timestamp) as msg_trans_comp_hrs, TIMESTAMPDIFF(MINUTE, apm.transmission_date, full_utc_etd_timestamp) as msg_trans_comp_mins	  FROM gtas.message msg INNER JOIN gtas.message_status mst ON msg.id = mst.ms_message_id INNER JOIN gtas.apis_message apm ON msg.id = apm.id INNER JOIN gtas.apis_message_flight amf ON apm.id = amf.apis_message_id INNER JOIN gtas.flight f ON amf.flight_id= f.id INNER JOIN gtas.mutable_flight_details mfd ON f.id = mfd.flight_id INNER JOIN  gtas.flight_passenger_count fpc ON fpc.fp_flight_id = f.id AND f.id_tag IS NOT NULL  ORDER BY id, flight_id;