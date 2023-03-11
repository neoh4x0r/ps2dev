<map version="freeplane 1.7.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="ps2dev" FOLDED="false" ID="ID_532480665" CREATED="1678542236005" MODIFIED="1678544064762" STYLE="bubble">
<font SIZE="18"/>
<hook NAME="MapStyle" zoom="1.076">
    <properties edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff" show_icon_for_attributes="true" fit_to_viewport="false"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="bubble">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes">
<font SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="bubble">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="bubble">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff">
<font SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439">
<font SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000">
<font SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="19" RULE="ON_BRANCH_CREATION"/>
<node TEXT="ps2toolchain" LOCALIZED_STYLE_REF="default" POSITION="right" ID="ID_444628785" CREATED="1678542316093" MODIFIED="1678560492151">
<edge COLOR="#ff0000"/>
<node TEXT="" ID="ID_1732043585" CREATED="1678543768959" MODIFIED="1678543768960">
<hook NAME="FirstGroupNode"/>
</node>
<node TEXT="ps2toolchain-dvp" ID="ID_719916526" CREATED="1678543098328" MODIFIED="1678549044062" HGAP_QUANTITY="61.73912993991758 pt" VSHIFT_QUANTITY="-57.91304287793281 pt">
<node TEXT="binutils-gdb@dvp-v2.14" ID="ID_1010494575" CREATED="1678543321577" MODIFIED="1678543639297"/>
</node>
<node TEXT="ps2toolchain-iop" ID="ID_297763693" CREATED="1678543089389" MODIFIED="1678549040631" HGAP_QUANTITY="56.26086912714016 pt" VSHIFT_QUANTITY="8.608695562935957 pt">
<node TEXT="binutils-gdb@iop-v2.35.2" ID="ID_31406400" CREATED="1678543308185" MODIFIED="1678543591008"/>
<node TEXT="(stage1) gcc@iop-v11.3.0" ID="ID_632415776" CREATED="1678543311141" MODIFIED="1678543596395"/>
</node>
<node TEXT="ps2toolchain-ee" ID="ID_1866184911" CREATED="1678543070641" MODIFIED="1678549037736" HGAP_QUANTITY="44.52173881404567 pt" VSHIFT_QUANTITY="53.21739075269502 pt">
<node TEXT="binutils-gdb@ee-v2.38.0" ID="ID_1718065211" CREATED="1678543275266" MODIFIED="1678543486227"/>
<node TEXT="(stage1) gcc@ee-v11.3.0" ID="ID_1484721567" CREATED="1678543280565" MODIFIED="1678543493635"/>
<node TEXT="newlib@ee-v4.1.0" ID="ID_1234798428" CREATED="1678543285934" MODIFIED="1678543499322"/>
<node TEXT="(nano) newlib@ee-v4.1.0" ID="ID_122762424" CREATED="1678543287150" MODIFIED="1678543504780"/>
<node TEXT="pthread-embedded@platform_agnostic" ID="ID_1031886938" CREATED="1678543288322" MODIFIED="1678543510545"/>
<node TEXT="(stage2) gcc@ee-v11.3.0" ID="ID_793225443" CREATED="1678543289194" MODIFIED="1678543518988"/>
</node>
<node TEXT="" ID="ID_227616753" CREATED="1678543768958" MODIFIED="1678543768959">
<hook NAME="SummaryNode"/>
<hook NAME="AlwaysUnfoldedNode"/>
<node TEXT="[required] Builds the cross-compiler" LOCALIZED_STYLE_REF="default" ID="ID_183777757" CREATED="1678543768960" MODIFIED="1678560478731"/>
</node>
</node>
<node TEXT="" POSITION="right" ID="ID_1197281510" CREATED="1678543863055" MODIFIED="1678543863056">
<edge COLOR="#ff00ff"/>
<hook NAME="FirstGroupNode"/>
</node>
<node TEXT="ps2sdk" POSITION="right" ID="ID_127096138" CREATED="1678542372436" MODIFIED="1678542453924" STYLE="bubble" HGAP_QUANTITY="16.249999932944775 pt" VSHIFT_QUANTITY="3.749999888241294 pt">
<edge COLOR="#0000ff"/>
</node>
<node TEXT="ps2sdk-ports" POSITION="right" ID="ID_131235099" CREATED="1678542847583" MODIFIED="1678544060546" STYLE="bubble" VSHIFT_QUANTITY="25.04347800126824 pt">
<edge COLOR="#7c0000"/>
</node>
<node TEXT="" POSITION="right" ID="ID_1250731546" CREATED="1678543863053" MODIFIED="1678544069668">
<edge COLOR="#00ff00"/>
<hook NAME="SummaryNode"/>
<hook NAME="AlwaysUnfoldedNode"/>
<node TEXT="[required] Bulds the software development kit" ID="ID_1004527310" CREATED="1678543863056" MODIFIED="1678549148857" HGAP_QUANTITY="24.17391293801522 pt" VSHIFT_QUANTITY="-0.7826086875396325 pt"/>
</node>
<node TEXT="" POSITION="right" ID="ID_235028217" CREATED="1678543928782" MODIFIED="1678543928782">
<edge COLOR="#7c0000"/>
<hook NAME="FirstGroupNode"/>
</node>
<node TEXT="ps2-packer" POSITION="right" ID="ID_171083256" CREATED="1678542864108" MODIFIED="1678544061955" STYLE="bubble" HGAP_QUANTITY="14.782608687539632 pt" VSHIFT_QUANTITY="20.347825876030445 pt">
<edge COLOR="#00007c"/>
</node>
<node TEXT="" POSITION="right" ID="ID_1587630108" CREATED="1678543928781" MODIFIED="1678543928782">
<edge COLOR="#00ffff"/>
<hook NAME="SummaryNode"/>
<hook NAME="AlwaysUnfoldedNode"/>
<node TEXT="[optional] Builds the binary packer (compressor)" ID="ID_159178652" CREATED="1678543928783" MODIFIED="1678549137227"/>
</node>
<node TEXT="" POSITION="right" ID="ID_1774518269" CREATED="1678544008068" MODIFIED="1678544008068">
<edge COLOR="#007c00"/>
<hook NAME="FirstGroupNode"/>
</node>
<node TEXT="ps2client" POSITION="right" ID="ID_1460970754" CREATED="1678542870484" MODIFIED="1678544064762" STYLE="bubble" HGAP_QUANTITY="16.347826062618896 pt" VSHIFT_QUANTITY="34.43478225174383 pt">
<edge COLOR="#007c00"/>
</node>
<node TEXT="" POSITION="right" ID="ID_350166199" CREATED="1678544008067" MODIFIED="1678544008068">
<edge COLOR="#00007c"/>
<hook NAME="SummaryNode"/>
<hook NAME="AlwaysUnfoldedNode"/>
<node TEXT="[optional] Builds the PC frontend client for ps2link/ps2netfs" ID="ID_751122331" CREATED="1678544008068" MODIFIED="1678549141886"/>
</node>
</node>
</map>
