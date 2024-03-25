import { deployContract } from "../deploy/utils";

// An example of a basic deploy script
// It will deploy a Greeter contract to selected network
// as well as verify it on Block Explorer if possible for the network
async function WithdrawScript() {
    const contractArtifactName = "Groth16VerifierWithdraw";
    const constructorArguments: any = [];
    const Verifier = await deployContract(contractArtifactName, constructorArguments);
    const tx = await Verifier.verifyProof([
        "19224713303733665931382788273108160646596300539992646668521873511513383586113",
        "2319530688931962928453558482516008821275973511278429437081410335627116555351"
    ], [
        [
            "10364630523238851555837635001421868669152564376037310653051552318014510566072",
            "12903000979202828739693294704828684755453868456439095324397890154977990829837"
        ],
        [
            "3225258835160781711859193536376370238506489942210870294807396376837557767151",
            "9762955352558332627949922729168491622788731256004258030818563550724685695312"
        ]
    ], [
        "1588638312050017580916070915466799447186702274510891743683296998972448016212",
        "3243841510430373891260880802647677491476172063481871803109784129935194139733"
    ],
        [
            "4851886162145485325991763319688971303040139513169790781502831499568435965639",
            "20074389511983239015624121087019971366332567762414324368467653184695894399924",
            "3396648593629236825520063602163758031453421066039306543788753679165253960137",
            "3739871418",
            "1926598831310339325785887155768651092237758174508590032357942869616714569853",
            "20927437286287743665032896863945898922334545625620397241384951586977658734189",
            "491439796825325507514476863326941896974172164733",
            "491439796825325507514476863326941896974172164733",
            "3331505041"
        ]);
    console.log(tx)
}
WithdrawScript();