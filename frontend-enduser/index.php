<?php
include 'components/render.php';
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Cửa Hàng Sách</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="public/js/main.js"></script>
    <link rel="stylesheet" href="public/css/icon.css">
    <link rel="stylesheet" href="public/css/main.css">
</head>
<body>
    <?php
        renderAvatar('avt-1', 'xs', 'active');
        renderAvatar('avt-2', 's', 'active');
        renderAvatar('avt-3', 'm', 'active');
        renderAvatar('avt-4', 'l', 'active');
        renderAvatar('avt-5', 'xl', 'active');

        echo "<div class='button-list'>";
        renderButton('btn-1', 'Button S', 's', 'primary', 'submit', 'ic-Add_Plus_Circle');
        renderButton('btn-2', 'Button M', 'm', 'secondary', 'submit', 'ic-Add_Plus_Circle');
        renderButton('btn-3', 'Button L', 'l', 'danger', 'submit', 'ic-Add_Plus_Circle');
        renderButton('btn-4', 'Button L', 'l', 'disabled', 'submit', 'ic-Add_Plus_Circle');
        echo "</div>";

        echo "<div class='badge-list'>";
        renderBadge('badge-1', 'Neutral', 'neutral', 'm', 'ic-Add_Plus_Circle');
        renderBadge('badge-2', 'Blue', 'blue', 'm', 'ic-Add_Plus_Circle');
        renderBadge('badge-3', 'Green', 'green', 'm', 'ic-Add_Plus_Circle');
        renderBadge('badge-4', 'Orange', 'orange', 'm', 'ic-Add_Plus_Circle');
        renderBadge('badge-5', 'Red', 'red', 'm', 'ic-Add_Plus_Circle');
        renderBadge('badge-6', 'Outlined', 'outlined', 'm', 'ic-Add_Plus_Circle');
        renderBadge('badge-7', 'Filled', 'filled', 'm', 'ic-Add_Plus_Circle');
        echo "</div>";

        renderCheckbox('checkbox-opt-1', 'Option', 'Opt1', "Option 1");
        renderCheckbox('checkbox-opt-22', 'Option', 'Opt2', "Option 2", 'true');

        renderRadioBtn('rdo-1', 'Gender', 'male', 'Nam');
        renderRadioBtn('rdo-2', 'Gender', 'female', 'Nữ');
    ?>
</body>
</html>
