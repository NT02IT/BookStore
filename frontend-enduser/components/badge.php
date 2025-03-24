<?php
function renderBadge($id, $text, $color='neutral', $size='m', $iconClass='') {
    $icon = ($iconClass != '') ? "<i class='$iconClass'></i>" : '';

    echo "
        <div id='$id' class='badge $color $size'>
            <div class='badge-dot'></div>
            $icon
            $text
        </div>
    ";
}
?>
