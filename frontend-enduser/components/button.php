<?php
function renderButton($id, $text, $size = 'm', $style='primary', $type='submit', $iconClass='') {
    $icon = ($iconClass != '') ? "<i class='$iconClass'></i>" : '';

    echo "
        <button type='$type' id='$id' class='button $size $style'>
            $icon
            $text
        </button>
    ";
}
?>
