<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2023, Pylo, opensource contributors
 #
 # This program is free software: you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <https://www.gnu.org/licenses/>.
 #
 # Additional permission for code generator templates (*.ftl files)
 #
 # As a special exception, you may create a larger work that contains part or
 # all of the MCreator code generator templates (*.ftl files) and distribute
 # that work under terms of your choice, so long as that work isn't itself a
 # template for code generation. Alternatively, if you modify or redistribute
 # the template itself, you may (at your option) remove this special exception,
 # which will cause the template and the resulting code generator output files
 # to be licensed under the GNU General Public License without this special
 # exception.
-->

<#-- @formatter:off -->

/*
 *    MCreator note: This file will be REGENERATED on each build.
 */
package ${package}.init;

@Mod.EventBusSubscriber(bus = Mod.EventBusSubscriber.Bus.MOD) public class ${JavaModName}DamageSources {

<#list damagetypes as damageType>
		public static final <#if damageType.scaling == "when_caused_by_living_non_player" || damageType.effects == "thorns">EntityDamageSource<#else>DamageSource</#if> ${damageType.getModElement().getRegistryNameUpper()} = (new DamageSource("${damageType.getModElement().getRegistryName()}"))<#if damageType.scaling == "when_caused_by_living_non_player">.scalesWithDifficulty()<#elseif damageType.scaling == "always">.setScalesWithDifficulty()</#if><#if damageType.effects == "burning">.bypassArmor().setIsFire()<#elseif damageType.effects == "freezing" || damageType.effects == "drowning">.bypassArmor()<#elseif damageType.effects == "thorns">.setThorns()</#if>;
</#list>
}
<#-- @formatter:on -->
