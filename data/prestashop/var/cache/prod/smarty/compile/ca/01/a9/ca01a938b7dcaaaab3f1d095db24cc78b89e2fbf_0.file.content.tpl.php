<?php
/* Smarty version 3.1.48, created on 2024-06-14 14:54:24
  from '/var/www/html/admin408di3knh/themes/default/template/content.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.48',
  'unifunc' => 'content_666c91e0502b02_57775208',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'ca01a938b7dcaaaab3f1d095db24cc78b89e2fbf' => 
    array (
      0 => '/var/www/html/admin408di3knh/themes/default/template/content.tpl',
      1 => 1702485415,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_666c91e0502b02_57775208 (Smarty_Internal_Template $_smarty_tpl) {
?><div id="ajax_confirmation" class="alert alert-success hide"></div>
<div id="ajaxBox" style="display:none"></div>

<div class="row">
	<div class="col-lg-12">
		<?php if ((isset($_smarty_tpl->tpl_vars['content']->value))) {?>
			<?php echo $_smarty_tpl->tpl_vars['content']->value;?>

		<?php }?>
	</div>
</div>
<?php }
}
