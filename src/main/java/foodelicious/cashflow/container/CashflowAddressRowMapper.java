package foodelicious.cashflow.container;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import foodelicious.cashflow.model.CashflowAddressBean;

public class CashflowAddressRowMapper implements RowMapper<CashflowAddressBean>{

	@Override
	public CashflowAddressBean mapRow(ResultSet rs, int rowNum) throws SQLException {
		CashflowAddressBean cashflowAddressBean = new CashflowAddressBean();
		cashflowAddressBean.setMemberId(rs.getLong("member_id"));
		cashflowAddressBean.setAddressId(rs.getLong("address_id"));
		cashflowAddressBean.setMemberAddress(rs.getString("member_address"));
		cashflowAddressBean.setCommonAddress(rs.getString("common_address"));
		cashflowAddressBean.setFk_member_id(rs.getLong("fk_member_id"));
		return cashflowAddressBean;
	}
	
}
