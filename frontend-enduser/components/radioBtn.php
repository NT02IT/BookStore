<?php
function renderRadioBtn($id, $name, $value, $label='', $selected='false', $isRequired='false') {
    $labelE = ($label != '') ? "<span>$label</span>" : '';
    $checked = ($selected == 'true') ? 'checked' : '';
    $required = ($isRequired == 'true') ? 'required' : '';

    echo "
        <label class='radiobtn' for='$id'>
            <input id='$id' type='radio' name='$name' value='$value' $checked $required>
            <i class='ic-Radio_Fill icon-check'></i>
            <i class='ic-Radio_Unchecked icon-uncheck'></i>
            $labelE            
        </label>
    ";
}
?>
