module.exports = async function (context, req) {
  context.log('Obtendo settings from Blob:', context.bindings.myInputBlob);
  context.res = {
    body: context.bindings.myInputBlob,
  };
};
