// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity >=0.7.0 <0.9.0;

contract Groth16VerifierRound2 {
    // Scalar field size
    uint256 constant r = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax = 3501339045540088053713296337110337309298166984665950888542012728758758251037;
    uint256 constant alphay = 21259169602859434646722383059424505905919370778672543446761667209373139349188;
    uint256 constant betax1 = 12920897987729377436599106463325752175693203679296184813592294004905559660137;
    uint256 constant betax2 = 14417884192178472131283859161092938051266233703840951043020015460032042077145;
    uint256 constant betay1 = 8388165202883531525994882150281535041661925039543427610545099207091048102825;
    uint256 constant betay2 = 10734247860000490403181689418601165518488824141740461242272950818030205745600;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 320605845957449363993667238839964228830565397376998091915146048376314969727;
    uint256 constant deltax2 = 11252400230919269455434672732335614966469149354891574241589444878443829107531;
    uint256 constant deltay1 = 7089116676345690076834981941760390920014973615309774877497836446726045664390;
    uint256 constant deltay2 = 18049218441612293231034651208249630188775196322526341809000982701034424283930;

    uint256 constant IC0x = 10534956314333637509248588909045800743685160032585631987897552627828054674611;
    uint256 constant IC0y = 7551713996189576078306061004618553098932920730162287278410933830535795053536;

    uint256 constant IC1x = 13122612069680238535368316956986312450007866454696693407769119515171333947199;
    uint256 constant IC1y = 10864700057517658142002450332732183339563151858920714418682706934183407023396;

    uint256 constant IC2x = 9606736613550007253352122915592327318924986425718162556769339005237649607353;
    uint256 constant IC2y = 14171733566128226109975413789593492186545585079211870767716447249546196269074;

    uint256 constant IC3x = 2570273165752263723012917959333653569955950895559276687137662210573412061195;
    uint256 constant IC3y = 17182167746688344583305803540018122355647568743133044833483150023656370687933;

    uint256 constant IC4x = 20759907297507512394898760420025891000764121798736293094760820063977122635698;
    uint256 constant IC4y = 8536331836872475314403454279879850738209226589755636509869523078253533644274;

    uint256 constant IC5x = 11811134263197422199093147842935030839726205077131478017820268634623461998636;
    uint256 constant IC5y = 4847153065651472292998388422457904606600817538188938661676203742218230940892;

    uint256 constant IC6x = 14085955807085223889971195638784289458517459064282006466530204069662087517188;
    uint256 constant IC6y = 1866022741648515911893421318823589404097006215287934124967618620926385379184;

    uint256 constant IC7x = 5534491179562145243068395571340537185109708410186652490047541262832375845660;
    uint256 constant IC7y = 8286942396045198150716460895256025584118650201952058568536846856819857187122;

    uint256 constant IC8x = 12950459902877572911428552747623324159025136862546245603539467121780557687653;
    uint256 constant IC8y = 2077227205117282438010832842594754223326625775021176962416095451367819901055;

    uint256 constant IC9x = 7044686976414112531941274450056805449863226515164473609123694597128626866479;
    uint256 constant IC9y = 16454808470275315200639110797607567627556417656776972289774229365158182305650;

    uint256 constant IC10x = 8117883401541862114601971600039770846766241276729505452538129213958237927854;
    uint256 constant IC10y = 17255183568106864226498116137757523963351101671882450502116207921298128172679;

    uint256 constant IC11x = 4873409254166548506742758165745995446628281498500960040462110908731612110973;
    uint256 constant IC11y = 7279998422918942265826906397212864480003971227032332379469860538564286272034;

    uint256 constant IC12x = 3371954860062532044061445688797031164726682934883416166585752679351010465390;
    uint256 constant IC12y = 8414831963276713059911604249753004171958526564636502159604095424220694879539;

    uint256 constant IC13x = 13300417047961101975240090453379946800996193866533688239138447738901094883257;
    uint256 constant IC13y = 20542477180901205843455025043312179171533257090063176756831295237549267904288;

    uint256 constant IC14x = 6215147487327281235707227075195237041276993530148602440708782625435778548583;
    uint256 constant IC14y = 7343009382102541247546789322456508295322007024768689869004423784371256311012;

    uint256 constant IC15x = 11225210105542299838729165502404483219668319961979474763991683054851771996260;
    uint256 constant IC15y = 2393889395764017940338757435017313593905933142777067317914068794711042079789;

    uint256 constant IC16x = 13144053818941668893481681088126467275115169880226858853864403516789040178652;
    uint256 constant IC16y = 14861445831320875649603570636979609666213135828003699704197161250593536520505;

    uint256 constant IC17x = 20577346719622688226235583069128184845306199080778177357713451459502673677470;
    uint256 constant IC17y = 13328494846624506176162558795130239677906964425866535316363401235474149762423;

    uint256 constant IC18x = 15740745622709533770201661674658844154213228451094422800734926863272343924591;
    uint256 constant IC18y = 7295378450633271702625497409735720407670939604174960772458679189533021352792;

    uint256 constant IC19x = 11667224373539755636923249674343705877319829125833171590726313035697581292039;
    uint256 constant IC19y = 6163270151199968221549417297724609975055823171732391950930685349302200408891;

    uint256 constant IC20x = 13530771304720898754105586798333749318130688564712828999846289325763136329843;
    uint256 constant IC20y = 19028103088560407369432186053398501765668150942937414260269778283832210264261;

    uint256 constant IC21x = 2681691878853903360206609341212829684120777439656171055098239693903641139399;
    uint256 constant IC21y = 9599997122325642673753323688410289323457507233492218205996773804859328054127;

    uint256 constant IC22x = 1346549618421637104638388997839927655834034175088595035631911903964679868555;
    uint256 constant IC22y = 19787615253404561695174665741442975891191738797046444960629408022155778956495;

    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(
        uint256[2] calldata _pA,
        uint256[2][2] calldata _pB,
        uint256[2] calldata _pC,
        uint256[22] calldata _pubSignals
    ) public view returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, q)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x

                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))

                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))

                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))

                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))

                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))

                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))

                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))

                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))

                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))

                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))

                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))

                g1_mulAccC(_pVk, IC12x, IC12y, calldataload(add(pubSignals, 352)))

                g1_mulAccC(_pVk, IC13x, IC13y, calldataload(add(pubSignals, 384)))

                g1_mulAccC(_pVk, IC14x, IC14y, calldataload(add(pubSignals, 416)))

                g1_mulAccC(_pVk, IC15x, IC15y, calldataload(add(pubSignals, 448)))

                g1_mulAccC(_pVk, IC16x, IC16y, calldataload(add(pubSignals, 480)))

                g1_mulAccC(_pVk, IC17x, IC17y, calldataload(add(pubSignals, 512)))

                g1_mulAccC(_pVk, IC18x, IC18y, calldataload(add(pubSignals, 544)))

                g1_mulAccC(_pVk, IC19x, IC19y, calldataload(add(pubSignals, 576)))

                g1_mulAccC(_pVk, IC20x, IC20y, calldataload(add(pubSignals, 608)))

                g1_mulAccC(_pVk, IC21x, IC21y, calldataload(add(pubSignals, 640)))

                g1_mulAccC(_pVk, IC22x, IC22y, calldataload(add(pubSignals, 672)))

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))

                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)

                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F

            checkField(calldataload(add(_pubSignals, 0)))

            checkField(calldataload(add(_pubSignals, 32)))

            checkField(calldataload(add(_pubSignals, 64)))

            checkField(calldataload(add(_pubSignals, 96)))

            checkField(calldataload(add(_pubSignals, 128)))

            checkField(calldataload(add(_pubSignals, 160)))

            checkField(calldataload(add(_pubSignals, 192)))

            checkField(calldataload(add(_pubSignals, 224)))

            checkField(calldataload(add(_pubSignals, 256)))

            checkField(calldataload(add(_pubSignals, 288)))

            checkField(calldataload(add(_pubSignals, 320)))

            checkField(calldataload(add(_pubSignals, 352)))

            checkField(calldataload(add(_pubSignals, 384)))

            checkField(calldataload(add(_pubSignals, 416)))

            checkField(calldataload(add(_pubSignals, 448)))

            checkField(calldataload(add(_pubSignals, 480)))

            checkField(calldataload(add(_pubSignals, 512)))

            checkField(calldataload(add(_pubSignals, 544)))

            checkField(calldataload(add(_pubSignals, 576)))

            checkField(calldataload(add(_pubSignals, 608)))

            checkField(calldataload(add(_pubSignals, 640)))

            checkField(calldataload(add(_pubSignals, 672)))

            checkField(calldataload(add(_pubSignals, 704)))

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
            return(0, 0x20)
        }
    }
}
