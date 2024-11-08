$(document).ready(function () {
    $(".owl-carousel.owl-carousel-technology").owlCarousel({
        loop: true,
        margin: 10,
        autoplay: true,
        nav: true,
        responsive: {
            0: {
                items: 2,
            },
            600: {
                items: 4,
            },
            1000: {
                items: 7,
            },
        },
    });
});
$(document).ready(function () {
    $(".owl-carousel.owl-carousel-review").owlCarousel({
        loop: true,
        margin: 70,
        dots: false,
        autoplay: true,
        nav: false,
        autoplayTimeout:1500,
        responsive: {
            0: {
                items: 1,
            },
            767: {
                items: 2,
            },
        },
    });
});
$(document).ready(function () {
    $(".owl-carousel.owl-carousel-header").owlCarousel({
        loop: true,
        margin: 70,
        dots: false,
        autoplay: true,
        nav: false,
        smartSpeed: 1000,
        autoplayTimeout:4000,
        responsive: {
            0: {
                items: 1,
            },
        },
    });
});

function cancelFunction() {
    document.getElementById("applymodal").style.display = "none";
}

function applyModalOpen() {
    document.getElementById("applydetailmodal").style.display = "none";
    document.getElementById("applymodal").style.display = "block";
}

function cancelDetailFunction() {
    document.getElementById("applydetailmodal").style.display = "none";
}

function cancelPortfolioDetailFunction() {
    document.getElementById("portfoliodetailmodal").style.display = "none";
}

function applyDetailModalOpen() {
    document.getElementById("applydetailmodal").style.display = "block";
}

function applyPortfolioDetailModalOpen() {
    document.getElementById("portfoliodetailmodal").style.display = "block";
}


function mobileDropdownFirstOpen() {
    var x = document.getElementById("dropdownOne");
    if (x.style.display === "none") {
      x.style.display = "block";
    } else {
      x.style.display = "none";
    }
}

function mobileDropdownTwoOpen() {
    var y = document.getElementById("dropdownTwo");
    if (y.style.display === "none") {
      y.style.display = "block";
    } else {
      y.style.display = "none";
    }
}
