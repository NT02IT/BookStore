<?php
function renderCheckbox($id, $name, $value, $label='', $selected='false') {
    $labelE = ($label != '') ? "<span>$label</span>" : '';
    $checked = ($selected == 'true') ? 'checked' : '';

    echo "
        <label class='checkbox-item $checked' for='$id'>
            <input type='checkbox' id='$id' name='$name' value='$value' $checked>
            <i class='ic-Checkbox_Check icon-check'></i>
            <i class='ic-Checkbox_Unchecked icon-uncheck'></i>
            $labelE    
        </label>    
    ";
}
?>
