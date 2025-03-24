<?php
function renderAvatar($id, $size = 'm', $state = '', $img=".\assets\imgs\Avatar-Placeholder.png") {
    echo "
        <div id='$id' class='avatar $size'>
            <img src='$img' alt='Avatar'>
            <div class='indicator $state'></div>
        </div>
    ";
}
?>
