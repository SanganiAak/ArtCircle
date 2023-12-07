// Navbar.js

import image3 from "../Header/talent.png";
import image2 from "../Header/artist.jpg";
import React, { useState,useEffect } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import { Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faSearch } from "@fortawesome/free-solid-svg-icons";
import {
  faHome,
  faBriefcase,
  faUser,
  faSignInAlt,
} from "@fortawesome/free-solid-svg-icons";
import "./Navbar.css";
const BASE_URL = process.env.REACT_APP_BASE_URL;

function Navbar() {
 // console.log(userRole+"sgrb");
  const navigate = useNavigate();
  const location = useLocation();

  const [userRole, setuserRole] = useState(null);

  useEffect(() => {
    async function fetchUserEmail() {
      try {
        const response = await fetch(`${BASE_URL}`, {
          method: "GET",
          credentials: "include",
        });

        if (response.ok) {
          const data = await response.json();
          if (data.valid === false) {
            navigate("/");
          } else {setuserRole(data.role); console.log(data.role+"DDVVD")};
        } else {
          throw new Error("Failed to fetch email");
        }
      } catch (error) {
        console.error("Error fetching email:", error);
        // Handle errors
      }
    }
    fetchUserEmail();
  }, []);
  const SearchBox = () => (
    <li className="nav-item">
      <div className="search-box">
        <input type="text" placeholder=" Search" className="search-input" />
        <FontAwesomeIcon icon={faSearch} className="search-icon" />
      </div>
    </li>
  );

  const menuData = [
    { label: "Home", path: "/home" },

    {
      label: userRole === "Employer" ? "Create Jobs" : "Apply For Jobs",
      path: userRole === "Employer" ? "/createjobs" : "/profession"
    },
    // { label: "Contact", path: "/contact" },
    { label: "My Profile", path: "/profile" },
    { label: "Sign Out", path: "/" },


  ];

  const NavItem = ({ to, icon, label, onClick }) => {
    const isActive = location.pathname === to;

    const itemStyle = {
      color: isActive ? "black" : "grey", // Change to the desired text color
    };

    const iconStyle = {
      color: isActive ? "black" : "grey", // Change to the desired icon color
    };

    if (label === "Logout") {
      return (
        <li className="nv-it" style={itemStyle}>
          <button className="nv-link" onClick={onClick}>
            <FontAwesomeIcon icon={icon} className="icn" style={iconStyle} />
            <span>{label}</span>
          </button>
        </li>
      );
    } else if (label === "Profile") {
      return (
        <li className="nv-it" style={itemStyle}>
          <Link to={to} className="nv-link">
            <img src={image2} alt="My Profile" className="pfl-icn" />
            <span>{label}</span>
          </Link>
        </li>
      );
    } else {
      return (
        <li className="nv-it" style={itemStyle}>
          <Link to={to} className="nv-link">
            <FontAwesomeIcon icon={icon} className="icn" style={iconStyle} />
            <span>{label}</span>
          </Link>
        </li>
      );
    }
  };

  const logout = async (event) => {
    event.preventDefault();
    try {
      const response = await fetch(`${BASE_URL}/logout`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
      });

      const data = await response.status;
      if (data === 200) {
        navigate("/");
      } else {
        alert(`Logout failed: ${data.message}`);
      }
    } catch (error) {
      console.error("Error during logout:", error);
      alert("An error occurred during logout.");
    }
  };

  return (
    <nav className="nvr">
      <div className="lg-cntnr">
        <span className="ws-nm">Talent Palette</span>
      </div>

      <ul className="nv-lst">
        <NavItem to="/home" icon={faHome} label="Home" />

        {userRole==="Employer" ? <NavItem to="/createjobs" icon={faBriefcase} label="Create Jobs" />:  <NavItem to="/profession" icon={faBriefcase} label="Apply For Jobs" />}
        
        <NavItem to="/profile" icon={faUser} label="My Profile" />
        {/* <NavItem to="/profile" icon={faUser} label="Contact Us" /> */}

        <NavItem onClick={logout} icon={faSignInAlt} label="Logout" />
      </ul>
    </nav>
  );
}

export default Navbar;
