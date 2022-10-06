<%--
  Created by IntelliJ IDEA.
  User: Vanxuan
  Date: 10/5/2022
  Time: 9:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../bootstrap-5.0.2-dist/css/bootstrap.min.css">
    <style>

        :root {
            --white-color: #fff;
            --black-color: #000;
            --text-color: #333;
        }

        * {
            box-sizing: border-box;
        }

        html {
            font-size: 62.5%;
            line-height: 1.6rem;
            font-family: "Times New Roman";
            box-sizing: border-box;
        }

        .grid {
            width: 1200px;
            max-width: 100%;
            margin: 0 auto;
        }

        .header {
            height: 90px;
            display: flex;
            align-items: center;
            background-color: #8F8318;
        }

        .header__navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header__navbar-list {
            display: flex;
            align-items: center;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .header__navbar-list form {
            margin: 0;
        }

        .header__navbar-item {
            margin: 0 12px;
            position: relative;
            min-height: 26px;
        }

        .header__navbar-item--has-notify:hover .header__notify {
            display: block;
        }

        .header__navbar-item, .header__navbar-item-link {
            font-size: 2rem;
            color: var(--white-color);
            text-decoration: none;
            font-weight: 300;
        }

        .header__navbar-item, .header__navbar-item-link, .header__navbar-icon {
            display: inline-flex;
            align-items: center;
        }

        .header__navbar-item--strong {
            font-weight: 400;
        }

        .header__navbar-item:hover,
        .header__navbar-item-link:hover {
            cursor: pointer;
            color: rgba(255, 255, 255, 0.7);
        }

        .header__navbar-icon-link {
            color: white;
            text-decoration: none;
        }

        .header__navbar-icon {
            font-size: 1.8rem;
            margin: 0 10px;
        }

        .header__notify {
            position: absolute;
            top: 100%;
            width: 400px;
            left: 0;
            background-color: lightgray;
            border: 1px solid gray;
            transform-origin: top left;
            animation: headerNotifyGrowth ease-in 0.23s;
            display: none;
        }

        @keyframes headerNotifyGrowth {
            from {
                transform: scale(0);
            }
            to {
                transform: scale(1);
            }
        }

        .header__notify-header {
            height: 40px;
            background-color: white;

        }

        .header__notify-header h3 {
            color: #888;
            margin: 0 0 0 12px;
            width: 200px;
            font-size: 2rem;
            line-height: 40px;
        }

        .header__notify-list {
            padding-left: 0;

        }

        .header__notify-item {
            display: flex;
        }

        .header__notify-item:hover {
            background-color: #4CAF50;
        }

        .header__notify-info {
            margin-left: 1.2rem;
        }

        .header__notify-name {
            display: block;
            font-size: 1.7rem;
            color: black;
            text-decoration: blink;

        }

        .content {
            position: relative;
            width: 100%;
            height: 100vh;
            background-image: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.75)), url("https://cdn.mos.cms.futurecdn.net/3WcZUWAMGTpTqjkZhjof64.jpg");
            background-size: cover;
            background-position: center;
        }

        .footer {
            font-size: 20px;
            color: black;
            margin-left: 0;
            position: absolute;
            top: 750px;
            left: 500px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <header class="header">
                <div class="grid">
                    <nav class="header__navbar">
                        <ul class="header__navbar-list">
                            <li class="header__navbar-item header__navbar-item--separate"><img src="img/furamaLogo.jpg"
                                                                                               style="height: 70px;width: 70px">
                            </li>
                            <li class="header__navbar-item header__navbar-item--has-notify"><a href=""
                                                                                               class="header__navbar-item-link">Employee</a>
                                <div class="header__notify">
                                    <header class="header__notify-header">
                                        <h3>Computers list</h3>
                                    </header>
                                    <ul class="header__notify-list">
                                        <li class="header__notify-item">
                                            <a href="/employee?action=" class="header__notify-link">
                                                <div class="header__notify-info"><span
                                                        class="header__notify-name">Employee List</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="header__notify-item">
                                            <a href="/employee?action=add" class="header__notify-link">
                                                <div class="header__notify-info"><span
                                                        class="header__notify-name">Add Employee</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="header__notify-item">
                                            <a href="/employee?action=edit" class="header__notify-link">
                                                <div class="header__notify-info"><span
                                                        class="header__notify-name">Edit Employee</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="header__notify-item">
                                            <a href="" class="header__notify-link">
                                                <div class="header__notify-info"><span
                                                        class="header__notify-name">Delete Employee</span>
                                                </div>
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                            </li>
                            <li class="header__navbar-item header__navbar-item--has-notify"><a href=""
                                                                                               class="header__navbar-item-link">
                                Customer</a>
                                <div class="header__notify">
                                    <header class="header__notify-header">
                                        <h3>Computers list</h3>
                                    </header>
                                    <ul class="header__notify-list">
                                        <li class="header__notify-item">
                                            <a href="" class="header__notify-link">
                                                <div class="header__notify-info"><span
                                                        class="header__notify-name">Customer List</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="header__notify-item">
                                            <a href="" class="header__notify-link">
                                                <div class="header__notify-info"><span
                                                        class="header__notify-name">Add Customer</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="header__notify-item">
                                            <a href="" class="header__notify-link">
                                                <div class="header__notify-info"><span
                                                        class="header__notify-name">Edit Customer</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="header__notify-item">
                                            <a href="" class="header__notify-link">
                                                <div class="header__notify-info"><span
                                                        class="header__notify-name">Delete Customer</span>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="header__navbar-item header__navbar-item--has-notify"><a href=""
                                                                                               class="header__navbar-item-link">Service</a>
                                <div class="header__notify">
                                    <header class="header__notify-header">
                                        <h3>Accessories list</h3>
                                    </header>
                                    <ul class="header__notify-list">
                                        <li class="header__notify-item">
                                            <a href="" class="header__notify-link">
                                                <div class="header__notify-info"><span
                                                        class="header__notify-name">Villa</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="header__notify-item">
                                            <a href="" class="header__notify-link">
                                                <div class="header__notify-info"><span
                                                        class="header__notify-name">House</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="header__notify-item">
                                            <a href="" class="header__notify-link">
                                                <div class="header__notify-info"><span
                                                        class="header__notify-name">Room</span>
                                                </div>
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                            </li>
                            <li class="header__navbar-item header__navbar-item--has-notify"><a href=""
                                                                                               class="header__navbar-item-link">
                                Contract</a>

                            </li>
                        </ul>
                        <ul class="header__navbar-list" style="margin-right: 25px">
                            <li>
                                <form class="d-flex">
                                    <input style="width: 200px;height: 40px" class="form-control me-2" type="search"
                                           placeholder="Search" aria-label="Search">
                                    <button class="btn btn-outline-primary"
                                            style="color: white;background-color: blueviolet;width: 70px"
                                            type="submit">Search
                                    </button>
                                </form>
                            </li>
                        </ul>
                    </nav>
                </div>
            </header>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <img src="img/yeah.jpeg" style="width: 100%;display: block">
        </div>
    </div>
    <div class="row" style=" margin-top: 100px; ">
        <div class="col-lg-6">
            <div class="row">
                <h3 style="font-size: 27px;color: red;word-break: normal">KHU NGHỈ DƯỠNG ĐẲNG CẤP THẾ GIỚI FURAMA ĐÀ
                    NẴNG,
                    TỰ HÀO LÀ KHU NGHỈ
                    DƯỠNG ẨM THỰC TẠI VIỆT NAM</h3>
            </div>
            <div class="row" style="height: 16px;background-color: white">
            </div>
            <div class="row" style="color: black;font-size: 16px;word-break: normal">
                <p>Hướng ra bãi biển Đà Nẵng trải dài cát trắng, Furama Resort Đà Nẵng là cửa ngõ đến với 3 di sản văn
                    hoá
                    thế giới: Hội An (20 phút), Mỹ Sơn (90 phút) và Huế (2 tiếng. 196 phòng hạng sang cùng với 70 căn
                    biệt
                    thự từ hai đến bốn phòng ngủ có hồ bơi riêng đều được trang trí trang nhã, theo phong cách thiết kế
                    truyền thống của Việt Nam và kiến trúc thuộc địa của Pháp, biến Furama thành khu nghỉ dưỡng danh giá
                    nhất tại Việt Nam – vinh dự được đón tiếp nhiều người nổi tiếng, giới hoàng gia, chính khách, ngôi
                    sao
                    điện ảnh và các nhà lãnh đạo kinh doanh quốc tế.</p>
            </div>
            <div class="row" style="height: 16px;background-color: white">
            </div>
            <div class="row">
                <img src="img/06-2%20(1).jpg">
            </div>
            <div class="row" style="height: 16px;background-color: white">
            </div>
            <div class="row">
                <img src="img/DES-PHONGNHA-1.jpg">
            </div>
        </div>
        <div class="col-lg-6">
            <div class="row">
                <a href="https://www.youtube.com/watch?v=VzDrgGaXBjY" class="video-btn js-video-btn">
                    <img src="img/furama-đà-nẵng.jpg" style="width: 100%; display: block">
                </a>
            </div>
            <div class="row" style="height: 16px;background-color: white"></div>
            <div class="row" style="color: black;font-size: 16px;word-break: normal">
                <p> Ẩm thực tại khu nghỉ dưỡng là trải nghiệm kết hợp giữa các món ăn Việt Nam, châu Á, Ý và châu Âu
                    cùng các món bít tết nhập khẩu hảo hạng. Khu nghỉ dưỡng mang đến cho quý khách những không gian ẩm
                    thực đa dạng bao gồm – quầy bar nhìn ra biển, hồ bơi Lagoon được bao quanh bởi khu vườn nhiệt đới,
                    ẩm thực truyền thống Ý tại nhà hàng Don Cipriani’s, chất Á Đông tại Café Indochine hay nhà hàng bít
                    tết “The Fan – Cái Quạt” nằm ngay trên bãi biển. Khu nghỉ dưỡng Furama Đà Nẵng còn gây ấn tượng và
                    tạo nhiều thích thú cho khách thông qua các chương trình vui chơi đầy thú vị như các chuyến du
                    ngoạn, thể thao trên nước, lặn biển và chơi golf cũng như các dịch vụ chăm sóc sức khoẻ và sắc
                    đẹp.</p>
            </div>
            <div class="row" style="height: 16px;background-color: white">
                <div class="row" style="color: black;font-size: 16px;word-break: normal">
                    <p> Nằm tại vị trí đắc địa gần trung tâm Đà Nẵng và là nơi kết nối quốc tế thuận tiện đến Singapore,
                        Bangkok, Xiêm Riệp, Kuala Lumpur, Đài Loan, Tokyo, Osaka, Busan, Seoul, Tokyo, Osaka và Hồng
                        Kông –
                        Ma Cao, Trung Quốc bao gồm: Bắc Kinh, Thượng Hải, Hàng Châu, Quảng Châu, Thành Đô bằng các
                        chuyến
                        bay trực tiếp, khu nghỉ dưỡng Furama Đà Nẵng là điểm đến lý tưởng cho các đại lý du lịch, doanh
                        nghiệp, công ty tổ chức sự kiện. Cung Hội nghị có thể chứa tới 3000 người, cùng với 10 phòng
                        chức
                        năng khác có sức chứa từ 50 đến 300 người. Cung hội nghị Ariyana Convention Centre (ACC) được
                        xây
                        dựng để tổ chức sự kiện APEC 2017, kết nối với Cung hội nghị Furama (ICP) tạo thành quần thể
                        MICE
                        lớn nhất Việt Nam có sức chứa lên tới 5,000 khách.</p>
                </div>
                <div class="row" style="height: 10px;background-color: white"></div>
                <div class="row" style="color: black;font-size: 16px;word-break: normal">
                    <p> Một loạt các bữa tiệc theo chủ đề trên bãi biển hoặc xung quanh hồ Lagoon, trong phòng đại
                        tiệc hoặc bên ngoài khu nghỉ dưỡng, kết hợp các dịch vụ đặc biệt như VIP xuất hiện từ trực
                        thăng đáp xuống bãi đáp riêng của khu nghỉ dưỡng;
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/68540fcb59.js" crossorigin="anonymous"></script>
</body>

</html>
