
function frameData(page, data) {
    data.url = page.frameUrl;
    data.name = page.frameName;
    data.content = page.frameContent;
    data.childCount = page.framesCount;
    data.childFrames = [];

    var posList = page.evaluate(framePosition);

    for(var i=0; i<data.childCount; i++) {
        var node = {};
        node.position = posList[i];
        data.childFrames.push(node);
        page.switchToFrame(i);
        frameData(page, node);
        page.switchToParentFrame();
    }
}

function framePosition() {
    var nodes = document.getElementsByTagName('iframe');
    var results = [];
    for(var i=0; i<nodes.length; i++) {
        var pos = nodes[i].getBoundingClientRect();
        results.push(pos);
    }
    return results;
}

module.exports.frameData = frameData;

