function rgba(hex,opacity){
    hex = hex.replace('#','');
    redColor = parseInt(hex.substring(0,2), 16);
    greenColor = parseInt(hex.substring(2,4), 16);
    blueColor = parseInt(hex.substring(4,6), 16);

    result = 'rgba('+redColor+','+greenColor+','+blueColor+','+opacity/100+')';
    return result;
}

var loadJS = function(url, implementationCode, location) {
	var scriptTag = document.createElement('script');
	scriptTag.src = url;

	scriptTag.onload = implementationCode;
	scriptTag.onreadystatechange = implementationCode;

	location.appendChild(scriptTag);
};

function ajaxio(method,url,type=null,data=null) {
	return new Promise((resolve, reject) => {
		const req = new XMLHttpRequest();
		req.open(method, url, true); 

		if (method == 'POST') {
			if (type == 'json' && data != null) {
				req.setRequestHeader('Content-Type', 'application/json');
				var data = JSON.stringify(data);
			}
			else { req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); }
		}

		req.onload = () => req.status === 200 ? resolve(req.response) : reject(Error(req.statusText));
		req.onerror = (e) => reject(Error(`Network Error: ${e}`));

		if (method == 'POST') { req.send(data); }
		else { req.send(); }
	});
}

Object.prototype.addMultiListener = function(eventNames, listener) {
	var events = eventNames.split(' ');

	if (NodeList.prototype.isPrototypeOf(this) == true) {
		for (var x=0, xLen=this.length; x<xLen; x++) {
			for (var i=0, iLen=events.length; i<iLen; i++) { this[x].addEventListener(events[i], listener, false); }
		}
	}

	else if (HTMLElement.prototype.isPrototypeOf(this) == true) {
		for (var i=0, iLen=events.length; i<iLen; i++) { this.addEventListener(events[i], listener, false); }
	}
}

// Renders a money value as $1,234,567 (or 1.234.567 when thousandSeparator is '.')
function formatMoney(amount, separator) {
	var money = Number(amount);

	if (isNaN(money) == true) { money = 0; }

	var moneyString = Math.floor(Math.abs(money)).toString();
	var shortMoney = '';
	var count = 0;

	for (var i = moneyString.length - 1; i >= 0; i--) {
		shortMoney = moneyString[i] + shortMoney;
		count = count + 1;
		if (count % 3 == 0 && i != 0) { shortMoney = (separator || ',') + shortMoney; }
	}

	if (money < 0) { shortMoney = '-' + shortMoney; }

	return '$' + shortMoney;
}

// Thirst and hunger render as tall icon tiles filled from the bottom (vertical).
// Health, armor, stamina and any custom status render as wide bars (horizontal).
function IS_VERTICAL_STATUS(name) {
	return name == 'thirst' || name == 'hunger';
}

