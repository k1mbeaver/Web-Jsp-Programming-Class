/**
 * ��ȿ�� �˻縦 ���� �ڹٽ�ũ��Ʈ
 */
document.charset = "euc-kr";

function CheckAddProduct()
{
	var productId = document.getElementsByName("productId")[0];
	var name = document.getElementsByName("name")[0];
	var unitPrice = document.getElementsByName("unitPrice")[0];
	var unitsInStock = document.getElementsByName("unitsInStock")[0];
	
	//��ǰ ���̵� üũ
	if( !check (/^P[0-9]{4,11}$/, productId[0], "[��ǰ �ڵ�]\nP�� ���ڸ� �����Ͽ� 5~12�� ���� �Է��ϼ���\n ù ���ڴ� �ݵ�� P�� �����ϼ���"))
		return false;
		
	//��ǰ �� üũ
	if(name.value.length < 4 || name.value.length > 12)
	{
		alert("[��ǰ��]\n�ּ� 4�ڿ��� �ִ� 12�� ���� �Է��ϼ���");
		name.select();
		name.focus();
		return false;
	}
	
	//��ǰ ���� üũ
	if(unitPrice.value.length == 0 || isNaN(unitPrice.value))
	{
		alert("[����]\n���ڸ� �Է��ϼ���");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	if(unitPrice.value < 0)
	{
		alert("[����]\n������ �Է��� �� �����ϴ�.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	else if ( !check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice, "[����]\n�Ҽ��� ��° �ڸ������� �Է��ϼ���"))
		return false;
		
	//��� �� üũ
	if(isNaN(unitsInStock.value))
	{
		alert("[��� ��]\n���ڸ� �Է��ϼ���.");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	function check(regExp, e, msg)
	{
		if(regExp.test(e.value))
		{
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;	
	}
	
	document.newProduct.submit();
}