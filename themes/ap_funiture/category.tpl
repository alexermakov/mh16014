{*
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{include file="$tpl_dir./errors.tpl"}
{if isset($category)}
	{if $category->id AND $category->active}

        <h1 class="page-heading{if (isset($subcategories) && !$products) || (isset($subcategories) && $products) || !isset($subcategories) && $products} product-listing{/if}">
            <span class="cat-name">
                {$category->meta_title|escape:'html':'UTF-8'}{if isset($categoryNameComplement)}&nbsp;{$categoryNameComplement|escape:'html':'UTF-8'}{/if}
            </span>
            {include file="$tpl_dir./category-count.tpl"}
        </h1>
        {if $category->description}
            <div class="cat_desc rte">
            {if Tools::strlen($category->description) > 350}
                <div id="category_description_short">{$description_short}</div>
                <div id="category_description_full" class="unvisible">{$category->description}</div>
                <a href="{$link->getCategoryLink($category->id_category, $category->link_rewrite)|escape:'html':'UTF-8'}" class="lnk_more">{l s='More'}</a>
            {else}
                <div>{$category->description}</div>
            {/if}
            </div>
        {/if}
		{if isset($subcategories)}
        {if (isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories) }        
		<!-- Subcategories -->
		<h4>{l s='Subcategories'}</h4>			
        <div id="subcategories">
			<div class="clearfix row">
			{foreach from=$subcategories item=subcategory}
				<div class="col-md-3 col-xs-6 col-sp-12">
                	<div class="subcategories scene_cat">
                		<div class="image">
							<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" title="{$subcategory.name|escape:'html':'UTF-8'}" class="img">
							{if $subcategory.id_image}
								<img class="replace-2x img-responsive" src="{$link->getCatImageLink($subcategory.link_rewrite, $subcategory.id_image, 'category_default')|escape:'html':'UTF-8'}" alt=""/>
							{else}
								<img class="replace-2x img-responsive" src="{$img_cat_dir}{$lang_iso}-default-category_default.jpg" alt=""/>
							{/if}
						</a>
                   		</div>
						<h5 class="cat-name"><a class="subcategory-name" href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}">{$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'}</a></h5>
						{if $subcategory.description}
							<div class="cat-desc">{$subcategory.description}</div>
						{/if}
					</div>
				</div>
			{/foreach}
			</div>
		</div>
        {/if}
		{/if}
		{if $products}
			{include file="$tpl_dir./sub/product/product-list-form.tpl"}
		{/if}
	{elseif $category->id}
		<p class="alert alert-warning">{l s='This category is currently unavailable.'}</p>
	{/if}
{/if}