window.onload = function () {
		var eventCallback = {
			ui: function(data) {
				document.querySelector('#health').style.display = 'block';
				document.querySelector('#armor').style.display = 'block';
				document.querySelector('#hunger').style.display = 'block';
				document.querySelector('#thirst').style.display = 'block';
				document.querySelector('#job').style.display = 'block';
				document.querySelector('#voice').style.display = 'block';
				document.querySelector('#weapon').style.display = 'block';

				if (data.config) {
					// Repositions the health/armor/thirst/hunger square (Config.ui.statusOffset)
					if (data.config.statusOffsetX !== undefined && data.config.statusOffsetX !== null) {
						document.querySelector('#playerPanel').style.left = 'calc(320px + ' + parseInt(data.config.statusOffsetX, 10) + 'px)';
					}
					if (data.config.statusOffsetY !== undefined && data.config.statusOffsetY !== null) {
						document.querySelector('#playerPanel').style.bottom = 'calc(35px + ' + parseInt(data.config.statusOffsetY, 10) + 'px)';
					}

					// Optional runtime rename of the server name box (Config.ui.serverName)
					if (data.config.serverName) {
						document.querySelector('#serverName .server-name-text').textContent = data.config.serverName;
					}
				}
			},
			element: function(data) {
				if (data.task == 'enable') { document.querySelector('#'+data.value).style.display = 'block'; }
				// else if (data.task == 'disable') { document.querySelector('#'+data.value).style.display = 'none'; }
			},
			setText: function(data) {
				var key = document.querySelector('#'+data.id+' span');
				var html = data.value;
				saferInnerHTML(key, html);
			},
			setFont: function(data) {
				document.querySelector('#font').href = data.url;
				document.body.style.fontFamily = data.name;
			},
			setLogo: function(data) { document.querySelector('#server img').setAttribute('src', data.value); },
			
			// data.wallet = money held in ox_inventory, data.bank = wx_banking balance
			setMoney: function(data) {
				var separator = (data && data.separator) ? data.separator : ',';
				var wallet = (data && data.wallet !== undefined && data.wallet !== null) ? data.wallet : 0;
				var bank = (data && data.bank !== undefined && data.bank !== null) ? data.bank : 0;

				var walletElement = document.querySelector('#wallet .money-value');
				var bankElement = document.querySelector('#bank .money-value');

				if (walletElement) { walletElement.textContent = formatMoney(wallet, separator); }
				if (bankElement) { bankElement.textContent = formatMoney(bank, separator); }
			},


			isTalking: function(data) {
				var voiceId = document.querySelector('#voice');
				if (data.value) { voiceId.classList.add('speak'); }
				else { voiceId.classList.remove('speak'); }
			},


			setVoiceDistance: function(data) {
				var voiceId = document.querySelector('#voice');
				var voiceIdWithClasses = voiceId.classList;

				voiceIdWithClasses.remove('whisper', 'normal', 'shout');
				voiceIdWithClasses.add(data.value);
			},


			createStatus: function(data) {
				var motherStatus = document.querySelector('div#status ul');

				var statusID = data.status;
				var statusPrimaryColor = rgba(data.color,100);
				var statusSecondaryColor = rgba(data.color,75);
				var statusIcon = data.icon + '<span style="background: linear-gradient(0deg, '+statusSecondaryColor+' 0%, '+statusPrimaryColor+' 100%);"></span>';


				if (document.getElementById(statusID)) { }
				else {
					var newStatus = document.createElement('li');
					newStatus.classList.add('icon', 'customstatus');
					newStatus.id = statusID;

					motherStatus.insertBefore(newStatus, motherStatus.firstChild);

					saferInnerHTML(document.getElementById(statusID), statusIcon);
				}
			},

			setStatus: function(data) {
				if (data.isdead == true) {
					if (document.querySelector('#health').classList.contains('dead') == false) {
						document.querySelector('#health').classList.add('dead');
						for (i = 0; i < data.status.length; i++) { document.querySelector('#'+data.status[i].name+' span').style[IS_VERTICAL_STATUS(data.status[i].name) ? 'height' : 'width'] = '0'; }	
					}
				}
				else if (data.isdead == false) {
					for (i = 0; i < data.status.length; i++) {
						// Every status arrives from Lua as a 0-100 value where 100 = full.
						// Thirst/hunger fill vertically (tall icon tiles), health/armor
						// fill horizontally (wide bars).
						var statusValue = Math.floor(data.status[i].value);
						var statusSpan = document.querySelector('#'+data.status[i].name+' span');
						if (statusSpan) { statusSpan.style[IS_VERTICAL_STATUS(data.status[i].name) ? 'height' : 'width'] = statusValue+'%'; }
						if (statusValue <= 35) {
							if (document.querySelector('#'+data.status[i].name)) {
								if (document.querySelector('#'+data.status[i].name).classList.contains('dying') == false) {
									document.querySelector('#'+data.status[i].name).classList.add('dying');	
								}
							}
						}
						else {
							if (document.querySelector('#'+data.status[i].name)) { document.querySelector('#'+data.status[i].name).classList.remove('dying'); }
						}
					}
					if (document.querySelector('#health').classList.contains('dead')) { document.querySelector('#health').classList.remove('dead'); }
				}
			},

			updateWeapon: function(data) {
				var weaponContainer = document.querySelector('#weapon');

				if (data.status.armed == true) {
					var oldWeapon = document.querySelector('#weapon_image img').src;
					var newWeapon = 'img/weapons/'+data.status.weapon+'.png';
					if (oldWeapon != newWeapon) {  document.querySelector('#weapon_image img').src = newWeapon; }

					if (weaponContainer.classList.contains('armed') == false) {
						weaponContainer.classList.remove('unarmed', 'fadeOut');
						weaponContainer.classList.add('armed', 'fadeIn');
					}
				}
				else {
					if (weaponContainer.classList.contains('unarmed') == false) {
						weaponContainer.classList.remove('armed', 'fadeIn');
						weaponContainer.classList.add('unarmed', 'fadeOut');
					}
				}
			},

			updateVehicle: function(data) {
				var vehicleInfo = document.querySelector('.info.vehicle');
				var vehicleSeatbelt = document.querySelector('#seatbelt');
				var vehicleLights = document.querySelector('#lights');
				var vehicleSignalRight = document.querySelector('#signalRight');
				var vehicleSignalLeft = document.querySelector('#signalLeft');
				var vehicleSignal = document.querySelector('.signal');
				var vehicleFuel = document.querySelector('#fuel');
				var vehicleCruiser = document.querySelector('#vehicle-speed strong');
				var vehiclesCars = [0,1,2,3,4,5,6,7,8,9,10,11,12,17,18,19,20];

				if (data.status == true) {
					if (vehicleInfo.classList.contains('inactive')) {
						vehicleSeatbelt.style.display = 'none';
						vehicleLights.style.display = 'none';
						vehicleSignal.style.display = 'none';
						vehicleFuel.style.display = 'none';

						if (vehiclesCars.indexOf(data.type) > -1) {
							document.querySelector('#vehicle-others').style.display = 'none';
							document.querySelector('#vehicle-gear').style.display = 'block';

							vehicleSeatbelt.style.display = 'block';
							vehicleLights.style.display = 'block';
							vehicleSignal.style.display = 'block';
							vehicleFuel.style.display = 'block';
							
							document.querySelector('#vehicle-gear').style.display = 'block';
						}

						else {
							document.querySelector('#vehicle-others').style.display = 'block';
							document.querySelector('#vehicle-gear').style.display = 'none';
							document.querySelector('#vehicle-others i').classList.remove('fa-biking', 'fa-helicopter', 'fa-ship');

							if (data.type == 13) { document.querySelector('#vehicle-others i').classList.add('fa-biking'); } 
							else if (data.type == 14) { document.querySelector('#vehicle-others i').classList.add('fa-ship'); } 
							else if (data.type == 15) { document.querySelector('#vehicle-others i').classList.add('fa-helicopter'); }
							else if (data.type == 16) { document.querySelector('#vehicle-others i').classList.add('fa-plane'); } 
							else if (data.type == 21) { document.querySelector('#vehicle-others i').classList.add('fa-train'); } 
						}

						vehicleInfo.classList.remove('inactive');
						vehicleInfo.classList.add('active', 'fadeIn');
					}

					if (vehicleInfo.classList.contains('updated') == false) {
						var vehicleSpeedUnit = data.config.speedUnit.slice(0,2)+'/'+data.config.speedUnit.slice(-1);
						var vehicleAverageSpeed = Math.ceil(data.config.maxSpeed / 6);

						vehicleInfo.classList.add('updated');
						saferInnerHTML(vehicleCruiser,vehicleSpeedUnit);
					}

					var previousGear = document.querySelector('#vehicle-gear span').innerHTML;
					var currentGear = data.gear;
					if (previousGear != currentGear) { document.querySelector('#vehicle-gear').classList.add('pulse') }
					saferInnerHTML(document.querySelector('#vehicle-gear span'), data.gear);

					var speedometerCircle = document.querySelector('#progress-speed svg circle.speed');
					var speedPercentage = Math.floor(Math.floor(data.speed*100)/data.config.maxSpeed);
					
					speedometerCircle.classList.remove('zero');
					speedometerCircle.classList.remove('twentyfive');
					speedometerCircle.classList.remove('fifty');
					speedometerCircle.classList.remove('seventyfive');

					if (speedPercentage >= 0 && speedPercentage <= 25) { speedometerCircle.classList.add('zero'); }
					else if (speedPercentage > 25 && speedPercentage <= 50) { speedometerCircle.classList.add('twentyfive'); }
					else if (speedPercentage > 50 && speedPercentage <= 75) { speedometerCircle.classList.add('fifty'); }
					else if (speedPercentage > 75) { speedometerCircle.classList.add('seventyfive'); }

					document.querySelector('#progress-speed svg circle.speed').style.strokeDashoffset = data.nail;
					saferInnerHTML(document.querySelector('#vehicle-speed span'), data.speed);

					if ( (data.seatbelt.status == true) && (vehicleSeatbelt.classList.contains('on') == false) ) {
						vehicleSeatbelt.classList.remove('off');
						vehicleSeatbelt.classList.add('on');

						eventCallback.sound('sounds/seatbelt-buckle.ogg', { volume: '0.50' });
					}
					else if ( (data.seatbelt.status == false) && (vehicleSeatbelt.classList.contains('off') == false) ) {
						vehicleSeatbelt.classList.remove('on');
						vehicleSeatbelt.classList.add('off');

						eventCallback.sound('sounds/seatbelt-unbuckle.ogg', { volume: '0.50' });
						setTimeout(() => eventCallback.sound('sounds/seatbelt-warning.ogg', { loop: 'loop', volume: '0.50' }), 1000);
					}

					if (vehicleCruiser.classList.contains(data.cruiser) == false) {
						vehicleCruiser.classList.remove('on','off');
						vehicleCruiser.classList.add(data.cruiser);
					}

					if (data.siren == true) { document.querySelector('#vehicle-gear').classList.add('pulsing'); }
					else { document.querySelector('#vehicle-gear').classList.remove('pulsing'); }

					if (vehicleLights.classList.contains(data.lights) == false) {
						vehicleLights.classList.remove('normal','high','off');
						vehicleLights.classList.add(data.lights);
					}

					if (vehicleSignal.classList.contains(data.signals) == false) {
						vehicleSignal.classList.remove('left','right','both','off');

						if ( (data.signals == 'left') || (data.signals == 'both') ) {
							vehicleSignalLeft.classList.add('dying');
							vehicleSignal.classList.add(data.signals);
						}
						if ( (data.signals == 'right') || (data.signals == 'both') ) {
							vehicleSignalRight.classList.add('dying');
							vehicleSignal.classList.add(data.signals);
						}
						if (data.signals == 'off') {
							vehicleSignalRight.classList.remove('dying');
							vehicleSignalLeft.classList.remove('dying');
							vehicleSignal.classList.add(data.signals);
						}
					}

					vehicleFuel.querySelector('span').style.height = data.fuel+'%';

					if (data.fuel <= 35) {
						if (vehicleFuel.classList.contains('dying') == false) { vehicleFuel.classList.add('dying');	}
					}
					else { vehicleFuel.classList.remove('dying'); }

				}
				else {
					if (vehicleInfo.classList.contains('active')) {
						vehicleSeatbelt.classList.remove('on');
						vehicleCruiser.classList.remove('on');

						vehicleInfo.classList.remove('active');
						vehicleInfo.classList.add('inactive', 'fadeOut');

						eventCallback.sound();
					}

				}
				
			},
			
			toggleUi: function(data) {
				var uiID = document.querySelector('#ui');
				if (data.value == true) {
					uiID.style.display = 'block';
				}
				else {
					uiID.style.display = 'none';
				}
			},

			sound: function(file = null, args = null) {
				var sound = document.querySelector('#sounds');
				var soundFile = file;
				var args = args;

				for (i = 0; i < sound.attributes.length; i++) { 
					if (sound.attributes[i].name != 'id') { sound.removeAttribute(sound.attributes[i].name); }
				}

				if (soundFile == null) { sound.setAttribute('src', ''); }
				else {
					if (args == null) { }
					else {
						for (var key in args) {
							if (key != 'addMultiListener') {
								if (key == 'volume') { sound.volume = args[key]; }
								else { sound.setAttribute(key, args[key]); }
							}
						}
					}

					sound.setAttribute('src', soundFile);
					sound.play();
				}


			},

		};

		document.querySelectorAll('.icon i').addMultiListener('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () { this.parentElement.classList.remove('pulse'); this.parentElement.classList.remove('shooting'); });

		document.querySelectorAll('.info.vehicle').addMultiListener('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
			this.classList.remove('fadeOut', 'fadeIn');
		});

		window.addEventListener('message', function(event) {
			eventCallback[event.data.action](event.data);
		});

}
