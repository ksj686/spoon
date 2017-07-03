<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

				// ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
				// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
				var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
				var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

				// ���������� ���� ��� �߰��Ѵ�. (�������� ����)
				// �������� ��� ������ ���ڰ� "��/��/��"�� ������.
				if (data.bname !== '' && /[��|��|��]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
				document.getElementById('postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
				document.getElementById('roadAddress').value = fullRoadAddr;
				document.getElementById('jibunAddress').value = data.jibunAddress;

				// ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
				if (data.autoRoadAddress) {
					//����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
					document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';

				} else if (data.autoJibunAddress) {
					var expJibunAddr = data.autoJibunAddress;
					document.getElementById('guide').innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';

				} else {
					document.getElementById('guide').innerHTML = '';
				}
			}
		}).open();
	}
</script>
</head>
<body>
	<form action="/shop/member/join_action" method="post">
		<table>
			<tr>
				<td>���̵� :</td>
				<td><input type="text" id="mem_id" name="mem_id"></td>
		<tr>
				<td>��й�ȣ :</td>
				<td><input type="password" id="mem_passwd1" name="mem_passwd1"></td>
			</tr>
			<tr>
				<td>��й�ȣ Ȯ�� :</td>
				<td><input type="password" id="mem_passwd2" name="mem_passwd2"></td>
			</tr>
			<tr>
				<td>�ڵ��� ��ȣ :</td>
				<td><input type="text" id="mem_phone" name="mem_phone"></td>
			</tr>
			<tr>
				<td>�̸��� :</td>
				<td><input type="text" id="mem_email" name="mem_email"></td>
			</tr>
			<tr>
				<td>������� :</td>
				<td><input type="date" id="mem_birth" name="mem_birth"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="radio" name="chk_admin"
					value="seller">�Ǹ��� <input type="radio" name="chk_admin"
					value="buyer" checked="checked">������</td>
			</tr>

			<tr>
				<td><input type="text" id="postcode"  name="postcode"placeholder="�����ȣ">
					<input type="button" onclick="sample4_execDaumPostcode()" value="�����ȣ ã��"><br> 
					<input type="text" id="roadAddress" name="roadAddress" placeholder="���θ��ּ�">
					 <input type="text" id="jibunAddress" name="jibunAddress" placeholder="�����ּ�"> <span id="guide"
					style="color: #999"></span></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="����"></td>
			</tr>
		</table>

	</form>
</body>

</html>