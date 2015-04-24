---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-3.590473, 0.2840945, -0.8332629, 1, 0, 0, 1,
-3.465039, 0.731091, -1.597821, 1, 0.007843138, 0, 1,
-3.053921, -0.652599, -2.178566, 1, 0.01176471, 0, 1,
-2.947214, 0.4120276, -1.156132, 1, 0.01960784, 0, 1,
-2.926479, 0.1169534, -1.440935, 1, 0.02352941, 0, 1,
-2.770305, -0.4178116, -1.539151, 1, 0.03137255, 0, 1,
-2.395516, -0.1461426, 0.7537961, 1, 0.03529412, 0, 1,
-2.391545, -1.479956, -0.3544199, 1, 0.04313726, 0, 1,
-2.239039, -0.8928062, -3.194859, 1, 0.04705882, 0, 1,
-2.215495, 1.068069, -1.100324, 1, 0.05490196, 0, 1,
-2.183118, -1.061091, -2.085745, 1, 0.05882353, 0, 1,
-2.175353, -0.8987604, -2.676981, 1, 0.06666667, 0, 1,
-2.1529, 0.8397228, -2.65735, 1, 0.07058824, 0, 1,
-2.116318, 0.02562628, -0.5822564, 1, 0.07843138, 0, 1,
-2.110744, -0.5068802, -1.248102, 1, 0.08235294, 0, 1,
-2.106121, -1.115278, -1.444196, 1, 0.09019608, 0, 1,
-2.105644, 0.1988353, -1.23252, 1, 0.09411765, 0, 1,
-2.083451, 2.076431, 0.7737942, 1, 0.1019608, 0, 1,
-2.048731, -0.1941669, -1.343486, 1, 0.1098039, 0, 1,
-2.04843, 0.2066478, -2.216315, 1, 0.1137255, 0, 1,
-2.017515, 1.299284, -0.4269739, 1, 0.1215686, 0, 1,
-2.003911, 0.3308581, -1.410112, 1, 0.1254902, 0, 1,
-2.000324, -0.2773726, -2.613792, 1, 0.1333333, 0, 1,
-1.98437, -0.5844216, -2.078129, 1, 0.1372549, 0, 1,
-1.961501, 0.2219381, 0.1833027, 1, 0.145098, 0, 1,
-1.945012, 0.3798651, -0.5793399, 1, 0.1490196, 0, 1,
-1.934731, -0.9672854, -3.105545, 1, 0.1568628, 0, 1,
-1.927734, 1.738618, -1.234924, 1, 0.1607843, 0, 1,
-1.924173, -0.6765888, -1.53702, 1, 0.1686275, 0, 1,
-1.899046, 0.5413673, 0.1505261, 1, 0.172549, 0, 1,
-1.8759, 0.626572, -1.094242, 1, 0.1803922, 0, 1,
-1.867866, -1.514953, -1.934318, 1, 0.1843137, 0, 1,
-1.867395, 0.3424945, -1.482346, 1, 0.1921569, 0, 1,
-1.864315, -1.056267, -1.956103, 1, 0.1960784, 0, 1,
-1.859697, 1.991642, 0.7038478, 1, 0.2039216, 0, 1,
-1.857123, -1.26362, 0.1365938, 1, 0.2117647, 0, 1,
-1.850035, -2.228938, -0.6939292, 1, 0.2156863, 0, 1,
-1.841482, 0.3116345, -0.8572891, 1, 0.2235294, 0, 1,
-1.835833, 0.4300897, -1.517399, 1, 0.227451, 0, 1,
-1.828139, 0.58065, -1.043768, 1, 0.2352941, 0, 1,
-1.826185, 0.3062411, -0.149433, 1, 0.2392157, 0, 1,
-1.800425, -1.221108, -1.779072, 1, 0.2470588, 0, 1,
-1.794387, -0.1564968, -3.742434, 1, 0.2509804, 0, 1,
-1.793553, -0.5825934, -1.380241, 1, 0.2588235, 0, 1,
-1.776625, -0.1319572, -0.495046, 1, 0.2627451, 0, 1,
-1.775912, -0.459671, -1.483228, 1, 0.2705882, 0, 1,
-1.764448, 0.08537348, 0.1527303, 1, 0.2745098, 0, 1,
-1.763307, 0.7211946, -0.111067, 1, 0.282353, 0, 1,
-1.754513, -3.060653, -1.385731, 1, 0.2862745, 0, 1,
-1.736513, -0.108578, 0.5759488, 1, 0.2941177, 0, 1,
-1.732328, 1.470724, -2.370361, 1, 0.3019608, 0, 1,
-1.719649, 0.4012767, -0.9375699, 1, 0.3058824, 0, 1,
-1.710235, 1.322278, -0.4088687, 1, 0.3137255, 0, 1,
-1.690228, 0.6821738, -0.7425018, 1, 0.3176471, 0, 1,
-1.689404, -0.4598896, -2.172991, 1, 0.3254902, 0, 1,
-1.675499, 0.5202363, -1.500566, 1, 0.3294118, 0, 1,
-1.659554, -0.1168207, -2.375618, 1, 0.3372549, 0, 1,
-1.643647, -1.504947, -1.346631, 1, 0.3411765, 0, 1,
-1.63612, 1.921912, -2.005923, 1, 0.3490196, 0, 1,
-1.632368, 1.591659, -2.021381, 1, 0.3529412, 0, 1,
-1.629937, -0.3610536, -0.7696856, 1, 0.3607843, 0, 1,
-1.623344, 1.130523, -1.092082, 1, 0.3647059, 0, 1,
-1.597891, -0.360533, -2.848948, 1, 0.372549, 0, 1,
-1.594639, 0.5600512, -1.743837, 1, 0.3764706, 0, 1,
-1.592926, -0.7633598, -0.6076325, 1, 0.3843137, 0, 1,
-1.590196, -0.2020329, -2.832689, 1, 0.3882353, 0, 1,
-1.586941, -0.4558737, -0.3516826, 1, 0.3960784, 0, 1,
-1.584361, -0.0806142, -0.1707014, 1, 0.4039216, 0, 1,
-1.577421, -0.0698141, -0.852035, 1, 0.4078431, 0, 1,
-1.575176, 0.1518988, -0.5561684, 1, 0.4156863, 0, 1,
-1.573774, 0.3647309, -1.805085, 1, 0.4196078, 0, 1,
-1.559746, -0.989235, -0.7248436, 1, 0.427451, 0, 1,
-1.554416, 0.03539198, -1.592881, 1, 0.4313726, 0, 1,
-1.550008, 0.4245456, -1.174483, 1, 0.4392157, 0, 1,
-1.54618, 0.6090729, 0.535638, 1, 0.4431373, 0, 1,
-1.544849, 1.580462, -0.7055337, 1, 0.4509804, 0, 1,
-1.542198, -0.7187605, -2.4904, 1, 0.454902, 0, 1,
-1.536317, 0.9475534, 0.2120573, 1, 0.4627451, 0, 1,
-1.522175, 2.096389, -1.031402, 1, 0.4666667, 0, 1,
-1.516116, 0.2919709, -2.480864, 1, 0.4745098, 0, 1,
-1.514765, 0.293444, -1.925465, 1, 0.4784314, 0, 1,
-1.511898, -0.387666, -1.866599, 1, 0.4862745, 0, 1,
-1.511657, -0.8069955, -2.858617, 1, 0.4901961, 0, 1,
-1.507315, -0.6533135, -2.999409, 1, 0.4980392, 0, 1,
-1.506865, -1.327212, -3.775507, 1, 0.5058824, 0, 1,
-1.503134, 1.856618, -2.567994, 1, 0.509804, 0, 1,
-1.502287, -0.1053811, -2.074818, 1, 0.5176471, 0, 1,
-1.500157, -0.699356, -2.070634, 1, 0.5215687, 0, 1,
-1.495344, 0.4326245, -1.068739, 1, 0.5294118, 0, 1,
-1.49503, 0.5598496, -2.239643, 1, 0.5333334, 0, 1,
-1.484288, -0.2563497, -1.049572, 1, 0.5411765, 0, 1,
-1.476758, 0.637081, -1.936405, 1, 0.5450981, 0, 1,
-1.474189, -1.33051, -1.489671, 1, 0.5529412, 0, 1,
-1.47344, -1.029547, -1.245201, 1, 0.5568628, 0, 1,
-1.468999, -0.9367573, -1.802737, 1, 0.5647059, 0, 1,
-1.466284, 0.2841364, -0.9708983, 1, 0.5686275, 0, 1,
-1.465223, -0.6099144, -0.9948862, 1, 0.5764706, 0, 1,
-1.46367, 0.5418943, -1.366377, 1, 0.5803922, 0, 1,
-1.457437, -0.4888653, 0.3814197, 1, 0.5882353, 0, 1,
-1.457129, -0.5945028, -1.872259, 1, 0.5921569, 0, 1,
-1.448285, 1.950662, -0.458055, 1, 0.6, 0, 1,
-1.437936, -0.4256738, -2.22342, 1, 0.6078432, 0, 1,
-1.43529, -0.4381799, -2.066915, 1, 0.6117647, 0, 1,
-1.420838, -0.8151573, -2.624226, 1, 0.6196079, 0, 1,
-1.418545, 1.521967, -0.05120877, 1, 0.6235294, 0, 1,
-1.417239, 2.036526, -0.405495, 1, 0.6313726, 0, 1,
-1.409798, 0.4702269, -1.164087, 1, 0.6352941, 0, 1,
-1.401442, 0.9470533, -2.210977, 1, 0.6431373, 0, 1,
-1.401429, -0.8460059, -1.634868, 1, 0.6470588, 0, 1,
-1.392628, -1.584863, -1.779295, 1, 0.654902, 0, 1,
-1.379144, -0.02543026, -2.792735, 1, 0.6588235, 0, 1,
-1.368896, 1.049457, -1.827772, 1, 0.6666667, 0, 1,
-1.359682, -0.6729378, -2.210386, 1, 0.6705883, 0, 1,
-1.354175, 1.457005, -1.262622, 1, 0.6784314, 0, 1,
-1.350336, -1.815688, -2.444461, 1, 0.682353, 0, 1,
-1.334833, -1.146384, -1.499958, 1, 0.6901961, 0, 1,
-1.328496, 1.481136, -2.30548, 1, 0.6941177, 0, 1,
-1.327386, -0.1950656, -0.4532831, 1, 0.7019608, 0, 1,
-1.325915, -1.546408, -1.259257, 1, 0.7098039, 0, 1,
-1.315421, 0.9218782, -0.6847371, 1, 0.7137255, 0, 1,
-1.313026, -0.2506569, -1.057033, 1, 0.7215686, 0, 1,
-1.310559, 0.2591095, -0.4068533, 1, 0.7254902, 0, 1,
-1.306756, -0.0294405, -0.7769102, 1, 0.7333333, 0, 1,
-1.302973, 0.02166039, -1.898698, 1, 0.7372549, 0, 1,
-1.296023, 0.2678719, -1.193302, 1, 0.7450981, 0, 1,
-1.292475, -0.7145381, -1.601276, 1, 0.7490196, 0, 1,
-1.282412, 0.2801658, -0.7916374, 1, 0.7568628, 0, 1,
-1.271298, 0.6759375, -0.5253196, 1, 0.7607843, 0, 1,
-1.258559, 0.9945491, -1.031811, 1, 0.7686275, 0, 1,
-1.256167, -0.6206704, -2.332701, 1, 0.772549, 0, 1,
-1.249187, 0.1403301, -1.237351, 1, 0.7803922, 0, 1,
-1.245997, 1.454996, -2.041823, 1, 0.7843137, 0, 1,
-1.242612, 0.9140539, -2.016659, 1, 0.7921569, 0, 1,
-1.238179, -1.926915, -2.226557, 1, 0.7960784, 0, 1,
-1.216957, -1.42151, -2.667, 1, 0.8039216, 0, 1,
-1.211061, 0.01419403, -2.141939, 1, 0.8117647, 0, 1,
-1.210982, -0.2826452, -1.628681, 1, 0.8156863, 0, 1,
-1.198341, 0.4787329, -0.1801948, 1, 0.8235294, 0, 1,
-1.195692, -0.05062335, -0.9484708, 1, 0.827451, 0, 1,
-1.184951, 0.02882618, -1.323418, 1, 0.8352941, 0, 1,
-1.168549, -0.6388826, -2.611311, 1, 0.8392157, 0, 1,
-1.167897, -0.09739411, -0.6220542, 1, 0.8470588, 0, 1,
-1.164129, -0.3765501, -2.69282, 1, 0.8509804, 0, 1,
-1.151973, -0.4160148, -1.531563, 1, 0.8588235, 0, 1,
-1.1434, -0.3571393, -1.125475, 1, 0.8627451, 0, 1,
-1.142795, 0.7021151, -0.8828121, 1, 0.8705882, 0, 1,
-1.13109, 0.8948134, -0.7782655, 1, 0.8745098, 0, 1,
-1.128662, -0.2687853, -1.215888, 1, 0.8823529, 0, 1,
-1.128394, 0.3936068, -0.7783322, 1, 0.8862745, 0, 1,
-1.128332, -0.7652386, -1.620684, 1, 0.8941177, 0, 1,
-1.120007, 0.4033178, -1.783324, 1, 0.8980392, 0, 1,
-1.116101, 1.43332, 0.3278727, 1, 0.9058824, 0, 1,
-1.11494, -1.964767, -1.342593, 1, 0.9137255, 0, 1,
-1.112573, 0.311541, -0.6620951, 1, 0.9176471, 0, 1,
-1.090377, -1.284994, -4.197562, 1, 0.9254902, 0, 1,
-1.086465, -0.4237458, -3.289324, 1, 0.9294118, 0, 1,
-1.085623, 0.3762774, -1.789777, 1, 0.9372549, 0, 1,
-1.08459, -0.01965296, -1.141984, 1, 0.9411765, 0, 1,
-1.078381, -0.4527002, -2.273728, 1, 0.9490196, 0, 1,
-1.076121, 0.7600076, -0.3331443, 1, 0.9529412, 0, 1,
-1.070995, 0.8045711, -1.474252, 1, 0.9607843, 0, 1,
-1.057769, -0.8079528, -1.00119, 1, 0.9647059, 0, 1,
-1.051525, -1.76794, -3.155683, 1, 0.972549, 0, 1,
-1.05087, 2.171215, -0.8163779, 1, 0.9764706, 0, 1,
-1.049714, 0.03695516, -2.51485, 1, 0.9843137, 0, 1,
-1.044894, 1.167019, 0.2093999, 1, 0.9882353, 0, 1,
-1.04233, -0.2160956, -0.7801763, 1, 0.9960784, 0, 1,
-1.036345, 1.794244, 1.189126, 0.9960784, 1, 0, 1,
-1.036025, 0.1958067, -1.467326, 0.9921569, 1, 0, 1,
-1.033762, 1.808116, 0.5816105, 0.9843137, 1, 0, 1,
-1.031007, -0.8125188, 1.219182, 0.9803922, 1, 0, 1,
-1.020497, -1.900779, -1.91941, 0.972549, 1, 0, 1,
-1.019315, -0.07570479, -2.624785, 0.9686275, 1, 0, 1,
-1.008064, 2.775997, -0.691264, 0.9607843, 1, 0, 1,
-1.003098, 0.4973637, -0.8833104, 0.9568627, 1, 0, 1,
-0.9999497, -0.2084965, -1.344472, 0.9490196, 1, 0, 1,
-0.9930118, -0.5914468, -2.810499, 0.945098, 1, 0, 1,
-0.9889826, 0.259058, -1.158689, 0.9372549, 1, 0, 1,
-0.982617, 0.4607902, -0.669039, 0.9333333, 1, 0, 1,
-0.981895, 0.11917, 0.04174263, 0.9254902, 1, 0, 1,
-0.979969, -1.390971, -1.773979, 0.9215686, 1, 0, 1,
-0.9798142, 0.2306519, -2.6797, 0.9137255, 1, 0, 1,
-0.9796089, 0.9856258, -1.895571, 0.9098039, 1, 0, 1,
-0.9771622, 0.8056235, -0.2975628, 0.9019608, 1, 0, 1,
-0.9533283, -0.8610459, -2.371562, 0.8941177, 1, 0, 1,
-0.9479814, 0.09196421, -1.388878, 0.8901961, 1, 0, 1,
-0.9410964, 1.091132, -1.119429, 0.8823529, 1, 0, 1,
-0.940643, 0.3215418, -0.882625, 0.8784314, 1, 0, 1,
-0.9401049, 0.4411455, -2.062494, 0.8705882, 1, 0, 1,
-0.9377739, -1.740454, -4.543183, 0.8666667, 1, 0, 1,
-0.932641, -0.03690134, 0.1646854, 0.8588235, 1, 0, 1,
-0.9319924, 1.061135, -1.229833, 0.854902, 1, 0, 1,
-0.926703, 0.2815785, -1.569806, 0.8470588, 1, 0, 1,
-0.9232293, 0.202214, -0.4594855, 0.8431373, 1, 0, 1,
-0.9222855, -0.6857324, -2.415903, 0.8352941, 1, 0, 1,
-0.9160396, 0.2508864, -2.056005, 0.8313726, 1, 0, 1,
-0.9044578, 0.5483946, -0.5064169, 0.8235294, 1, 0, 1,
-0.8989694, 1.792739, -0.9399555, 0.8196079, 1, 0, 1,
-0.8970625, 1.897005, -0.1339409, 0.8117647, 1, 0, 1,
-0.8930887, 0.6660038, -1.213756, 0.8078431, 1, 0, 1,
-0.8908735, 0.2543746, -1.034795, 0.8, 1, 0, 1,
-0.8900807, -0.2129475, -1.769953, 0.7921569, 1, 0, 1,
-0.8846125, 0.6152133, 1.011375, 0.7882353, 1, 0, 1,
-0.8801549, -2.351967, -2.617407, 0.7803922, 1, 0, 1,
-0.8794687, -0.9648165, -3.064569, 0.7764706, 1, 0, 1,
-0.8753712, 1.191419, -0.8500154, 0.7686275, 1, 0, 1,
-0.8715141, -0.8322999, -2.185912, 0.7647059, 1, 0, 1,
-0.8692797, -2.278641, -0.8729802, 0.7568628, 1, 0, 1,
-0.8651733, -1.478965, -3.736475, 0.7529412, 1, 0, 1,
-0.8628573, 0.933161, -1.720941, 0.7450981, 1, 0, 1,
-0.8540124, -0.3964044, -1.281532, 0.7411765, 1, 0, 1,
-0.8505014, -0.9402713, -3.447672, 0.7333333, 1, 0, 1,
-0.8484854, -0.1822789, -1.404657, 0.7294118, 1, 0, 1,
-0.847636, 0.8807912, -1.247599, 0.7215686, 1, 0, 1,
-0.8445152, 1.642819, 1.186406, 0.7176471, 1, 0, 1,
-0.8399785, 1.690871, -0.3551157, 0.7098039, 1, 0, 1,
-0.8366958, 0.4399825, -2.044048, 0.7058824, 1, 0, 1,
-0.8334451, 0.7236404, 0.3136175, 0.6980392, 1, 0, 1,
-0.833402, 0.902549, -0.6216934, 0.6901961, 1, 0, 1,
-0.8303353, -0.05373056, -0.6829863, 0.6862745, 1, 0, 1,
-0.8275051, -2.711163, -1.132861, 0.6784314, 1, 0, 1,
-0.8224103, 0.9377934, -1.329267, 0.6745098, 1, 0, 1,
-0.8164526, -0.3714437, -2.529705, 0.6666667, 1, 0, 1,
-0.8113333, 0.6666074, 1.571805, 0.6627451, 1, 0, 1,
-0.8033299, 0.46247, -0.9134246, 0.654902, 1, 0, 1,
-0.8001046, -0.6529207, -1.566018, 0.6509804, 1, 0, 1,
-0.7974811, -0.2438868, -0.7086992, 0.6431373, 1, 0, 1,
-0.7810217, -0.194059, -2.111815, 0.6392157, 1, 0, 1,
-0.7802945, -0.2295777, -3.190078, 0.6313726, 1, 0, 1,
-0.7791251, -1.337757, 0.1904492, 0.627451, 1, 0, 1,
-0.7771363, -1.802923, -3.44264, 0.6196079, 1, 0, 1,
-0.7714155, -0.4201953, -1.86271, 0.6156863, 1, 0, 1,
-0.7675015, 0.5560711, 0.3890564, 0.6078432, 1, 0, 1,
-0.7673044, 0.9094589, 0.6086888, 0.6039216, 1, 0, 1,
-0.7641436, 0.7730701, -0.6917413, 0.5960785, 1, 0, 1,
-0.7640032, -1.049448, -1.125789, 0.5882353, 1, 0, 1,
-0.760102, 1.113268, -1.201371, 0.5843138, 1, 0, 1,
-0.758498, 0.6865653, -0.7243444, 0.5764706, 1, 0, 1,
-0.7545557, 0.1453926, -1.000031, 0.572549, 1, 0, 1,
-0.7407346, 0.2346959, -0.345025, 0.5647059, 1, 0, 1,
-0.7401298, -1.056783, -3.38699, 0.5607843, 1, 0, 1,
-0.736621, 0.2017556, -1.47056, 0.5529412, 1, 0, 1,
-0.7364238, 0.01415745, -3.143079, 0.5490196, 1, 0, 1,
-0.7356908, 0.4726507, -1.380368, 0.5411765, 1, 0, 1,
-0.7223876, 1.395554, -0.8012259, 0.5372549, 1, 0, 1,
-0.7121524, 0.9934182, -0.2915043, 0.5294118, 1, 0, 1,
-0.7065852, 1.696355, 0.6058533, 0.5254902, 1, 0, 1,
-0.7057322, 0.6706077, 0.5889789, 0.5176471, 1, 0, 1,
-0.700454, 0.4265889, -0.06907947, 0.5137255, 1, 0, 1,
-0.7002595, 0.8888532, -2.386528, 0.5058824, 1, 0, 1,
-0.6886264, -0.6384757, -2.554435, 0.5019608, 1, 0, 1,
-0.6860365, -1.118686, -1.368798, 0.4941176, 1, 0, 1,
-0.6795531, -0.05699445, -3.122231, 0.4862745, 1, 0, 1,
-0.6727984, -0.01847488, 0.4154416, 0.4823529, 1, 0, 1,
-0.6669989, -0.5680678, -2.350316, 0.4745098, 1, 0, 1,
-0.6605385, 0.5834433, -0.9965015, 0.4705882, 1, 0, 1,
-0.6551388, -0.9026306, -1.952274, 0.4627451, 1, 0, 1,
-0.6545414, -0.2497358, -1.888699, 0.4588235, 1, 0, 1,
-0.6435018, -0.9925135, -3.565828, 0.4509804, 1, 0, 1,
-0.6414416, 0.9141392, -0.2307776, 0.4470588, 1, 0, 1,
-0.6406435, 1.361816, -0.8233973, 0.4392157, 1, 0, 1,
-0.6368334, 1.122338, -0.4190187, 0.4352941, 1, 0, 1,
-0.6332802, 0.7813542, -2.909411, 0.427451, 1, 0, 1,
-0.6283411, -2.581237, -2.735776, 0.4235294, 1, 0, 1,
-0.6277874, 0.6632217, -0.3133051, 0.4156863, 1, 0, 1,
-0.6266443, -0.1308737, -1.99126, 0.4117647, 1, 0, 1,
-0.6255968, -0.72899, -3.653028, 0.4039216, 1, 0, 1,
-0.6249395, 2.484931, -0.2059011, 0.3960784, 1, 0, 1,
-0.6212522, 0.09807456, -3.223964, 0.3921569, 1, 0, 1,
-0.6206408, -1.219082, -2.370965, 0.3843137, 1, 0, 1,
-0.6191188, 1.261136, -1.714254, 0.3803922, 1, 0, 1,
-0.6163028, 0.9043029, -0.8298033, 0.372549, 1, 0, 1,
-0.6142913, -1.056817, -1.854777, 0.3686275, 1, 0, 1,
-0.6071973, -0.07551366, -1.819929, 0.3607843, 1, 0, 1,
-0.6069541, 0.1078931, -1.34752, 0.3568628, 1, 0, 1,
-0.6049498, 0.6744586, -1.06909, 0.3490196, 1, 0, 1,
-0.6047978, 0.7592229, -2.04989, 0.345098, 1, 0, 1,
-0.6045235, -0.2412233, -3.522839, 0.3372549, 1, 0, 1,
-0.6009026, -2.270141, -1.963849, 0.3333333, 1, 0, 1,
-0.5989941, 1.135812, 0.1968042, 0.3254902, 1, 0, 1,
-0.5974115, -1.718789, -0.8543761, 0.3215686, 1, 0, 1,
-0.5946425, -2.515173, -1.992242, 0.3137255, 1, 0, 1,
-0.5932082, -2.226644, -2.224911, 0.3098039, 1, 0, 1,
-0.5908715, -1.940166, -1.792383, 0.3019608, 1, 0, 1,
-0.5864006, 0.07895708, -2.032919, 0.2941177, 1, 0, 1,
-0.5839875, -0.8942016, -0.9441372, 0.2901961, 1, 0, 1,
-0.5753843, -0.5178823, -1.692171, 0.282353, 1, 0, 1,
-0.5649527, 0.5204495, -0.6079137, 0.2784314, 1, 0, 1,
-0.5606593, 1.075596, -2.757017, 0.2705882, 1, 0, 1,
-0.5599338, -0.9146934, -4.18889, 0.2666667, 1, 0, 1,
-0.5599132, -0.4437297, -2.303108, 0.2588235, 1, 0, 1,
-0.5568913, 2.349146, -0.9447151, 0.254902, 1, 0, 1,
-0.5555255, 1.012679, -0.4425212, 0.2470588, 1, 0, 1,
-0.5536678, 0.3704273, -1.056494, 0.2431373, 1, 0, 1,
-0.5517005, -1.681754, -3.71694, 0.2352941, 1, 0, 1,
-0.5493998, 1.016575, -1.140417, 0.2313726, 1, 0, 1,
-0.5481545, -0.8323519, -4.422671, 0.2235294, 1, 0, 1,
-0.5460705, -0.2690984, -1.698683, 0.2196078, 1, 0, 1,
-0.5407063, -0.4887829, -2.11297, 0.2117647, 1, 0, 1,
-0.5372887, -0.3393506, -2.733972, 0.2078431, 1, 0, 1,
-0.5361603, 0.6930841, -0.7975275, 0.2, 1, 0, 1,
-0.5269433, 0.5576496, -0.4142186, 0.1921569, 1, 0, 1,
-0.5259295, 1.386608, -2.527102, 0.1882353, 1, 0, 1,
-0.5227945, -1.244845, -1.990931, 0.1803922, 1, 0, 1,
-0.5224122, 0.458402, 0.2188682, 0.1764706, 1, 0, 1,
-0.5184832, 0.6403372, 0.9294409, 0.1686275, 1, 0, 1,
-0.5157124, -0.9412036, -3.309748, 0.1647059, 1, 0, 1,
-0.5093014, -0.7473578, -3.688418, 0.1568628, 1, 0, 1,
-0.5091447, -1.185123, -2.709736, 0.1529412, 1, 0, 1,
-0.5044587, -0.3432811, -2.146511, 0.145098, 1, 0, 1,
-0.5013562, -1.74766, -4.628313, 0.1411765, 1, 0, 1,
-0.5012429, 1.745609, -0.9787285, 0.1333333, 1, 0, 1,
-0.5010466, 0.3048811, -0.3082126, 0.1294118, 1, 0, 1,
-0.4961812, 0.715147, 0.1138923, 0.1215686, 1, 0, 1,
-0.495297, -0.03697496, -2.381831, 0.1176471, 1, 0, 1,
-0.4927311, 0.1299142, -1.075471, 0.1098039, 1, 0, 1,
-0.4916914, -1.340715, -1.736388, 0.1058824, 1, 0, 1,
-0.4887628, 0.2461648, -2.487461, 0.09803922, 1, 0, 1,
-0.48646, 0.261841, -2.017746, 0.09019608, 1, 0, 1,
-0.4732015, 0.3876984, -0.6549515, 0.08627451, 1, 0, 1,
-0.4710777, -1.138489, -3.315313, 0.07843138, 1, 0, 1,
-0.4696737, -0.02149313, -2.996408, 0.07450981, 1, 0, 1,
-0.4664489, 1.140369, 1.039581, 0.06666667, 1, 0, 1,
-0.4642932, -1.639547, -3.128298, 0.0627451, 1, 0, 1,
-0.4590651, 1.026037, -0.7986962, 0.05490196, 1, 0, 1,
-0.4580515, -0.0942342, -3.186106, 0.05098039, 1, 0, 1,
-0.4520902, 1.617657, 1.182786, 0.04313726, 1, 0, 1,
-0.4514444, -0.1885232, -1.10419, 0.03921569, 1, 0, 1,
-0.4481069, -1.068578, -2.16823, 0.03137255, 1, 0, 1,
-0.4473435, 1.372303, 0.985088, 0.02745098, 1, 0, 1,
-0.4471564, -0.467646, -0.4027987, 0.01960784, 1, 0, 1,
-0.4423396, -0.6910135, -4.186619, 0.01568628, 1, 0, 1,
-0.4423374, -0.5786871, -2.974846, 0.007843138, 1, 0, 1,
-0.4413202, 0.2999685, -1.753233, 0.003921569, 1, 0, 1,
-0.4370729, 0.811665, 0.3548842, 0, 1, 0.003921569, 1,
-0.4351245, 0.4204588, -1.855498, 0, 1, 0.01176471, 1,
-0.435087, 2.005682, 0.3922995, 0, 1, 0.01568628, 1,
-0.4295784, 0.3560121, -0.2922436, 0, 1, 0.02352941, 1,
-0.4286847, 0.6340024, -1.002694, 0, 1, 0.02745098, 1,
-0.4275149, -1.023957, -2.352388, 0, 1, 0.03529412, 1,
-0.4258566, -1.358505, -1.923852, 0, 1, 0.03921569, 1,
-0.4242494, -0.7267278, -2.144903, 0, 1, 0.04705882, 1,
-0.4187215, 2.190927, 0.2810057, 0, 1, 0.05098039, 1,
-0.4184369, 0.2707899, -1.479595, 0, 1, 0.05882353, 1,
-0.4174204, -1.572119, -4.661952, 0, 1, 0.0627451, 1,
-0.4145, -1.037719, -2.119651, 0, 1, 0.07058824, 1,
-0.4098493, 0.7464684, -0.6580221, 0, 1, 0.07450981, 1,
-0.4070424, 0.620969, -2.508435, 0, 1, 0.08235294, 1,
-0.4032175, 0.07748163, -0.900584, 0, 1, 0.08627451, 1,
-0.401158, -0.8540488, -3.250471, 0, 1, 0.09411765, 1,
-0.3986989, -0.3819294, -3.138756, 0, 1, 0.1019608, 1,
-0.398207, -0.4650102, -1.779073, 0, 1, 0.1058824, 1,
-0.3975002, 0.7783523, -0.9987561, 0, 1, 0.1137255, 1,
-0.3972377, -0.5465656, -1.712162, 0, 1, 0.1176471, 1,
-0.3894452, -1.041453, -2.287706, 0, 1, 0.1254902, 1,
-0.3817806, -0.5130376, -1.718329, 0, 1, 0.1294118, 1,
-0.36837, 1.86638, -0.4013177, 0, 1, 0.1372549, 1,
-0.3647322, -0.8105012, -1.930032, 0, 1, 0.1411765, 1,
-0.3644946, -0.8971021, -2.487158, 0, 1, 0.1490196, 1,
-0.3625839, -0.1428772, -1.556588, 0, 1, 0.1529412, 1,
-0.3606517, 0.3996974, 0.1145286, 0, 1, 0.1607843, 1,
-0.3577721, 0.4547943, -0.8963945, 0, 1, 0.1647059, 1,
-0.3541487, 1.655077, -1.38032, 0, 1, 0.172549, 1,
-0.3539639, 0.02186095, -2.292483, 0, 1, 0.1764706, 1,
-0.3497894, 1.4064, -0.1983178, 0, 1, 0.1843137, 1,
-0.3497767, -0.1261958, 0.2537067, 0, 1, 0.1882353, 1,
-0.3488642, 2.323385, -0.6604148, 0, 1, 0.1960784, 1,
-0.3476541, -0.5743544, -2.738086, 0, 1, 0.2039216, 1,
-0.3469553, 0.0982741, -2.941926, 0, 1, 0.2078431, 1,
-0.342723, -1.101177, -1.997772, 0, 1, 0.2156863, 1,
-0.3424481, -2.353622, -2.537492, 0, 1, 0.2196078, 1,
-0.3394437, -0.9784452, -1.577942, 0, 1, 0.227451, 1,
-0.3374691, 1.805618, -0.7747837, 0, 1, 0.2313726, 1,
-0.3287028, -0.2707535, -3.162233, 0, 1, 0.2392157, 1,
-0.3233797, -1.843249, -3.223175, 0, 1, 0.2431373, 1,
-0.310727, 1.904618, 0.4688959, 0, 1, 0.2509804, 1,
-0.3089107, 0.8664551, 0.4260988, 0, 1, 0.254902, 1,
-0.3042769, -0.4013191, -3.014521, 0, 1, 0.2627451, 1,
-0.3038179, 1.260405, -1.885751, 0, 1, 0.2666667, 1,
-0.2991573, 0.5549566, -0.3370977, 0, 1, 0.2745098, 1,
-0.2988574, 0.4674333, -2.232091, 0, 1, 0.2784314, 1,
-0.2985906, -0.7574355, -1.495267, 0, 1, 0.2862745, 1,
-0.2985173, -0.835395, -2.626243, 0, 1, 0.2901961, 1,
-0.297636, 0.1191398, -0.3774301, 0, 1, 0.2980392, 1,
-0.292946, 0.6013556, -0.06932858, 0, 1, 0.3058824, 1,
-0.2920807, 0.8027164, 0.31699, 0, 1, 0.3098039, 1,
-0.2850212, -0.9016596, -1.705373, 0, 1, 0.3176471, 1,
-0.2821215, -0.1194486, -1.423367, 0, 1, 0.3215686, 1,
-0.278774, 2.9021, 0.8077503, 0, 1, 0.3294118, 1,
-0.2647693, -1.436607, -3.324201, 0, 1, 0.3333333, 1,
-0.2591295, 0.7977915, -1.017225, 0, 1, 0.3411765, 1,
-0.2583231, 0.2079794, -0.3986574, 0, 1, 0.345098, 1,
-0.2526466, 0.104732, -1.47543, 0, 1, 0.3529412, 1,
-0.2521575, 0.1291044, -0.2761657, 0, 1, 0.3568628, 1,
-0.2514384, -0.6528018, -1.992114, 0, 1, 0.3647059, 1,
-0.2493757, 0.2444339, -0.2861957, 0, 1, 0.3686275, 1,
-0.2468175, -0.2630645, -4.833613, 0, 1, 0.3764706, 1,
-0.2461957, -0.7407438, -3.014552, 0, 1, 0.3803922, 1,
-0.2457941, 0.6569896, -0.250711, 0, 1, 0.3882353, 1,
-0.2432301, 0.6948206, 0.1739665, 0, 1, 0.3921569, 1,
-0.2347298, -0.5358938, -3.175585, 0, 1, 0.4, 1,
-0.2339315, 2.849763, -1.17895, 0, 1, 0.4078431, 1,
-0.2305261, -0.7403197, -2.312362, 0, 1, 0.4117647, 1,
-0.2287104, 0.2074566, -0.369109, 0, 1, 0.4196078, 1,
-0.224363, 0.005671511, -1.252609, 0, 1, 0.4235294, 1,
-0.2233075, -0.2160436, -2.509442, 0, 1, 0.4313726, 1,
-0.2123333, -0.7643065, -2.963312, 0, 1, 0.4352941, 1,
-0.2115729, 1.731068, 0.8086756, 0, 1, 0.4431373, 1,
-0.2093299, -1.426746, -2.090799, 0, 1, 0.4470588, 1,
-0.2059236, -0.5620597, -2.851627, 0, 1, 0.454902, 1,
-0.1984929, 1.297514, -0.6296099, 0, 1, 0.4588235, 1,
-0.1961684, 1.212818, -1.094935, 0, 1, 0.4666667, 1,
-0.1947632, 1.552435, -0.5902508, 0, 1, 0.4705882, 1,
-0.1877451, -2.198236, -3.785723, 0, 1, 0.4784314, 1,
-0.1833065, -2.152485, -4.93867, 0, 1, 0.4823529, 1,
-0.1823499, -0.7019504, -2.915852, 0, 1, 0.4901961, 1,
-0.1821915, 0.9956312, -0.7759162, 0, 1, 0.4941176, 1,
-0.1812618, 0.7714878, 0.7994632, 0, 1, 0.5019608, 1,
-0.1803318, -1.458547, -2.760237, 0, 1, 0.509804, 1,
-0.1752959, -0.3929259, -1.75608, 0, 1, 0.5137255, 1,
-0.1713814, -0.6671683, -3.215869, 0, 1, 0.5215687, 1,
-0.1685407, 1.009519, -1.090465, 0, 1, 0.5254902, 1,
-0.1654124, 1.341446, -0.3319394, 0, 1, 0.5333334, 1,
-0.1604248, -0.3376166, -4.072638, 0, 1, 0.5372549, 1,
-0.1544413, -0.2616756, -1.296529, 0, 1, 0.5450981, 1,
-0.1482398, 0.8375731, -1.171194, 0, 1, 0.5490196, 1,
-0.1446011, 0.3929667, 0.7295319, 0, 1, 0.5568628, 1,
-0.1438014, -1.105989, -1.178341, 0, 1, 0.5607843, 1,
-0.1428195, -0.7116238, -4.080315, 0, 1, 0.5686275, 1,
-0.1422159, 0.2536855, 1.176976, 0, 1, 0.572549, 1,
-0.1388744, -0.04434818, -2.095814, 0, 1, 0.5803922, 1,
-0.1371265, -0.6543269, -4.476161, 0, 1, 0.5843138, 1,
-0.1347286, -0.512419, -3.592276, 0, 1, 0.5921569, 1,
-0.1318298, 1.421881, -0.4494443, 0, 1, 0.5960785, 1,
-0.1313134, -1.091112, -3.570765, 0, 1, 0.6039216, 1,
-0.1296438, -0.1752536, -1.158649, 0, 1, 0.6117647, 1,
-0.1234199, -0.4216901, -4.525857, 0, 1, 0.6156863, 1,
-0.1184765, 0.8700262, -1.390993, 0, 1, 0.6235294, 1,
-0.1159209, 0.5477082, -1.477718, 0, 1, 0.627451, 1,
-0.1140402, 0.08284555, -1.524421, 0, 1, 0.6352941, 1,
-0.1117, 0.663644, -0.9781814, 0, 1, 0.6392157, 1,
-0.1114494, -0.4745317, -2.971694, 0, 1, 0.6470588, 1,
-0.1038275, -1.259707, -2.603327, 0, 1, 0.6509804, 1,
-0.09668907, -0.1178604, -1.160823, 0, 1, 0.6588235, 1,
-0.09528031, 1.975106, -1.223641, 0, 1, 0.6627451, 1,
-0.08734038, -0.4834673, -3.146109, 0, 1, 0.6705883, 1,
-0.08275997, -1.321045, -3.959626, 0, 1, 0.6745098, 1,
-0.08032145, -0.2679539, -3.699558, 0, 1, 0.682353, 1,
-0.07663734, 0.9495209, 0.5761793, 0, 1, 0.6862745, 1,
-0.07088416, -0.5498178, -4.215271, 0, 1, 0.6941177, 1,
-0.0696339, 0.5186638, 0.9135759, 0, 1, 0.7019608, 1,
-0.05926789, 0.1903472, -0.6374314, 0, 1, 0.7058824, 1,
-0.0546449, -0.9669901, -2.700903, 0, 1, 0.7137255, 1,
-0.0532507, -0.6545417, -3.033236, 0, 1, 0.7176471, 1,
-0.0527285, 0.03785489, -0.7571526, 0, 1, 0.7254902, 1,
-0.05033622, 0.5772103, -0.7561814, 0, 1, 0.7294118, 1,
-0.04907452, -0.07354149, -3.401807, 0, 1, 0.7372549, 1,
-0.04529722, 0.134043, 0.6702364, 0, 1, 0.7411765, 1,
-0.04529489, 0.114457, -0.5607641, 0, 1, 0.7490196, 1,
-0.04387038, -0.7434089, -2.466964, 0, 1, 0.7529412, 1,
-0.04108923, 0.9620631, -0.4004565, 0, 1, 0.7607843, 1,
-0.03399624, -0.4305926, -4.992918, 0, 1, 0.7647059, 1,
-0.03100319, 0.2657403, -0.6610504, 0, 1, 0.772549, 1,
-0.0266197, 1.12617, 0.9973637, 0, 1, 0.7764706, 1,
-0.02546277, -0.8334594, -3.228885, 0, 1, 0.7843137, 1,
-0.02515988, 1.567115, -2.141565, 0, 1, 0.7882353, 1,
-0.02490675, -0.9570692, -3.789241, 0, 1, 0.7960784, 1,
-0.02282227, -0.2998772, -4.720585, 0, 1, 0.8039216, 1,
-0.02211556, 0.900859, -1.141078, 0, 1, 0.8078431, 1,
-0.02181861, 0.909561, 0.5786038, 0, 1, 0.8156863, 1,
-0.02131878, -0.6024054, -5.087645, 0, 1, 0.8196079, 1,
-0.01280095, 1.426006, -0.5613385, 0, 1, 0.827451, 1,
-0.01248502, -0.1443748, -2.252535, 0, 1, 0.8313726, 1,
-0.01057474, 0.06285247, 0.7333286, 0, 1, 0.8392157, 1,
-0.002831898, 1.040964, -0.1105193, 0, 1, 0.8431373, 1,
0.0004005731, 0.1845959, -0.3743952, 0, 1, 0.8509804, 1,
0.004301996, -1.639254, 2.429326, 0, 1, 0.854902, 1,
0.008245359, 0.8899088, -0.1170364, 0, 1, 0.8627451, 1,
0.01062447, 0.3912717, 1.108075, 0, 1, 0.8666667, 1,
0.0129312, -1.082521, 2.906081, 0, 1, 0.8745098, 1,
0.01464477, 0.1879016, 1.993283, 0, 1, 0.8784314, 1,
0.01744387, -1.072986, 2.664882, 0, 1, 0.8862745, 1,
0.02022332, -0.8999535, 2.69818, 0, 1, 0.8901961, 1,
0.02461573, -1.532904, 3.379348, 0, 1, 0.8980392, 1,
0.02515102, -1.157418, 2.610673, 0, 1, 0.9058824, 1,
0.02582729, -0.00270355, 2.29145, 0, 1, 0.9098039, 1,
0.02637179, -0.7544255, 3.684502, 0, 1, 0.9176471, 1,
0.02850321, 0.7425517, -0.6923486, 0, 1, 0.9215686, 1,
0.03123575, -1.055368, 3.102511, 0, 1, 0.9294118, 1,
0.03544542, -0.5887555, 4.946983, 0, 1, 0.9333333, 1,
0.03581436, 0.8259511, -0.1395803, 0, 1, 0.9411765, 1,
0.03684953, -2.109087, 2.026423, 0, 1, 0.945098, 1,
0.03787482, -0.6381755, 2.538056, 0, 1, 0.9529412, 1,
0.0393064, 0.5430322, -1.13596, 0, 1, 0.9568627, 1,
0.03988682, -2.790536, 3.696019, 0, 1, 0.9647059, 1,
0.04295238, -0.3588608, 0.9241256, 0, 1, 0.9686275, 1,
0.04541857, 0.5640115, -1.103221, 0, 1, 0.9764706, 1,
0.04722516, -1.389286, 2.424245, 0, 1, 0.9803922, 1,
0.05269981, 0.4452564, -0.3279471, 0, 1, 0.9882353, 1,
0.05510804, -0.1921238, 4.19361, 0, 1, 0.9921569, 1,
0.05617817, 1.231501, 0.7022582, 0, 1, 1, 1,
0.05702884, 1.756337, -0.3540315, 0, 0.9921569, 1, 1,
0.05867664, 1.33679, -0.519581, 0, 0.9882353, 1, 1,
0.06363277, 0.5955005, -1.153367, 0, 0.9803922, 1, 1,
0.06389689, 1.326796, -1.00743, 0, 0.9764706, 1, 1,
0.06702074, 0.272733, 0.4934219, 0, 0.9686275, 1, 1,
0.0701684, -0.9358073, 2.711376, 0, 0.9647059, 1, 1,
0.07160413, -0.3729526, 3.64047, 0, 0.9568627, 1, 1,
0.07217028, -0.5448641, 3.50019, 0, 0.9529412, 1, 1,
0.07412936, -0.2631316, 1.610286, 0, 0.945098, 1, 1,
0.0746004, 0.2200279, 0.1174777, 0, 0.9411765, 1, 1,
0.07729594, -0.6726722, 3.010571, 0, 0.9333333, 1, 1,
0.07828846, -0.3105686, 1.532137, 0, 0.9294118, 1, 1,
0.08117238, 0.00547835, 1.529948, 0, 0.9215686, 1, 1,
0.08222933, 0.2530378, -0.1371641, 0, 0.9176471, 1, 1,
0.08317868, 0.4103536, 1.694608, 0, 0.9098039, 1, 1,
0.083299, 2.174142, -0.4737356, 0, 0.9058824, 1, 1,
0.0846822, -0.8228827, 4.432571, 0, 0.8980392, 1, 1,
0.08602674, 0.5104682, 0.1106764, 0, 0.8901961, 1, 1,
0.08645909, -0.3686314, 2.577041, 0, 0.8862745, 1, 1,
0.09441275, 0.2768298, -0.1307896, 0, 0.8784314, 1, 1,
0.09968271, -1.743503, 4.984309, 0, 0.8745098, 1, 1,
0.1017913, 1.172416, 0.9470409, 0, 0.8666667, 1, 1,
0.1025761, 1.023878, -0.04249446, 0, 0.8627451, 1, 1,
0.1036881, 0.7483864, 1.157914, 0, 0.854902, 1, 1,
0.1054972, -0.3241985, 3.499839, 0, 0.8509804, 1, 1,
0.108287, -2.325819, 3.743541, 0, 0.8431373, 1, 1,
0.1092775, 0.612541, -1.104005, 0, 0.8392157, 1, 1,
0.1099287, 0.483897, 1.918872, 0, 0.8313726, 1, 1,
0.1104365, 0.2887085, 1.33158, 0, 0.827451, 1, 1,
0.1155941, 0.6779855, -0.442334, 0, 0.8196079, 1, 1,
0.1184865, -1.438984, 2.566736, 0, 0.8156863, 1, 1,
0.1259976, -0.4872026, 2.347903, 0, 0.8078431, 1, 1,
0.1286307, 1.390171, 1.289255, 0, 0.8039216, 1, 1,
0.1294741, -1.514551, 2.62033, 0, 0.7960784, 1, 1,
0.1341181, 0.4436976, -0.8521982, 0, 0.7882353, 1, 1,
0.1375654, 0.9920877, -0.2522484, 0, 0.7843137, 1, 1,
0.1386888, -0.7628199, 0.8927239, 0, 0.7764706, 1, 1,
0.1388585, 0.5643092, 0.2111599, 0, 0.772549, 1, 1,
0.1421717, 0.672988, 2.206928, 0, 0.7647059, 1, 1,
0.1438065, -0.8865502, 3.374145, 0, 0.7607843, 1, 1,
0.144178, -0.8144844, 1.943897, 0, 0.7529412, 1, 1,
0.1452557, -1.268729, 3.00818, 0, 0.7490196, 1, 1,
0.147113, -0.5078101, 2.526355, 0, 0.7411765, 1, 1,
0.1477468, 1.000113, -0.5786043, 0, 0.7372549, 1, 1,
0.1531414, 1.124932, 2.767172, 0, 0.7294118, 1, 1,
0.1543913, 1.495739, -0.2251749, 0, 0.7254902, 1, 1,
0.1574299, -0.9927945, 1.858351, 0, 0.7176471, 1, 1,
0.1616606, 1.161994, 0.3050878, 0, 0.7137255, 1, 1,
0.1623122, 0.9629338, 1.222597, 0, 0.7058824, 1, 1,
0.164386, -2.010087, 4.251156, 0, 0.6980392, 1, 1,
0.1649929, 0.2999188, 1.027033, 0, 0.6941177, 1, 1,
0.171129, 1.125371, 0.8474599, 0, 0.6862745, 1, 1,
0.1736401, -1.05805, 4.390012, 0, 0.682353, 1, 1,
0.1741658, 1.171547, 1.966502, 0, 0.6745098, 1, 1,
0.1773498, 1.485405, -0.7876155, 0, 0.6705883, 1, 1,
0.1815713, -2.600382, 5.282944, 0, 0.6627451, 1, 1,
0.1840242, 1.814156, 0.2024012, 0, 0.6588235, 1, 1,
0.1849347, 0.7411446, -0.4292167, 0, 0.6509804, 1, 1,
0.1867644, 0.0708712, 1.695877, 0, 0.6470588, 1, 1,
0.1867965, -0.1804559, 3.621015, 0, 0.6392157, 1, 1,
0.1993878, -0.7935581, 1.762282, 0, 0.6352941, 1, 1,
0.1995654, -1.994071, 2.811593, 0, 0.627451, 1, 1,
0.2005663, -0.3145859, 1.967469, 0, 0.6235294, 1, 1,
0.2012283, 1.430856, -0.4877949, 0, 0.6156863, 1, 1,
0.2025163, 0.07164436, -0.7870386, 0, 0.6117647, 1, 1,
0.2025738, 1.435293, -1.438127, 0, 0.6039216, 1, 1,
0.2050643, -0.9616873, 3.350988, 0, 0.5960785, 1, 1,
0.2058091, 0.7943574, 0.6568146, 0, 0.5921569, 1, 1,
0.2107407, 0.1241594, 0.8775647, 0, 0.5843138, 1, 1,
0.2180881, -1.886299, 3.384088, 0, 0.5803922, 1, 1,
0.2193047, -1.704805, 3.816316, 0, 0.572549, 1, 1,
0.2236575, 1.17912, 0.3506284, 0, 0.5686275, 1, 1,
0.2287855, 0.9521785, 0.2868803, 0, 0.5607843, 1, 1,
0.2316388, -0.2229556, 1.385662, 0, 0.5568628, 1, 1,
0.2322249, -1.291544, 2.454339, 0, 0.5490196, 1, 1,
0.233325, 1.307842, 0.3005976, 0, 0.5450981, 1, 1,
0.2364144, 0.635303, 1.295699, 0, 0.5372549, 1, 1,
0.2369858, 0.520973, 0.05550113, 0, 0.5333334, 1, 1,
0.2375989, -2.464959, 4.747038, 0, 0.5254902, 1, 1,
0.241133, -1.495326, 3.721508, 0, 0.5215687, 1, 1,
0.242187, -0.6918906, 2.032342, 0, 0.5137255, 1, 1,
0.242543, -0.8187076, 1.011371, 0, 0.509804, 1, 1,
0.244602, -0.2988983, 1.12192, 0, 0.5019608, 1, 1,
0.2447323, 1.020918, 0.5287924, 0, 0.4941176, 1, 1,
0.2507004, 0.7818935, -1.9034, 0, 0.4901961, 1, 1,
0.2596786, -1.763037, 1.965985, 0, 0.4823529, 1, 1,
0.2602817, 0.8187387, 0.1976164, 0, 0.4784314, 1, 1,
0.2658556, 0.07897197, 1.079108, 0, 0.4705882, 1, 1,
0.2706478, 0.9324797, -0.6907337, 0, 0.4666667, 1, 1,
0.2715239, 2.341172, -1.694462, 0, 0.4588235, 1, 1,
0.2727371, -1.456525, 1.344743, 0, 0.454902, 1, 1,
0.2768678, 1.502983, 0.008791004, 0, 0.4470588, 1, 1,
0.2802905, 0.3717508, 0.8059594, 0, 0.4431373, 1, 1,
0.2870877, -0.02039892, -0.3295359, 0, 0.4352941, 1, 1,
0.2915858, 0.7599044, -0.8072664, 0, 0.4313726, 1, 1,
0.2944291, 0.6313218, 1.049335, 0, 0.4235294, 1, 1,
0.2951971, 0.4849838, -0.2503705, 0, 0.4196078, 1, 1,
0.2963207, 2.570343, 0.09335602, 0, 0.4117647, 1, 1,
0.29811, -2.427272, 1.780722, 0, 0.4078431, 1, 1,
0.3000034, -2.314706, 3.279726, 0, 0.4, 1, 1,
0.3042484, 0.01964812, 0.9141153, 0, 0.3921569, 1, 1,
0.3059381, 1.169853, 0.1690795, 0, 0.3882353, 1, 1,
0.3083629, -0.2125357, 1.656955, 0, 0.3803922, 1, 1,
0.3100068, -0.6332241, 1.350182, 0, 0.3764706, 1, 1,
0.3122038, 2.234011, 1.452577, 0, 0.3686275, 1, 1,
0.3131174, 0.838097, -0.6803243, 0, 0.3647059, 1, 1,
0.320006, 0.896282, 0.7774324, 0, 0.3568628, 1, 1,
0.3292317, -0.6379323, 3.124333, 0, 0.3529412, 1, 1,
0.3306309, 0.4274168, 0.2386809, 0, 0.345098, 1, 1,
0.3315622, -0.3831857, 2.031862, 0, 0.3411765, 1, 1,
0.3334387, 1.664985, -0.8294227, 0, 0.3333333, 1, 1,
0.3384458, 0.2445221, 0.9564238, 0, 0.3294118, 1, 1,
0.3408481, -1.446192, 3.014662, 0, 0.3215686, 1, 1,
0.3428297, -0.8532504, 3.253936, 0, 0.3176471, 1, 1,
0.3453626, -0.7885343, 3.6047, 0, 0.3098039, 1, 1,
0.3457949, -2.165087, 1.09845, 0, 0.3058824, 1, 1,
0.3492612, -1.168595, 2.541569, 0, 0.2980392, 1, 1,
0.3601114, -1.474805, 3.297633, 0, 0.2901961, 1, 1,
0.3607371, 1.154126, 0.8127471, 0, 0.2862745, 1, 1,
0.3610865, 0.9081638, 0.01025929, 0, 0.2784314, 1, 1,
0.3616113, 1.064325, -1.018856, 0, 0.2745098, 1, 1,
0.3630248, 0.8383862, 0.1861413, 0, 0.2666667, 1, 1,
0.3643726, 0.02675755, 1.270991, 0, 0.2627451, 1, 1,
0.3680665, 1.309923, 0.5786248, 0, 0.254902, 1, 1,
0.3684859, 0.3093838, 0.2157508, 0, 0.2509804, 1, 1,
0.368544, -1.046041, 2.942122, 0, 0.2431373, 1, 1,
0.3722698, -0.6443142, 4.036892, 0, 0.2392157, 1, 1,
0.3805853, -1.11772, 2.921962, 0, 0.2313726, 1, 1,
0.381661, -1.54007, 3.575047, 0, 0.227451, 1, 1,
0.383535, 0.5298065, 0.5733012, 0, 0.2196078, 1, 1,
0.3855529, -0.1300755, 1.62403, 0, 0.2156863, 1, 1,
0.3869855, 0.782829, 1.127065, 0, 0.2078431, 1, 1,
0.3878936, 1.596691, -0.1911561, 0, 0.2039216, 1, 1,
0.3896534, 0.5031484, 0.8418052, 0, 0.1960784, 1, 1,
0.3907357, 0.06739634, 1.499752, 0, 0.1882353, 1, 1,
0.3915735, 1.265284, 0.8787661, 0, 0.1843137, 1, 1,
0.3946364, -0.5275619, 1.058272, 0, 0.1764706, 1, 1,
0.4029058, 1.392875, 0.3233257, 0, 0.172549, 1, 1,
0.4059827, 1.164604, 2.850522, 0, 0.1647059, 1, 1,
0.4129005, 0.8561258, 1.393479, 0, 0.1607843, 1, 1,
0.4195083, -1.07175, 3.555137, 0, 0.1529412, 1, 1,
0.4235313, -0.4464854, 1.355381, 0, 0.1490196, 1, 1,
0.4258602, 0.5437852, -1.176198, 0, 0.1411765, 1, 1,
0.4320766, 0.4018839, 1.065278, 0, 0.1372549, 1, 1,
0.4344217, 0.2461081, 1.231015, 0, 0.1294118, 1, 1,
0.4345021, -1.665345, 2.68395, 0, 0.1254902, 1, 1,
0.4362127, 0.5355791, 0.05830032, 0, 0.1176471, 1, 1,
0.43829, 1.245793, 0.258056, 0, 0.1137255, 1, 1,
0.4425958, 0.2996915, 1.981534, 0, 0.1058824, 1, 1,
0.444135, -0.6390191, 1.241529, 0, 0.09803922, 1, 1,
0.4452769, -1.30175, 2.064585, 0, 0.09411765, 1, 1,
0.4454305, -0.7201818, 3.814213, 0, 0.08627451, 1, 1,
0.4511413, 0.6300775, -0.0187305, 0, 0.08235294, 1, 1,
0.4546795, -0.6809288, 3.017338, 0, 0.07450981, 1, 1,
0.4605289, -0.951052, 3.0892, 0, 0.07058824, 1, 1,
0.4638618, -1.644142, 3.125903, 0, 0.0627451, 1, 1,
0.4673367, -1.418064, 2.329226, 0, 0.05882353, 1, 1,
0.4742555, -0.9547506, 3.848157, 0, 0.05098039, 1, 1,
0.4751621, -0.5390627, 4.298625, 0, 0.04705882, 1, 1,
0.4901139, 0.3109229, 1.141325, 0, 0.03921569, 1, 1,
0.4907733, 0.6737314, 2.262671, 0, 0.03529412, 1, 1,
0.4907737, 0.3572136, 1.839442, 0, 0.02745098, 1, 1,
0.492585, 1.520732, -1.283913, 0, 0.02352941, 1, 1,
0.493945, 1.271741, 0.6933504, 0, 0.01568628, 1, 1,
0.4940059, 0.02769844, 2.444312, 0, 0.01176471, 1, 1,
0.4943458, -2.124547, 2.98358, 0, 0.003921569, 1, 1,
0.4980925, -0.48763, 2.352959, 0.003921569, 0, 1, 1,
0.5010633, 0.190877, -0.972039, 0.007843138, 0, 1, 1,
0.5022593, 1.135958, -0.5104363, 0.01568628, 0, 1, 1,
0.5051051, 0.9405797, 0.6477044, 0.01960784, 0, 1, 1,
0.5056651, -0.2460033, 3.180876, 0.02745098, 0, 1, 1,
0.5096352, 1.857882, 0.2650929, 0.03137255, 0, 1, 1,
0.5180556, -0.97083, 2.94494, 0.03921569, 0, 1, 1,
0.5250947, -1.881284, 2.509875, 0.04313726, 0, 1, 1,
0.5265859, 0.1134478, 0.3141026, 0.05098039, 0, 1, 1,
0.5292017, 1.014477, 0.8832864, 0.05490196, 0, 1, 1,
0.531936, -0.3745226, 3.399459, 0.0627451, 0, 1, 1,
0.5347179, -0.4916776, 2.743865, 0.06666667, 0, 1, 1,
0.5385716, -1.118427, 3.22289, 0.07450981, 0, 1, 1,
0.5425738, 0.9515378, -0.4927942, 0.07843138, 0, 1, 1,
0.543157, 0.4885243, 1.469674, 0.08627451, 0, 1, 1,
0.5471022, 1.004563, 1.510083, 0.09019608, 0, 1, 1,
0.5475506, -0.0928485, 2.244147, 0.09803922, 0, 1, 1,
0.5526356, -0.08095906, 0.5818127, 0.1058824, 0, 1, 1,
0.5554265, 0.6149301, 0.1556601, 0.1098039, 0, 1, 1,
0.5568454, 0.4045214, -1.335721, 0.1176471, 0, 1, 1,
0.5702329, -0.8548667, 2.138815, 0.1215686, 0, 1, 1,
0.5710047, -0.05882477, 0.7715421, 0.1294118, 0, 1, 1,
0.5733026, -0.4231657, -0.2966939, 0.1333333, 0, 1, 1,
0.5781507, -0.5360123, 2.179865, 0.1411765, 0, 1, 1,
0.5798334, -0.4081903, 3.557479, 0.145098, 0, 1, 1,
0.5848705, 0.7215142, 0.5289375, 0.1529412, 0, 1, 1,
0.5850012, 1.574902, -0.5052053, 0.1568628, 0, 1, 1,
0.5858932, -0.07728146, 3.489777, 0.1647059, 0, 1, 1,
0.586723, 0.8237371, 0.642238, 0.1686275, 0, 1, 1,
0.5876854, 0.7693257, 0.9253168, 0.1764706, 0, 1, 1,
0.5899141, 0.6231732, 0.6148579, 0.1803922, 0, 1, 1,
0.594556, 0.5845119, 0.9114509, 0.1882353, 0, 1, 1,
0.5964647, 0.6923372, 1.14101, 0.1921569, 0, 1, 1,
0.602306, 0.4675756, -0.3240648, 0.2, 0, 1, 1,
0.6046984, 1.007769, 0.5179794, 0.2078431, 0, 1, 1,
0.6056364, 1.690958, -1.047141, 0.2117647, 0, 1, 1,
0.6115733, -0.7284086, 2.401736, 0.2196078, 0, 1, 1,
0.6136773, 0.2268222, 1.92998, 0.2235294, 0, 1, 1,
0.6157916, 0.6242662, 1.232433, 0.2313726, 0, 1, 1,
0.6276659, 0.5770097, 2.377215, 0.2352941, 0, 1, 1,
0.6290162, 0.2653918, 0.6409605, 0.2431373, 0, 1, 1,
0.6298436, -0.07440302, 0.4140174, 0.2470588, 0, 1, 1,
0.6334613, 0.9798043, -0.1168856, 0.254902, 0, 1, 1,
0.6376491, -0.1523689, 1.944023, 0.2588235, 0, 1, 1,
0.6399563, -0.2837881, 1.143205, 0.2666667, 0, 1, 1,
0.6400693, -0.3714445, 4.072962, 0.2705882, 0, 1, 1,
0.6447812, -0.5798649, 4.253867, 0.2784314, 0, 1, 1,
0.6463109, -0.5894766, 2.089077, 0.282353, 0, 1, 1,
0.6478295, 0.3238353, 1.807332, 0.2901961, 0, 1, 1,
0.6502184, -1.120718, 3.702269, 0.2941177, 0, 1, 1,
0.6538723, -0.03969954, 0.9444315, 0.3019608, 0, 1, 1,
0.6546463, -0.06977084, 0.6929302, 0.3098039, 0, 1, 1,
0.6643209, 1.0378, 1.124055, 0.3137255, 0, 1, 1,
0.6656786, 0.50302, 2.076988, 0.3215686, 0, 1, 1,
0.6669662, -0.03960564, 1.114571, 0.3254902, 0, 1, 1,
0.6672957, 0.38125, 2.35178, 0.3333333, 0, 1, 1,
0.6753739, -2.10161, 2.676522, 0.3372549, 0, 1, 1,
0.6829702, 1.879745, -0.4615319, 0.345098, 0, 1, 1,
0.6844303, -1.224084, 1.867857, 0.3490196, 0, 1, 1,
0.6847968, -1.569507, 2.238421, 0.3568628, 0, 1, 1,
0.6853399, 0.7670271, -0.1297298, 0.3607843, 0, 1, 1,
0.6950415, 0.8381048, -0.6951068, 0.3686275, 0, 1, 1,
0.6969033, -1.191905, 2.0869, 0.372549, 0, 1, 1,
0.7036064, -0.00571002, 0.5981218, 0.3803922, 0, 1, 1,
0.7087465, 0.2205309, 1.361511, 0.3843137, 0, 1, 1,
0.7090679, -0.09963051, 3.42987, 0.3921569, 0, 1, 1,
0.7141591, 0.8223876, 0.3267958, 0.3960784, 0, 1, 1,
0.7167721, 0.02048259, 0.4241123, 0.4039216, 0, 1, 1,
0.7184414, 0.4486012, 0.4989984, 0.4117647, 0, 1, 1,
0.7239047, 0.3712999, -0.3073704, 0.4156863, 0, 1, 1,
0.7261814, 0.7014825, 0.8850517, 0.4235294, 0, 1, 1,
0.7264607, 0.0969855, 0.9901454, 0.427451, 0, 1, 1,
0.727538, -0.01044959, 0.161041, 0.4352941, 0, 1, 1,
0.7283087, 0.5825267, 2.61032, 0.4392157, 0, 1, 1,
0.7294766, -0.7063064, 2.651339, 0.4470588, 0, 1, 1,
0.7306082, -0.8343543, 2.007233, 0.4509804, 0, 1, 1,
0.7329094, 1.266598, -1.260575, 0.4588235, 0, 1, 1,
0.7363594, -0.195105, 1.980609, 0.4627451, 0, 1, 1,
0.7374204, 0.8057945, 0.04681261, 0.4705882, 0, 1, 1,
0.7387018, 0.2916685, 2.236892, 0.4745098, 0, 1, 1,
0.7422354, 0.387226, 0.4715372, 0.4823529, 0, 1, 1,
0.7474738, 0.898684, 0.03959122, 0.4862745, 0, 1, 1,
0.747718, 1.438009, 1.816964, 0.4941176, 0, 1, 1,
0.7497462, 0.390655, 1.588527, 0.5019608, 0, 1, 1,
0.7500486, -0.2694137, 1.456291, 0.5058824, 0, 1, 1,
0.7502983, 0.6524681, 2.09796, 0.5137255, 0, 1, 1,
0.7553221, -1.021175, 3.017741, 0.5176471, 0, 1, 1,
0.7555387, 0.6104994, 1.787106, 0.5254902, 0, 1, 1,
0.7565747, 0.2332507, 1.086788, 0.5294118, 0, 1, 1,
0.7644665, -0.1530019, 1.833062, 0.5372549, 0, 1, 1,
0.7727326, 1.769212, -0.3681635, 0.5411765, 0, 1, 1,
0.773248, -0.222903, 1.254752, 0.5490196, 0, 1, 1,
0.7780393, -0.8540522, 2.348835, 0.5529412, 0, 1, 1,
0.7801477, -0.9311144, 2.482433, 0.5607843, 0, 1, 1,
0.787272, 0.5629986, 0.685422, 0.5647059, 0, 1, 1,
0.7889977, -0.6764104, 3.032387, 0.572549, 0, 1, 1,
0.7961488, 1.256947, 0.8047242, 0.5764706, 0, 1, 1,
0.798619, 1.025619, -0.6003913, 0.5843138, 0, 1, 1,
0.8068882, -1.530795, 3.530245, 0.5882353, 0, 1, 1,
0.8075063, 0.3995406, 1.44194, 0.5960785, 0, 1, 1,
0.8145279, -1.217963, 3.180564, 0.6039216, 0, 1, 1,
0.8161422, -0.6361387, 1.273277, 0.6078432, 0, 1, 1,
0.8171878, -0.6130341, 2.376236, 0.6156863, 0, 1, 1,
0.8177873, -0.8744108, 2.286138, 0.6196079, 0, 1, 1,
0.8209148, 1.3644, -1.108211, 0.627451, 0, 1, 1,
0.8218392, -1.540016, 2.127174, 0.6313726, 0, 1, 1,
0.8251047, 0.4448903, -0.6971014, 0.6392157, 0, 1, 1,
0.8258086, -0.1622056, 0.575157, 0.6431373, 0, 1, 1,
0.8278371, 0.3337781, 1.091259, 0.6509804, 0, 1, 1,
0.831845, 0.1674512, 0.9145926, 0.654902, 0, 1, 1,
0.8319384, 0.1063933, 2.696684, 0.6627451, 0, 1, 1,
0.8372992, -0.562862, 3.512308, 0.6666667, 0, 1, 1,
0.8382025, -0.5196066, 2.649983, 0.6745098, 0, 1, 1,
0.8385064, -0.5341004, 2.351075, 0.6784314, 0, 1, 1,
0.841391, 0.7764725, 3.021034, 0.6862745, 0, 1, 1,
0.8423671, -0.2129887, 1.379096, 0.6901961, 0, 1, 1,
0.8443989, 1.08046, 0.5028257, 0.6980392, 0, 1, 1,
0.8474794, -2.178296, 3.207772, 0.7058824, 0, 1, 1,
0.849425, -1.340612, 3.807208, 0.7098039, 0, 1, 1,
0.8505232, 0.08417835, 0.8603435, 0.7176471, 0, 1, 1,
0.8526423, -0.4915001, 0.9795586, 0.7215686, 0, 1, 1,
0.8547396, -0.1937288, -0.2479804, 0.7294118, 0, 1, 1,
0.8616221, 0.04875808, 0.728436, 0.7333333, 0, 1, 1,
0.8617299, -0.7966899, 1.170532, 0.7411765, 0, 1, 1,
0.8662753, -0.2888651, 2.425443, 0.7450981, 0, 1, 1,
0.8685565, -1.30905, 1.818682, 0.7529412, 0, 1, 1,
0.8723239, -1.207868, 1.287652, 0.7568628, 0, 1, 1,
0.8771437, -2.171251, 3.120883, 0.7647059, 0, 1, 1,
0.8913484, -1.024839, 1.148282, 0.7686275, 0, 1, 1,
0.8928453, 1.927682, -1.751867, 0.7764706, 0, 1, 1,
0.8977885, 1.381508, 1.056246, 0.7803922, 0, 1, 1,
0.8992007, -0.5489997, 1.18035, 0.7882353, 0, 1, 1,
0.9017079, -0.7801766, 1.846166, 0.7921569, 0, 1, 1,
0.9106213, -0.1634115, 2.610512, 0.8, 0, 1, 1,
0.9138749, 0.1728143, 2.345476, 0.8078431, 0, 1, 1,
0.920911, 0.08267291, 1.221579, 0.8117647, 0, 1, 1,
0.9243258, -0.6811961, 2.197585, 0.8196079, 0, 1, 1,
0.9272068, 0.1169117, 2.062468, 0.8235294, 0, 1, 1,
0.9272865, 0.3814941, 2.877548, 0.8313726, 0, 1, 1,
0.9302865, -0.3529514, 2.28809, 0.8352941, 0, 1, 1,
0.9303071, 0.2867379, 1.472881, 0.8431373, 0, 1, 1,
0.9432185, -0.704694, 3.258451, 0.8470588, 0, 1, 1,
0.9436393, 0.05840514, 0.8179995, 0.854902, 0, 1, 1,
0.9495772, 0.5585028, 0.769242, 0.8588235, 0, 1, 1,
0.9540642, 1.714396, -0.5826547, 0.8666667, 0, 1, 1,
0.9679151, -0.786668, 1.652899, 0.8705882, 0, 1, 1,
0.969623, 2.769219, -0.3072593, 0.8784314, 0, 1, 1,
0.9713965, 0.7680798, 2.17788, 0.8823529, 0, 1, 1,
0.9729382, 1.125628, 0.8537612, 0.8901961, 0, 1, 1,
0.9738649, -0.3961926, 3.150652, 0.8941177, 0, 1, 1,
0.9742374, -0.4841242, 0.4654132, 0.9019608, 0, 1, 1,
0.9806305, 0.4450971, 2.306344, 0.9098039, 0, 1, 1,
0.981339, 0.06465186, 0.8322645, 0.9137255, 0, 1, 1,
0.9867135, -1.028508, 2.034901, 0.9215686, 0, 1, 1,
0.9872804, 1.427224, 0.5489951, 0.9254902, 0, 1, 1,
0.9923876, -0.2874773, 1.85093, 0.9333333, 0, 1, 1,
1.010056, 0.1712562, 0.9002678, 0.9372549, 0, 1, 1,
1.011008, -0.3360493, 1.509486, 0.945098, 0, 1, 1,
1.011234, -0.1514899, 2.726171, 0.9490196, 0, 1, 1,
1.014083, -0.1768868, 1.492654, 0.9568627, 0, 1, 1,
1.023062, 0.7356297, 3.262344, 0.9607843, 0, 1, 1,
1.031474, 0.9769226, -1.283858, 0.9686275, 0, 1, 1,
1.039365, -0.7084008, 2.70299, 0.972549, 0, 1, 1,
1.043622, -0.2637239, 1.031074, 0.9803922, 0, 1, 1,
1.046136, 1.109964, 1.629642, 0.9843137, 0, 1, 1,
1.047205, -0.2978089, 2.354995, 0.9921569, 0, 1, 1,
1.052159, -0.0787712, 2.446047, 0.9960784, 0, 1, 1,
1.06063, -0.1042571, 1.86999, 1, 0, 0.9960784, 1,
1.061375, -0.1867153, 1.68801, 1, 0, 0.9882353, 1,
1.065315, -0.06304993, 1.450863, 1, 0, 0.9843137, 1,
1.067579, -1.346866, 3.255952, 1, 0, 0.9764706, 1,
1.073691, 0.5172471, 3.148922, 1, 0, 0.972549, 1,
1.080496, -1.012484, 3.277838, 1, 0, 0.9647059, 1,
1.084767, 2.34117, -0.1914875, 1, 0, 0.9607843, 1,
1.088268, 0.1631374, 0.349728, 1, 0, 0.9529412, 1,
1.095871, 0.1847058, 0.3673324, 1, 0, 0.9490196, 1,
1.097732, 1.675952, 0.6293007, 1, 0, 0.9411765, 1,
1.098463, 1.164332, 0.2435524, 1, 0, 0.9372549, 1,
1.098667, 0.9087037, -0.7514296, 1, 0, 0.9294118, 1,
1.09966, -1.505864, 2.870526, 1, 0, 0.9254902, 1,
1.103432, -0.4332599, 1.849463, 1, 0, 0.9176471, 1,
1.104122, -1.075277, 3.337169, 1, 0, 0.9137255, 1,
1.104194, 0.07834608, 2.86952, 1, 0, 0.9058824, 1,
1.109858, -0.4297785, 2.162315, 1, 0, 0.9019608, 1,
1.110174, -1.492846, 2.222737, 1, 0, 0.8941177, 1,
1.112799, -0.04056115, 2.903046, 1, 0, 0.8862745, 1,
1.114119, -1.082424, 3.768786, 1, 0, 0.8823529, 1,
1.125306, -1.635212, 3.107697, 1, 0, 0.8745098, 1,
1.125817, -0.4795705, 1.142689, 1, 0, 0.8705882, 1,
1.127863, 0.3358605, 0.2608123, 1, 0, 0.8627451, 1,
1.130999, 2.148028, -0.6290945, 1, 0, 0.8588235, 1,
1.131181, 0.4588632, 0.0185812, 1, 0, 0.8509804, 1,
1.138513, -1.905668, 1.947639, 1, 0, 0.8470588, 1,
1.139088, 0.7956634, 0.4612888, 1, 0, 0.8392157, 1,
1.145033, 0.405887, 1.187002, 1, 0, 0.8352941, 1,
1.152314, 0.7534844, -1.086232, 1, 0, 0.827451, 1,
1.152563, 1.650049, 0.1267605, 1, 0, 0.8235294, 1,
1.158263, 0.04740386, 0.402544, 1, 0, 0.8156863, 1,
1.161758, -1.438452, 3.432734, 1, 0, 0.8117647, 1,
1.16228, 0.5452292, 1.570431, 1, 0, 0.8039216, 1,
1.168826, 0.118384, 1.219809, 1, 0, 0.7960784, 1,
1.178218, 1.801797, 0.9541188, 1, 0, 0.7921569, 1,
1.179222, -0.3422223, 3.017632, 1, 0, 0.7843137, 1,
1.182516, -0.1841753, 3.407112, 1, 0, 0.7803922, 1,
1.182864, 1.353578, 1.461189, 1, 0, 0.772549, 1,
1.189697, 0.0326005, 2.019068, 1, 0, 0.7686275, 1,
1.190584, -1.536544, 2.774137, 1, 0, 0.7607843, 1,
1.190953, 0.01862141, -0.5279962, 1, 0, 0.7568628, 1,
1.200103, -1.599331, 3.972588, 1, 0, 0.7490196, 1,
1.202786, 0.2746603, 1.125474, 1, 0, 0.7450981, 1,
1.205979, -1.184839, 2.91882, 1, 0, 0.7372549, 1,
1.216972, 1.154748, 0.9306794, 1, 0, 0.7333333, 1,
1.222654, 0.4438141, -0.7985169, 1, 0, 0.7254902, 1,
1.223103, -1.28873, 2.450669, 1, 0, 0.7215686, 1,
1.233708, -0.4482129, 1.200894, 1, 0, 0.7137255, 1,
1.235092, 0.4902167, 0.7810174, 1, 0, 0.7098039, 1,
1.237478, 1.503705, 2.221687, 1, 0, 0.7019608, 1,
1.245943, -0.4784356, 1.226285, 1, 0, 0.6941177, 1,
1.247117, -0.5535072, 3.24246, 1, 0, 0.6901961, 1,
1.249808, 0.3917333, 0.8629615, 1, 0, 0.682353, 1,
1.257924, 1.433716, 1.439854, 1, 0, 0.6784314, 1,
1.270211, -0.7399002, 2.668505, 1, 0, 0.6705883, 1,
1.27426, -2.173965, 2.321886, 1, 0, 0.6666667, 1,
1.281477, 0.1291059, 2.012602, 1, 0, 0.6588235, 1,
1.286759, -0.5106105, 1.940645, 1, 0, 0.654902, 1,
1.290257, 0.7832428, 0.9495318, 1, 0, 0.6470588, 1,
1.300338, -0.4634082, 2.384408, 1, 0, 0.6431373, 1,
1.303722, 0.4697888, 0.3590456, 1, 0, 0.6352941, 1,
1.304705, 0.3598464, 0.846038, 1, 0, 0.6313726, 1,
1.317282, 0.06980634, 2.485188, 1, 0, 0.6235294, 1,
1.32186, -1.819575, 1.90344, 1, 0, 0.6196079, 1,
1.324229, -0.4550733, 0.8927143, 1, 0, 0.6117647, 1,
1.325317, 0.3719517, -0.5793716, 1, 0, 0.6078432, 1,
1.337297, -0.3048941, 1.81539, 1, 0, 0.6, 1,
1.344069, -1.831569, 1.214894, 1, 0, 0.5921569, 1,
1.345142, 1.795715, 1.808447, 1, 0, 0.5882353, 1,
1.352166, -0.2688758, 1.271294, 1, 0, 0.5803922, 1,
1.355906, -0.5221006, 2.650256, 1, 0, 0.5764706, 1,
1.361786, -1.214569, 1.804306, 1, 0, 0.5686275, 1,
1.367636, -1.503827, 2.209504, 1, 0, 0.5647059, 1,
1.367737, 1.656596, -0.4530043, 1, 0, 0.5568628, 1,
1.3749, -1.439054, 1.956685, 1, 0, 0.5529412, 1,
1.395261, 0.1751106, 1.56126, 1, 0, 0.5450981, 1,
1.404974, -0.4780633, 2.236257, 1, 0, 0.5411765, 1,
1.406142, -0.008280257, 0.5617597, 1, 0, 0.5333334, 1,
1.409825, 1.197602, 1.621187, 1, 0, 0.5294118, 1,
1.420283, -1.45503, 2.915206, 1, 0, 0.5215687, 1,
1.424817, -0.8532782, 1.767916, 1, 0, 0.5176471, 1,
1.429695, -1.310349, 1.433486, 1, 0, 0.509804, 1,
1.430928, 1.035205, 1.084318, 1, 0, 0.5058824, 1,
1.430935, 0.8498977, 2.631115, 1, 0, 0.4980392, 1,
1.437571, -0.3415011, 3.052124, 1, 0, 0.4901961, 1,
1.440545, -2.35751, 2.577088, 1, 0, 0.4862745, 1,
1.464228, -0.3878718, 1.076069, 1, 0, 0.4784314, 1,
1.466029, -0.9185894, 3.017969, 1, 0, 0.4745098, 1,
1.483635, -2.211354, 2.624678, 1, 0, 0.4666667, 1,
1.493525, 0.5940807, 3.060796, 1, 0, 0.4627451, 1,
1.493793, -1.050689, 3.251019, 1, 0, 0.454902, 1,
1.494683, -1.22662, 2.104901, 1, 0, 0.4509804, 1,
1.498729, -0.515942, 1.079273, 1, 0, 0.4431373, 1,
1.51933, -0.5583982, 0.8795659, 1, 0, 0.4392157, 1,
1.538075, 1.290324, 2.332071, 1, 0, 0.4313726, 1,
1.544978, 0.6313875, -0.9543411, 1, 0, 0.427451, 1,
1.557609, -0.3441217, 2.203548, 1, 0, 0.4196078, 1,
1.565523, -0.2934781, 1.75053, 1, 0, 0.4156863, 1,
1.571588, 1.936661, 1.730033, 1, 0, 0.4078431, 1,
1.585651, -1.737797, 3.20695, 1, 0, 0.4039216, 1,
1.594683, 0.01162707, 1.125423, 1, 0, 0.3960784, 1,
1.597797, 0.7319881, -0.09530395, 1, 0, 0.3882353, 1,
1.602405, 0.3725954, 1.882212, 1, 0, 0.3843137, 1,
1.608761, 0.1123888, 0.3323937, 1, 0, 0.3764706, 1,
1.609758, -0.5200334, 1.024257, 1, 0, 0.372549, 1,
1.615827, 0.9349926, 0.8759075, 1, 0, 0.3647059, 1,
1.616711, -0.9148887, 0.5230557, 1, 0, 0.3607843, 1,
1.617336, 1.538019, 1.257068, 1, 0, 0.3529412, 1,
1.637944, 0.2227818, 4.16346, 1, 0, 0.3490196, 1,
1.647836, 0.2314592, 1.783291, 1, 0, 0.3411765, 1,
1.653653, 1.157396, 0.3611263, 1, 0, 0.3372549, 1,
1.677964, -0.914014, 1.83885, 1, 0, 0.3294118, 1,
1.679151, 0.7899937, 1.381735, 1, 0, 0.3254902, 1,
1.67995, -1.58417, 2.226554, 1, 0, 0.3176471, 1,
1.681436, -1.603713, -1.194089, 1, 0, 0.3137255, 1,
1.684272, 0.659705, 0.3653861, 1, 0, 0.3058824, 1,
1.701902, 0.6265206, 2.567304, 1, 0, 0.2980392, 1,
1.753248, 0.08287806, 2.705721, 1, 0, 0.2941177, 1,
1.753622, 2.105331, 1.453835, 1, 0, 0.2862745, 1,
1.760978, -0.2132466, 2.078726, 1, 0, 0.282353, 1,
1.792068, 0.02198811, 1.378, 1, 0, 0.2745098, 1,
1.798957, 0.6536761, 1.934506, 1, 0, 0.2705882, 1,
1.80887, -0.5480034, 1.025327, 1, 0, 0.2627451, 1,
1.818699, 0.5123429, 0.5117457, 1, 0, 0.2588235, 1,
1.822785, -0.2597659, -0.3263206, 1, 0, 0.2509804, 1,
1.825332, 0.9920654, -1.331656, 1, 0, 0.2470588, 1,
1.865023, 1.950122, 1.303113, 1, 0, 0.2392157, 1,
1.868404, 0.1494021, 0.4937513, 1, 0, 0.2352941, 1,
1.872896, 0.9180257, -0.335311, 1, 0, 0.227451, 1,
1.877264, -0.3035584, -0.05487168, 1, 0, 0.2235294, 1,
1.89653, -0.8226695, 2.029549, 1, 0, 0.2156863, 1,
1.916815, 1.381388, 0.5109324, 1, 0, 0.2117647, 1,
1.922493, 0.08223569, 2.004049, 1, 0, 0.2039216, 1,
1.925458, 0.4108021, 1.293144, 1, 0, 0.1960784, 1,
1.940938, -1.808978, 1.182475, 1, 0, 0.1921569, 1,
1.950184, 0.09202749, 3.515342, 1, 0, 0.1843137, 1,
1.954466, 0.3091568, -0.5264174, 1, 0, 0.1803922, 1,
1.963852, 0.5267577, 1.435508, 1, 0, 0.172549, 1,
1.965186, -0.9956679, 2.738836, 1, 0, 0.1686275, 1,
2.014452, -0.1997932, 1.046228, 1, 0, 0.1607843, 1,
2.033874, 0.4362814, 0.8390734, 1, 0, 0.1568628, 1,
2.056915, -1.251134, 2.207502, 1, 0, 0.1490196, 1,
2.075228, -0.02982886, 0.2464931, 1, 0, 0.145098, 1,
2.095948, -1.445832, 3.793598, 1, 0, 0.1372549, 1,
2.100996, 1.367261, -0.8811338, 1, 0, 0.1333333, 1,
2.141252, 1.305179, -0.5602551, 1, 0, 0.1254902, 1,
2.16741, 1.663103, 1.402124, 1, 0, 0.1215686, 1,
2.170058, 0.2547173, 0.1538942, 1, 0, 0.1137255, 1,
2.226511, 0.01140913, 0.08049683, 1, 0, 0.1098039, 1,
2.242315, 0.5456291, 1.264115, 1, 0, 0.1019608, 1,
2.243356, 1.796304, 0.3546143, 1, 0, 0.09411765, 1,
2.252816, 1.233412, 1.863306, 1, 0, 0.09019608, 1,
2.298626, 0.7451884, 2.396023, 1, 0, 0.08235294, 1,
2.304665, -0.8386233, 1.292427, 1, 0, 0.07843138, 1,
2.308756, -0.06623428, 1.802651, 1, 0, 0.07058824, 1,
2.394496, 1.285524, 0.5181713, 1, 0, 0.06666667, 1,
2.395195, -1.724969, 4.137668, 1, 0, 0.05882353, 1,
2.470557, 0.2902922, -0.1942231, 1, 0, 0.05490196, 1,
2.541073, 0.6637265, 1.820902, 1, 0, 0.04705882, 1,
2.54248, 0.9165416, 1.552292, 1, 0, 0.04313726, 1,
2.593612, 0.9857569, 1.777671, 1, 0, 0.03529412, 1,
2.637285, -0.5273721, 0.8894795, 1, 0, 0.03137255, 1,
2.657688, 0.04444726, 2.166145, 1, 0, 0.02352941, 1,
2.664653, 0.05562189, 0.472883, 1, 0, 0.01960784, 1,
2.81616, -0.01379345, 1.415791, 1, 0, 0.01176471, 1,
3.517112, 1.794324, 1.808338, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.03668082, -4.07134, -6.845459, 0, -0.5, 0.5, 0.5,
-0.03668082, -4.07134, -6.845459, 1, -0.5, 0.5, 0.5,
-0.03668082, -4.07134, -6.845459, 1, 1.5, 0.5, 0.5,
-0.03668082, -4.07134, -6.845459, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.795209, -0.07927656, -6.845459, 0, -0.5, 0.5, 0.5,
-4.795209, -0.07927656, -6.845459, 1, -0.5, 0.5, 0.5,
-4.795209, -0.07927656, -6.845459, 1, 1.5, 0.5, 0.5,
-4.795209, -0.07927656, -6.845459, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.795209, -4.07134, 0.09764981, 0, -0.5, 0.5, 0.5,
-4.795209, -4.07134, 0.09764981, 1, -0.5, 0.5, 0.5,
-4.795209, -4.07134, 0.09764981, 1, 1.5, 0.5, 0.5,
-4.795209, -4.07134, 0.09764981, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.150095, -5.243204,
2, -3.150095, -5.243204,
-2, -3.150095, -5.243204,
-2, -3.303636, -5.510246,
0, -3.150095, -5.243204,
0, -3.303636, -5.510246,
2, -3.150095, -5.243204,
2, -3.303636, -5.510246
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"0",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.610718, -6.044332, 0, -0.5, 0.5, 0.5,
-2, -3.610718, -6.044332, 1, -0.5, 0.5, 0.5,
-2, -3.610718, -6.044332, 1, 1.5, 0.5, 0.5,
-2, -3.610718, -6.044332, 0, 1.5, 0.5, 0.5,
0, -3.610718, -6.044332, 0, -0.5, 0.5, 0.5,
0, -3.610718, -6.044332, 1, -0.5, 0.5, 0.5,
0, -3.610718, -6.044332, 1, 1.5, 0.5, 0.5,
0, -3.610718, -6.044332, 0, 1.5, 0.5, 0.5,
2, -3.610718, -6.044332, 0, -0.5, 0.5, 0.5,
2, -3.610718, -6.044332, 1, -0.5, 0.5, 0.5,
2, -3.610718, -6.044332, 1, 1.5, 0.5, 0.5,
2, -3.610718, -6.044332, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.697087, -3, -5.243204,
-3.697087, 2, -5.243204,
-3.697087, -3, -5.243204,
-3.880107, -3, -5.510246,
-3.697087, -2, -5.243204,
-3.880107, -2, -5.510246,
-3.697087, -1, -5.243204,
-3.880107, -1, -5.510246,
-3.697087, 0, -5.243204,
-3.880107, 0, -5.510246,
-3.697087, 1, -5.243204,
-3.880107, 1, -5.510246,
-3.697087, 2, -5.243204,
-3.880107, 2, -5.510246
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.246148, -3, -6.044332, 0, -0.5, 0.5, 0.5,
-4.246148, -3, -6.044332, 1, -0.5, 0.5, 0.5,
-4.246148, -3, -6.044332, 1, 1.5, 0.5, 0.5,
-4.246148, -3, -6.044332, 0, 1.5, 0.5, 0.5,
-4.246148, -2, -6.044332, 0, -0.5, 0.5, 0.5,
-4.246148, -2, -6.044332, 1, -0.5, 0.5, 0.5,
-4.246148, -2, -6.044332, 1, 1.5, 0.5, 0.5,
-4.246148, -2, -6.044332, 0, 1.5, 0.5, 0.5,
-4.246148, -1, -6.044332, 0, -0.5, 0.5, 0.5,
-4.246148, -1, -6.044332, 1, -0.5, 0.5, 0.5,
-4.246148, -1, -6.044332, 1, 1.5, 0.5, 0.5,
-4.246148, -1, -6.044332, 0, 1.5, 0.5, 0.5,
-4.246148, 0, -6.044332, 0, -0.5, 0.5, 0.5,
-4.246148, 0, -6.044332, 1, -0.5, 0.5, 0.5,
-4.246148, 0, -6.044332, 1, 1.5, 0.5, 0.5,
-4.246148, 0, -6.044332, 0, 1.5, 0.5, 0.5,
-4.246148, 1, -6.044332, 0, -0.5, 0.5, 0.5,
-4.246148, 1, -6.044332, 1, -0.5, 0.5, 0.5,
-4.246148, 1, -6.044332, 1, 1.5, 0.5, 0.5,
-4.246148, 1, -6.044332, 0, 1.5, 0.5, 0.5,
-4.246148, 2, -6.044332, 0, -0.5, 0.5, 0.5,
-4.246148, 2, -6.044332, 1, -0.5, 0.5, 0.5,
-4.246148, 2, -6.044332, 1, 1.5, 0.5, 0.5,
-4.246148, 2, -6.044332, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.697087, -3.150095, -4,
-3.697087, -3.150095, 4,
-3.697087, -3.150095, -4,
-3.880107, -3.303636, -4,
-3.697087, -3.150095, -2,
-3.880107, -3.303636, -2,
-3.697087, -3.150095, 0,
-3.880107, -3.303636, 0,
-3.697087, -3.150095, 2,
-3.880107, -3.303636, 2,
-3.697087, -3.150095, 4,
-3.880107, -3.303636, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.246148, -3.610718, -4, 0, -0.5, 0.5, 0.5,
-4.246148, -3.610718, -4, 1, -0.5, 0.5, 0.5,
-4.246148, -3.610718, -4, 1, 1.5, 0.5, 0.5,
-4.246148, -3.610718, -4, 0, 1.5, 0.5, 0.5,
-4.246148, -3.610718, -2, 0, -0.5, 0.5, 0.5,
-4.246148, -3.610718, -2, 1, -0.5, 0.5, 0.5,
-4.246148, -3.610718, -2, 1, 1.5, 0.5, 0.5,
-4.246148, -3.610718, -2, 0, 1.5, 0.5, 0.5,
-4.246148, -3.610718, 0, 0, -0.5, 0.5, 0.5,
-4.246148, -3.610718, 0, 1, -0.5, 0.5, 0.5,
-4.246148, -3.610718, 0, 1, 1.5, 0.5, 0.5,
-4.246148, -3.610718, 0, 0, 1.5, 0.5, 0.5,
-4.246148, -3.610718, 2, 0, -0.5, 0.5, 0.5,
-4.246148, -3.610718, 2, 1, -0.5, 0.5, 0.5,
-4.246148, -3.610718, 2, 1, 1.5, 0.5, 0.5,
-4.246148, -3.610718, 2, 0, 1.5, 0.5, 0.5,
-4.246148, -3.610718, 4, 0, -0.5, 0.5, 0.5,
-4.246148, -3.610718, 4, 1, -0.5, 0.5, 0.5,
-4.246148, -3.610718, 4, 1, 1.5, 0.5, 0.5,
-4.246148, -3.610718, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.697087, -3.150095, -5.243204,
-3.697087, 2.991542, -5.243204,
-3.697087, -3.150095, 5.438503,
-3.697087, 2.991542, 5.438503,
-3.697087, -3.150095, -5.243204,
-3.697087, -3.150095, 5.438503,
-3.697087, 2.991542, -5.243204,
-3.697087, 2.991542, 5.438503,
-3.697087, -3.150095, -5.243204,
3.623725, -3.150095, -5.243204,
-3.697087, -3.150095, 5.438503,
3.623725, -3.150095, 5.438503,
-3.697087, 2.991542, -5.243204,
3.623725, 2.991542, -5.243204,
-3.697087, 2.991542, 5.438503,
3.623725, 2.991542, 5.438503,
3.623725, -3.150095, -5.243204,
3.623725, 2.991542, -5.243204,
3.623725, -3.150095, 5.438503,
3.623725, 2.991542, 5.438503,
3.623725, -3.150095, -5.243204,
3.623725, -3.150095, 5.438503,
3.623725, 2.991542, -5.243204,
3.623725, 2.991542, 5.438503
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.653133;
var distance = 34.04965;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.03668082, 0.07927656, -0.09764981 );
mvMatrix.scale( 1.1303, 1.347315, 0.7746625 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.04965);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 8);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
Methyl_Parathion<-read.table("Methyl_Parathion.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methyl_Parathion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_Parathion' not found
```

```r
y<-Methyl_Parathion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_Parathion' not found
```

```r
z<-Methyl_Parathion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_Parathion' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-3.590473, 0.2840945, -0.8332629, 0, 0, 1, 1, 1,
-3.465039, 0.731091, -1.597821, 1, 0, 0, 1, 1,
-3.053921, -0.652599, -2.178566, 1, 0, 0, 1, 1,
-2.947214, 0.4120276, -1.156132, 1, 0, 0, 1, 1,
-2.926479, 0.1169534, -1.440935, 1, 0, 0, 1, 1,
-2.770305, -0.4178116, -1.539151, 1, 0, 0, 1, 1,
-2.395516, -0.1461426, 0.7537961, 0, 0, 0, 1, 1,
-2.391545, -1.479956, -0.3544199, 0, 0, 0, 1, 1,
-2.239039, -0.8928062, -3.194859, 0, 0, 0, 1, 1,
-2.215495, 1.068069, -1.100324, 0, 0, 0, 1, 1,
-2.183118, -1.061091, -2.085745, 0, 0, 0, 1, 1,
-2.175353, -0.8987604, -2.676981, 0, 0, 0, 1, 1,
-2.1529, 0.8397228, -2.65735, 0, 0, 0, 1, 1,
-2.116318, 0.02562628, -0.5822564, 1, 1, 1, 1, 1,
-2.110744, -0.5068802, -1.248102, 1, 1, 1, 1, 1,
-2.106121, -1.115278, -1.444196, 1, 1, 1, 1, 1,
-2.105644, 0.1988353, -1.23252, 1, 1, 1, 1, 1,
-2.083451, 2.076431, 0.7737942, 1, 1, 1, 1, 1,
-2.048731, -0.1941669, -1.343486, 1, 1, 1, 1, 1,
-2.04843, 0.2066478, -2.216315, 1, 1, 1, 1, 1,
-2.017515, 1.299284, -0.4269739, 1, 1, 1, 1, 1,
-2.003911, 0.3308581, -1.410112, 1, 1, 1, 1, 1,
-2.000324, -0.2773726, -2.613792, 1, 1, 1, 1, 1,
-1.98437, -0.5844216, -2.078129, 1, 1, 1, 1, 1,
-1.961501, 0.2219381, 0.1833027, 1, 1, 1, 1, 1,
-1.945012, 0.3798651, -0.5793399, 1, 1, 1, 1, 1,
-1.934731, -0.9672854, -3.105545, 1, 1, 1, 1, 1,
-1.927734, 1.738618, -1.234924, 1, 1, 1, 1, 1,
-1.924173, -0.6765888, -1.53702, 0, 0, 1, 1, 1,
-1.899046, 0.5413673, 0.1505261, 1, 0, 0, 1, 1,
-1.8759, 0.626572, -1.094242, 1, 0, 0, 1, 1,
-1.867866, -1.514953, -1.934318, 1, 0, 0, 1, 1,
-1.867395, 0.3424945, -1.482346, 1, 0, 0, 1, 1,
-1.864315, -1.056267, -1.956103, 1, 0, 0, 1, 1,
-1.859697, 1.991642, 0.7038478, 0, 0, 0, 1, 1,
-1.857123, -1.26362, 0.1365938, 0, 0, 0, 1, 1,
-1.850035, -2.228938, -0.6939292, 0, 0, 0, 1, 1,
-1.841482, 0.3116345, -0.8572891, 0, 0, 0, 1, 1,
-1.835833, 0.4300897, -1.517399, 0, 0, 0, 1, 1,
-1.828139, 0.58065, -1.043768, 0, 0, 0, 1, 1,
-1.826185, 0.3062411, -0.149433, 0, 0, 0, 1, 1,
-1.800425, -1.221108, -1.779072, 1, 1, 1, 1, 1,
-1.794387, -0.1564968, -3.742434, 1, 1, 1, 1, 1,
-1.793553, -0.5825934, -1.380241, 1, 1, 1, 1, 1,
-1.776625, -0.1319572, -0.495046, 1, 1, 1, 1, 1,
-1.775912, -0.459671, -1.483228, 1, 1, 1, 1, 1,
-1.764448, 0.08537348, 0.1527303, 1, 1, 1, 1, 1,
-1.763307, 0.7211946, -0.111067, 1, 1, 1, 1, 1,
-1.754513, -3.060653, -1.385731, 1, 1, 1, 1, 1,
-1.736513, -0.108578, 0.5759488, 1, 1, 1, 1, 1,
-1.732328, 1.470724, -2.370361, 1, 1, 1, 1, 1,
-1.719649, 0.4012767, -0.9375699, 1, 1, 1, 1, 1,
-1.710235, 1.322278, -0.4088687, 1, 1, 1, 1, 1,
-1.690228, 0.6821738, -0.7425018, 1, 1, 1, 1, 1,
-1.689404, -0.4598896, -2.172991, 1, 1, 1, 1, 1,
-1.675499, 0.5202363, -1.500566, 1, 1, 1, 1, 1,
-1.659554, -0.1168207, -2.375618, 0, 0, 1, 1, 1,
-1.643647, -1.504947, -1.346631, 1, 0, 0, 1, 1,
-1.63612, 1.921912, -2.005923, 1, 0, 0, 1, 1,
-1.632368, 1.591659, -2.021381, 1, 0, 0, 1, 1,
-1.629937, -0.3610536, -0.7696856, 1, 0, 0, 1, 1,
-1.623344, 1.130523, -1.092082, 1, 0, 0, 1, 1,
-1.597891, -0.360533, -2.848948, 0, 0, 0, 1, 1,
-1.594639, 0.5600512, -1.743837, 0, 0, 0, 1, 1,
-1.592926, -0.7633598, -0.6076325, 0, 0, 0, 1, 1,
-1.590196, -0.2020329, -2.832689, 0, 0, 0, 1, 1,
-1.586941, -0.4558737, -0.3516826, 0, 0, 0, 1, 1,
-1.584361, -0.0806142, -0.1707014, 0, 0, 0, 1, 1,
-1.577421, -0.0698141, -0.852035, 0, 0, 0, 1, 1,
-1.575176, 0.1518988, -0.5561684, 1, 1, 1, 1, 1,
-1.573774, 0.3647309, -1.805085, 1, 1, 1, 1, 1,
-1.559746, -0.989235, -0.7248436, 1, 1, 1, 1, 1,
-1.554416, 0.03539198, -1.592881, 1, 1, 1, 1, 1,
-1.550008, 0.4245456, -1.174483, 1, 1, 1, 1, 1,
-1.54618, 0.6090729, 0.535638, 1, 1, 1, 1, 1,
-1.544849, 1.580462, -0.7055337, 1, 1, 1, 1, 1,
-1.542198, -0.7187605, -2.4904, 1, 1, 1, 1, 1,
-1.536317, 0.9475534, 0.2120573, 1, 1, 1, 1, 1,
-1.522175, 2.096389, -1.031402, 1, 1, 1, 1, 1,
-1.516116, 0.2919709, -2.480864, 1, 1, 1, 1, 1,
-1.514765, 0.293444, -1.925465, 1, 1, 1, 1, 1,
-1.511898, -0.387666, -1.866599, 1, 1, 1, 1, 1,
-1.511657, -0.8069955, -2.858617, 1, 1, 1, 1, 1,
-1.507315, -0.6533135, -2.999409, 1, 1, 1, 1, 1,
-1.506865, -1.327212, -3.775507, 0, 0, 1, 1, 1,
-1.503134, 1.856618, -2.567994, 1, 0, 0, 1, 1,
-1.502287, -0.1053811, -2.074818, 1, 0, 0, 1, 1,
-1.500157, -0.699356, -2.070634, 1, 0, 0, 1, 1,
-1.495344, 0.4326245, -1.068739, 1, 0, 0, 1, 1,
-1.49503, 0.5598496, -2.239643, 1, 0, 0, 1, 1,
-1.484288, -0.2563497, -1.049572, 0, 0, 0, 1, 1,
-1.476758, 0.637081, -1.936405, 0, 0, 0, 1, 1,
-1.474189, -1.33051, -1.489671, 0, 0, 0, 1, 1,
-1.47344, -1.029547, -1.245201, 0, 0, 0, 1, 1,
-1.468999, -0.9367573, -1.802737, 0, 0, 0, 1, 1,
-1.466284, 0.2841364, -0.9708983, 0, 0, 0, 1, 1,
-1.465223, -0.6099144, -0.9948862, 0, 0, 0, 1, 1,
-1.46367, 0.5418943, -1.366377, 1, 1, 1, 1, 1,
-1.457437, -0.4888653, 0.3814197, 1, 1, 1, 1, 1,
-1.457129, -0.5945028, -1.872259, 1, 1, 1, 1, 1,
-1.448285, 1.950662, -0.458055, 1, 1, 1, 1, 1,
-1.437936, -0.4256738, -2.22342, 1, 1, 1, 1, 1,
-1.43529, -0.4381799, -2.066915, 1, 1, 1, 1, 1,
-1.420838, -0.8151573, -2.624226, 1, 1, 1, 1, 1,
-1.418545, 1.521967, -0.05120877, 1, 1, 1, 1, 1,
-1.417239, 2.036526, -0.405495, 1, 1, 1, 1, 1,
-1.409798, 0.4702269, -1.164087, 1, 1, 1, 1, 1,
-1.401442, 0.9470533, -2.210977, 1, 1, 1, 1, 1,
-1.401429, -0.8460059, -1.634868, 1, 1, 1, 1, 1,
-1.392628, -1.584863, -1.779295, 1, 1, 1, 1, 1,
-1.379144, -0.02543026, -2.792735, 1, 1, 1, 1, 1,
-1.368896, 1.049457, -1.827772, 1, 1, 1, 1, 1,
-1.359682, -0.6729378, -2.210386, 0, 0, 1, 1, 1,
-1.354175, 1.457005, -1.262622, 1, 0, 0, 1, 1,
-1.350336, -1.815688, -2.444461, 1, 0, 0, 1, 1,
-1.334833, -1.146384, -1.499958, 1, 0, 0, 1, 1,
-1.328496, 1.481136, -2.30548, 1, 0, 0, 1, 1,
-1.327386, -0.1950656, -0.4532831, 1, 0, 0, 1, 1,
-1.325915, -1.546408, -1.259257, 0, 0, 0, 1, 1,
-1.315421, 0.9218782, -0.6847371, 0, 0, 0, 1, 1,
-1.313026, -0.2506569, -1.057033, 0, 0, 0, 1, 1,
-1.310559, 0.2591095, -0.4068533, 0, 0, 0, 1, 1,
-1.306756, -0.0294405, -0.7769102, 0, 0, 0, 1, 1,
-1.302973, 0.02166039, -1.898698, 0, 0, 0, 1, 1,
-1.296023, 0.2678719, -1.193302, 0, 0, 0, 1, 1,
-1.292475, -0.7145381, -1.601276, 1, 1, 1, 1, 1,
-1.282412, 0.2801658, -0.7916374, 1, 1, 1, 1, 1,
-1.271298, 0.6759375, -0.5253196, 1, 1, 1, 1, 1,
-1.258559, 0.9945491, -1.031811, 1, 1, 1, 1, 1,
-1.256167, -0.6206704, -2.332701, 1, 1, 1, 1, 1,
-1.249187, 0.1403301, -1.237351, 1, 1, 1, 1, 1,
-1.245997, 1.454996, -2.041823, 1, 1, 1, 1, 1,
-1.242612, 0.9140539, -2.016659, 1, 1, 1, 1, 1,
-1.238179, -1.926915, -2.226557, 1, 1, 1, 1, 1,
-1.216957, -1.42151, -2.667, 1, 1, 1, 1, 1,
-1.211061, 0.01419403, -2.141939, 1, 1, 1, 1, 1,
-1.210982, -0.2826452, -1.628681, 1, 1, 1, 1, 1,
-1.198341, 0.4787329, -0.1801948, 1, 1, 1, 1, 1,
-1.195692, -0.05062335, -0.9484708, 1, 1, 1, 1, 1,
-1.184951, 0.02882618, -1.323418, 1, 1, 1, 1, 1,
-1.168549, -0.6388826, -2.611311, 0, 0, 1, 1, 1,
-1.167897, -0.09739411, -0.6220542, 1, 0, 0, 1, 1,
-1.164129, -0.3765501, -2.69282, 1, 0, 0, 1, 1,
-1.151973, -0.4160148, -1.531563, 1, 0, 0, 1, 1,
-1.1434, -0.3571393, -1.125475, 1, 0, 0, 1, 1,
-1.142795, 0.7021151, -0.8828121, 1, 0, 0, 1, 1,
-1.13109, 0.8948134, -0.7782655, 0, 0, 0, 1, 1,
-1.128662, -0.2687853, -1.215888, 0, 0, 0, 1, 1,
-1.128394, 0.3936068, -0.7783322, 0, 0, 0, 1, 1,
-1.128332, -0.7652386, -1.620684, 0, 0, 0, 1, 1,
-1.120007, 0.4033178, -1.783324, 0, 0, 0, 1, 1,
-1.116101, 1.43332, 0.3278727, 0, 0, 0, 1, 1,
-1.11494, -1.964767, -1.342593, 0, 0, 0, 1, 1,
-1.112573, 0.311541, -0.6620951, 1, 1, 1, 1, 1,
-1.090377, -1.284994, -4.197562, 1, 1, 1, 1, 1,
-1.086465, -0.4237458, -3.289324, 1, 1, 1, 1, 1,
-1.085623, 0.3762774, -1.789777, 1, 1, 1, 1, 1,
-1.08459, -0.01965296, -1.141984, 1, 1, 1, 1, 1,
-1.078381, -0.4527002, -2.273728, 1, 1, 1, 1, 1,
-1.076121, 0.7600076, -0.3331443, 1, 1, 1, 1, 1,
-1.070995, 0.8045711, -1.474252, 1, 1, 1, 1, 1,
-1.057769, -0.8079528, -1.00119, 1, 1, 1, 1, 1,
-1.051525, -1.76794, -3.155683, 1, 1, 1, 1, 1,
-1.05087, 2.171215, -0.8163779, 1, 1, 1, 1, 1,
-1.049714, 0.03695516, -2.51485, 1, 1, 1, 1, 1,
-1.044894, 1.167019, 0.2093999, 1, 1, 1, 1, 1,
-1.04233, -0.2160956, -0.7801763, 1, 1, 1, 1, 1,
-1.036345, 1.794244, 1.189126, 1, 1, 1, 1, 1,
-1.036025, 0.1958067, -1.467326, 0, 0, 1, 1, 1,
-1.033762, 1.808116, 0.5816105, 1, 0, 0, 1, 1,
-1.031007, -0.8125188, 1.219182, 1, 0, 0, 1, 1,
-1.020497, -1.900779, -1.91941, 1, 0, 0, 1, 1,
-1.019315, -0.07570479, -2.624785, 1, 0, 0, 1, 1,
-1.008064, 2.775997, -0.691264, 1, 0, 0, 1, 1,
-1.003098, 0.4973637, -0.8833104, 0, 0, 0, 1, 1,
-0.9999497, -0.2084965, -1.344472, 0, 0, 0, 1, 1,
-0.9930118, -0.5914468, -2.810499, 0, 0, 0, 1, 1,
-0.9889826, 0.259058, -1.158689, 0, 0, 0, 1, 1,
-0.982617, 0.4607902, -0.669039, 0, 0, 0, 1, 1,
-0.981895, 0.11917, 0.04174263, 0, 0, 0, 1, 1,
-0.979969, -1.390971, -1.773979, 0, 0, 0, 1, 1,
-0.9798142, 0.2306519, -2.6797, 1, 1, 1, 1, 1,
-0.9796089, 0.9856258, -1.895571, 1, 1, 1, 1, 1,
-0.9771622, 0.8056235, -0.2975628, 1, 1, 1, 1, 1,
-0.9533283, -0.8610459, -2.371562, 1, 1, 1, 1, 1,
-0.9479814, 0.09196421, -1.388878, 1, 1, 1, 1, 1,
-0.9410964, 1.091132, -1.119429, 1, 1, 1, 1, 1,
-0.940643, 0.3215418, -0.882625, 1, 1, 1, 1, 1,
-0.9401049, 0.4411455, -2.062494, 1, 1, 1, 1, 1,
-0.9377739, -1.740454, -4.543183, 1, 1, 1, 1, 1,
-0.932641, -0.03690134, 0.1646854, 1, 1, 1, 1, 1,
-0.9319924, 1.061135, -1.229833, 1, 1, 1, 1, 1,
-0.926703, 0.2815785, -1.569806, 1, 1, 1, 1, 1,
-0.9232293, 0.202214, -0.4594855, 1, 1, 1, 1, 1,
-0.9222855, -0.6857324, -2.415903, 1, 1, 1, 1, 1,
-0.9160396, 0.2508864, -2.056005, 1, 1, 1, 1, 1,
-0.9044578, 0.5483946, -0.5064169, 0, 0, 1, 1, 1,
-0.8989694, 1.792739, -0.9399555, 1, 0, 0, 1, 1,
-0.8970625, 1.897005, -0.1339409, 1, 0, 0, 1, 1,
-0.8930887, 0.6660038, -1.213756, 1, 0, 0, 1, 1,
-0.8908735, 0.2543746, -1.034795, 1, 0, 0, 1, 1,
-0.8900807, -0.2129475, -1.769953, 1, 0, 0, 1, 1,
-0.8846125, 0.6152133, 1.011375, 0, 0, 0, 1, 1,
-0.8801549, -2.351967, -2.617407, 0, 0, 0, 1, 1,
-0.8794687, -0.9648165, -3.064569, 0, 0, 0, 1, 1,
-0.8753712, 1.191419, -0.8500154, 0, 0, 0, 1, 1,
-0.8715141, -0.8322999, -2.185912, 0, 0, 0, 1, 1,
-0.8692797, -2.278641, -0.8729802, 0, 0, 0, 1, 1,
-0.8651733, -1.478965, -3.736475, 0, 0, 0, 1, 1,
-0.8628573, 0.933161, -1.720941, 1, 1, 1, 1, 1,
-0.8540124, -0.3964044, -1.281532, 1, 1, 1, 1, 1,
-0.8505014, -0.9402713, -3.447672, 1, 1, 1, 1, 1,
-0.8484854, -0.1822789, -1.404657, 1, 1, 1, 1, 1,
-0.847636, 0.8807912, -1.247599, 1, 1, 1, 1, 1,
-0.8445152, 1.642819, 1.186406, 1, 1, 1, 1, 1,
-0.8399785, 1.690871, -0.3551157, 1, 1, 1, 1, 1,
-0.8366958, 0.4399825, -2.044048, 1, 1, 1, 1, 1,
-0.8334451, 0.7236404, 0.3136175, 1, 1, 1, 1, 1,
-0.833402, 0.902549, -0.6216934, 1, 1, 1, 1, 1,
-0.8303353, -0.05373056, -0.6829863, 1, 1, 1, 1, 1,
-0.8275051, -2.711163, -1.132861, 1, 1, 1, 1, 1,
-0.8224103, 0.9377934, -1.329267, 1, 1, 1, 1, 1,
-0.8164526, -0.3714437, -2.529705, 1, 1, 1, 1, 1,
-0.8113333, 0.6666074, 1.571805, 1, 1, 1, 1, 1,
-0.8033299, 0.46247, -0.9134246, 0, 0, 1, 1, 1,
-0.8001046, -0.6529207, -1.566018, 1, 0, 0, 1, 1,
-0.7974811, -0.2438868, -0.7086992, 1, 0, 0, 1, 1,
-0.7810217, -0.194059, -2.111815, 1, 0, 0, 1, 1,
-0.7802945, -0.2295777, -3.190078, 1, 0, 0, 1, 1,
-0.7791251, -1.337757, 0.1904492, 1, 0, 0, 1, 1,
-0.7771363, -1.802923, -3.44264, 0, 0, 0, 1, 1,
-0.7714155, -0.4201953, -1.86271, 0, 0, 0, 1, 1,
-0.7675015, 0.5560711, 0.3890564, 0, 0, 0, 1, 1,
-0.7673044, 0.9094589, 0.6086888, 0, 0, 0, 1, 1,
-0.7641436, 0.7730701, -0.6917413, 0, 0, 0, 1, 1,
-0.7640032, -1.049448, -1.125789, 0, 0, 0, 1, 1,
-0.760102, 1.113268, -1.201371, 0, 0, 0, 1, 1,
-0.758498, 0.6865653, -0.7243444, 1, 1, 1, 1, 1,
-0.7545557, 0.1453926, -1.000031, 1, 1, 1, 1, 1,
-0.7407346, 0.2346959, -0.345025, 1, 1, 1, 1, 1,
-0.7401298, -1.056783, -3.38699, 1, 1, 1, 1, 1,
-0.736621, 0.2017556, -1.47056, 1, 1, 1, 1, 1,
-0.7364238, 0.01415745, -3.143079, 1, 1, 1, 1, 1,
-0.7356908, 0.4726507, -1.380368, 1, 1, 1, 1, 1,
-0.7223876, 1.395554, -0.8012259, 1, 1, 1, 1, 1,
-0.7121524, 0.9934182, -0.2915043, 1, 1, 1, 1, 1,
-0.7065852, 1.696355, 0.6058533, 1, 1, 1, 1, 1,
-0.7057322, 0.6706077, 0.5889789, 1, 1, 1, 1, 1,
-0.700454, 0.4265889, -0.06907947, 1, 1, 1, 1, 1,
-0.7002595, 0.8888532, -2.386528, 1, 1, 1, 1, 1,
-0.6886264, -0.6384757, -2.554435, 1, 1, 1, 1, 1,
-0.6860365, -1.118686, -1.368798, 1, 1, 1, 1, 1,
-0.6795531, -0.05699445, -3.122231, 0, 0, 1, 1, 1,
-0.6727984, -0.01847488, 0.4154416, 1, 0, 0, 1, 1,
-0.6669989, -0.5680678, -2.350316, 1, 0, 0, 1, 1,
-0.6605385, 0.5834433, -0.9965015, 1, 0, 0, 1, 1,
-0.6551388, -0.9026306, -1.952274, 1, 0, 0, 1, 1,
-0.6545414, -0.2497358, -1.888699, 1, 0, 0, 1, 1,
-0.6435018, -0.9925135, -3.565828, 0, 0, 0, 1, 1,
-0.6414416, 0.9141392, -0.2307776, 0, 0, 0, 1, 1,
-0.6406435, 1.361816, -0.8233973, 0, 0, 0, 1, 1,
-0.6368334, 1.122338, -0.4190187, 0, 0, 0, 1, 1,
-0.6332802, 0.7813542, -2.909411, 0, 0, 0, 1, 1,
-0.6283411, -2.581237, -2.735776, 0, 0, 0, 1, 1,
-0.6277874, 0.6632217, -0.3133051, 0, 0, 0, 1, 1,
-0.6266443, -0.1308737, -1.99126, 1, 1, 1, 1, 1,
-0.6255968, -0.72899, -3.653028, 1, 1, 1, 1, 1,
-0.6249395, 2.484931, -0.2059011, 1, 1, 1, 1, 1,
-0.6212522, 0.09807456, -3.223964, 1, 1, 1, 1, 1,
-0.6206408, -1.219082, -2.370965, 1, 1, 1, 1, 1,
-0.6191188, 1.261136, -1.714254, 1, 1, 1, 1, 1,
-0.6163028, 0.9043029, -0.8298033, 1, 1, 1, 1, 1,
-0.6142913, -1.056817, -1.854777, 1, 1, 1, 1, 1,
-0.6071973, -0.07551366, -1.819929, 1, 1, 1, 1, 1,
-0.6069541, 0.1078931, -1.34752, 1, 1, 1, 1, 1,
-0.6049498, 0.6744586, -1.06909, 1, 1, 1, 1, 1,
-0.6047978, 0.7592229, -2.04989, 1, 1, 1, 1, 1,
-0.6045235, -0.2412233, -3.522839, 1, 1, 1, 1, 1,
-0.6009026, -2.270141, -1.963849, 1, 1, 1, 1, 1,
-0.5989941, 1.135812, 0.1968042, 1, 1, 1, 1, 1,
-0.5974115, -1.718789, -0.8543761, 0, 0, 1, 1, 1,
-0.5946425, -2.515173, -1.992242, 1, 0, 0, 1, 1,
-0.5932082, -2.226644, -2.224911, 1, 0, 0, 1, 1,
-0.5908715, -1.940166, -1.792383, 1, 0, 0, 1, 1,
-0.5864006, 0.07895708, -2.032919, 1, 0, 0, 1, 1,
-0.5839875, -0.8942016, -0.9441372, 1, 0, 0, 1, 1,
-0.5753843, -0.5178823, -1.692171, 0, 0, 0, 1, 1,
-0.5649527, 0.5204495, -0.6079137, 0, 0, 0, 1, 1,
-0.5606593, 1.075596, -2.757017, 0, 0, 0, 1, 1,
-0.5599338, -0.9146934, -4.18889, 0, 0, 0, 1, 1,
-0.5599132, -0.4437297, -2.303108, 0, 0, 0, 1, 1,
-0.5568913, 2.349146, -0.9447151, 0, 0, 0, 1, 1,
-0.5555255, 1.012679, -0.4425212, 0, 0, 0, 1, 1,
-0.5536678, 0.3704273, -1.056494, 1, 1, 1, 1, 1,
-0.5517005, -1.681754, -3.71694, 1, 1, 1, 1, 1,
-0.5493998, 1.016575, -1.140417, 1, 1, 1, 1, 1,
-0.5481545, -0.8323519, -4.422671, 1, 1, 1, 1, 1,
-0.5460705, -0.2690984, -1.698683, 1, 1, 1, 1, 1,
-0.5407063, -0.4887829, -2.11297, 1, 1, 1, 1, 1,
-0.5372887, -0.3393506, -2.733972, 1, 1, 1, 1, 1,
-0.5361603, 0.6930841, -0.7975275, 1, 1, 1, 1, 1,
-0.5269433, 0.5576496, -0.4142186, 1, 1, 1, 1, 1,
-0.5259295, 1.386608, -2.527102, 1, 1, 1, 1, 1,
-0.5227945, -1.244845, -1.990931, 1, 1, 1, 1, 1,
-0.5224122, 0.458402, 0.2188682, 1, 1, 1, 1, 1,
-0.5184832, 0.6403372, 0.9294409, 1, 1, 1, 1, 1,
-0.5157124, -0.9412036, -3.309748, 1, 1, 1, 1, 1,
-0.5093014, -0.7473578, -3.688418, 1, 1, 1, 1, 1,
-0.5091447, -1.185123, -2.709736, 0, 0, 1, 1, 1,
-0.5044587, -0.3432811, -2.146511, 1, 0, 0, 1, 1,
-0.5013562, -1.74766, -4.628313, 1, 0, 0, 1, 1,
-0.5012429, 1.745609, -0.9787285, 1, 0, 0, 1, 1,
-0.5010466, 0.3048811, -0.3082126, 1, 0, 0, 1, 1,
-0.4961812, 0.715147, 0.1138923, 1, 0, 0, 1, 1,
-0.495297, -0.03697496, -2.381831, 0, 0, 0, 1, 1,
-0.4927311, 0.1299142, -1.075471, 0, 0, 0, 1, 1,
-0.4916914, -1.340715, -1.736388, 0, 0, 0, 1, 1,
-0.4887628, 0.2461648, -2.487461, 0, 0, 0, 1, 1,
-0.48646, 0.261841, -2.017746, 0, 0, 0, 1, 1,
-0.4732015, 0.3876984, -0.6549515, 0, 0, 0, 1, 1,
-0.4710777, -1.138489, -3.315313, 0, 0, 0, 1, 1,
-0.4696737, -0.02149313, -2.996408, 1, 1, 1, 1, 1,
-0.4664489, 1.140369, 1.039581, 1, 1, 1, 1, 1,
-0.4642932, -1.639547, -3.128298, 1, 1, 1, 1, 1,
-0.4590651, 1.026037, -0.7986962, 1, 1, 1, 1, 1,
-0.4580515, -0.0942342, -3.186106, 1, 1, 1, 1, 1,
-0.4520902, 1.617657, 1.182786, 1, 1, 1, 1, 1,
-0.4514444, -0.1885232, -1.10419, 1, 1, 1, 1, 1,
-0.4481069, -1.068578, -2.16823, 1, 1, 1, 1, 1,
-0.4473435, 1.372303, 0.985088, 1, 1, 1, 1, 1,
-0.4471564, -0.467646, -0.4027987, 1, 1, 1, 1, 1,
-0.4423396, -0.6910135, -4.186619, 1, 1, 1, 1, 1,
-0.4423374, -0.5786871, -2.974846, 1, 1, 1, 1, 1,
-0.4413202, 0.2999685, -1.753233, 1, 1, 1, 1, 1,
-0.4370729, 0.811665, 0.3548842, 1, 1, 1, 1, 1,
-0.4351245, 0.4204588, -1.855498, 1, 1, 1, 1, 1,
-0.435087, 2.005682, 0.3922995, 0, 0, 1, 1, 1,
-0.4295784, 0.3560121, -0.2922436, 1, 0, 0, 1, 1,
-0.4286847, 0.6340024, -1.002694, 1, 0, 0, 1, 1,
-0.4275149, -1.023957, -2.352388, 1, 0, 0, 1, 1,
-0.4258566, -1.358505, -1.923852, 1, 0, 0, 1, 1,
-0.4242494, -0.7267278, -2.144903, 1, 0, 0, 1, 1,
-0.4187215, 2.190927, 0.2810057, 0, 0, 0, 1, 1,
-0.4184369, 0.2707899, -1.479595, 0, 0, 0, 1, 1,
-0.4174204, -1.572119, -4.661952, 0, 0, 0, 1, 1,
-0.4145, -1.037719, -2.119651, 0, 0, 0, 1, 1,
-0.4098493, 0.7464684, -0.6580221, 0, 0, 0, 1, 1,
-0.4070424, 0.620969, -2.508435, 0, 0, 0, 1, 1,
-0.4032175, 0.07748163, -0.900584, 0, 0, 0, 1, 1,
-0.401158, -0.8540488, -3.250471, 1, 1, 1, 1, 1,
-0.3986989, -0.3819294, -3.138756, 1, 1, 1, 1, 1,
-0.398207, -0.4650102, -1.779073, 1, 1, 1, 1, 1,
-0.3975002, 0.7783523, -0.9987561, 1, 1, 1, 1, 1,
-0.3972377, -0.5465656, -1.712162, 1, 1, 1, 1, 1,
-0.3894452, -1.041453, -2.287706, 1, 1, 1, 1, 1,
-0.3817806, -0.5130376, -1.718329, 1, 1, 1, 1, 1,
-0.36837, 1.86638, -0.4013177, 1, 1, 1, 1, 1,
-0.3647322, -0.8105012, -1.930032, 1, 1, 1, 1, 1,
-0.3644946, -0.8971021, -2.487158, 1, 1, 1, 1, 1,
-0.3625839, -0.1428772, -1.556588, 1, 1, 1, 1, 1,
-0.3606517, 0.3996974, 0.1145286, 1, 1, 1, 1, 1,
-0.3577721, 0.4547943, -0.8963945, 1, 1, 1, 1, 1,
-0.3541487, 1.655077, -1.38032, 1, 1, 1, 1, 1,
-0.3539639, 0.02186095, -2.292483, 1, 1, 1, 1, 1,
-0.3497894, 1.4064, -0.1983178, 0, 0, 1, 1, 1,
-0.3497767, -0.1261958, 0.2537067, 1, 0, 0, 1, 1,
-0.3488642, 2.323385, -0.6604148, 1, 0, 0, 1, 1,
-0.3476541, -0.5743544, -2.738086, 1, 0, 0, 1, 1,
-0.3469553, 0.0982741, -2.941926, 1, 0, 0, 1, 1,
-0.342723, -1.101177, -1.997772, 1, 0, 0, 1, 1,
-0.3424481, -2.353622, -2.537492, 0, 0, 0, 1, 1,
-0.3394437, -0.9784452, -1.577942, 0, 0, 0, 1, 1,
-0.3374691, 1.805618, -0.7747837, 0, 0, 0, 1, 1,
-0.3287028, -0.2707535, -3.162233, 0, 0, 0, 1, 1,
-0.3233797, -1.843249, -3.223175, 0, 0, 0, 1, 1,
-0.310727, 1.904618, 0.4688959, 0, 0, 0, 1, 1,
-0.3089107, 0.8664551, 0.4260988, 0, 0, 0, 1, 1,
-0.3042769, -0.4013191, -3.014521, 1, 1, 1, 1, 1,
-0.3038179, 1.260405, -1.885751, 1, 1, 1, 1, 1,
-0.2991573, 0.5549566, -0.3370977, 1, 1, 1, 1, 1,
-0.2988574, 0.4674333, -2.232091, 1, 1, 1, 1, 1,
-0.2985906, -0.7574355, -1.495267, 1, 1, 1, 1, 1,
-0.2985173, -0.835395, -2.626243, 1, 1, 1, 1, 1,
-0.297636, 0.1191398, -0.3774301, 1, 1, 1, 1, 1,
-0.292946, 0.6013556, -0.06932858, 1, 1, 1, 1, 1,
-0.2920807, 0.8027164, 0.31699, 1, 1, 1, 1, 1,
-0.2850212, -0.9016596, -1.705373, 1, 1, 1, 1, 1,
-0.2821215, -0.1194486, -1.423367, 1, 1, 1, 1, 1,
-0.278774, 2.9021, 0.8077503, 1, 1, 1, 1, 1,
-0.2647693, -1.436607, -3.324201, 1, 1, 1, 1, 1,
-0.2591295, 0.7977915, -1.017225, 1, 1, 1, 1, 1,
-0.2583231, 0.2079794, -0.3986574, 1, 1, 1, 1, 1,
-0.2526466, 0.104732, -1.47543, 0, 0, 1, 1, 1,
-0.2521575, 0.1291044, -0.2761657, 1, 0, 0, 1, 1,
-0.2514384, -0.6528018, -1.992114, 1, 0, 0, 1, 1,
-0.2493757, 0.2444339, -0.2861957, 1, 0, 0, 1, 1,
-0.2468175, -0.2630645, -4.833613, 1, 0, 0, 1, 1,
-0.2461957, -0.7407438, -3.014552, 1, 0, 0, 1, 1,
-0.2457941, 0.6569896, -0.250711, 0, 0, 0, 1, 1,
-0.2432301, 0.6948206, 0.1739665, 0, 0, 0, 1, 1,
-0.2347298, -0.5358938, -3.175585, 0, 0, 0, 1, 1,
-0.2339315, 2.849763, -1.17895, 0, 0, 0, 1, 1,
-0.2305261, -0.7403197, -2.312362, 0, 0, 0, 1, 1,
-0.2287104, 0.2074566, -0.369109, 0, 0, 0, 1, 1,
-0.224363, 0.005671511, -1.252609, 0, 0, 0, 1, 1,
-0.2233075, -0.2160436, -2.509442, 1, 1, 1, 1, 1,
-0.2123333, -0.7643065, -2.963312, 1, 1, 1, 1, 1,
-0.2115729, 1.731068, 0.8086756, 1, 1, 1, 1, 1,
-0.2093299, -1.426746, -2.090799, 1, 1, 1, 1, 1,
-0.2059236, -0.5620597, -2.851627, 1, 1, 1, 1, 1,
-0.1984929, 1.297514, -0.6296099, 1, 1, 1, 1, 1,
-0.1961684, 1.212818, -1.094935, 1, 1, 1, 1, 1,
-0.1947632, 1.552435, -0.5902508, 1, 1, 1, 1, 1,
-0.1877451, -2.198236, -3.785723, 1, 1, 1, 1, 1,
-0.1833065, -2.152485, -4.93867, 1, 1, 1, 1, 1,
-0.1823499, -0.7019504, -2.915852, 1, 1, 1, 1, 1,
-0.1821915, 0.9956312, -0.7759162, 1, 1, 1, 1, 1,
-0.1812618, 0.7714878, 0.7994632, 1, 1, 1, 1, 1,
-0.1803318, -1.458547, -2.760237, 1, 1, 1, 1, 1,
-0.1752959, -0.3929259, -1.75608, 1, 1, 1, 1, 1,
-0.1713814, -0.6671683, -3.215869, 0, 0, 1, 1, 1,
-0.1685407, 1.009519, -1.090465, 1, 0, 0, 1, 1,
-0.1654124, 1.341446, -0.3319394, 1, 0, 0, 1, 1,
-0.1604248, -0.3376166, -4.072638, 1, 0, 0, 1, 1,
-0.1544413, -0.2616756, -1.296529, 1, 0, 0, 1, 1,
-0.1482398, 0.8375731, -1.171194, 1, 0, 0, 1, 1,
-0.1446011, 0.3929667, 0.7295319, 0, 0, 0, 1, 1,
-0.1438014, -1.105989, -1.178341, 0, 0, 0, 1, 1,
-0.1428195, -0.7116238, -4.080315, 0, 0, 0, 1, 1,
-0.1422159, 0.2536855, 1.176976, 0, 0, 0, 1, 1,
-0.1388744, -0.04434818, -2.095814, 0, 0, 0, 1, 1,
-0.1371265, -0.6543269, -4.476161, 0, 0, 0, 1, 1,
-0.1347286, -0.512419, -3.592276, 0, 0, 0, 1, 1,
-0.1318298, 1.421881, -0.4494443, 1, 1, 1, 1, 1,
-0.1313134, -1.091112, -3.570765, 1, 1, 1, 1, 1,
-0.1296438, -0.1752536, -1.158649, 1, 1, 1, 1, 1,
-0.1234199, -0.4216901, -4.525857, 1, 1, 1, 1, 1,
-0.1184765, 0.8700262, -1.390993, 1, 1, 1, 1, 1,
-0.1159209, 0.5477082, -1.477718, 1, 1, 1, 1, 1,
-0.1140402, 0.08284555, -1.524421, 1, 1, 1, 1, 1,
-0.1117, 0.663644, -0.9781814, 1, 1, 1, 1, 1,
-0.1114494, -0.4745317, -2.971694, 1, 1, 1, 1, 1,
-0.1038275, -1.259707, -2.603327, 1, 1, 1, 1, 1,
-0.09668907, -0.1178604, -1.160823, 1, 1, 1, 1, 1,
-0.09528031, 1.975106, -1.223641, 1, 1, 1, 1, 1,
-0.08734038, -0.4834673, -3.146109, 1, 1, 1, 1, 1,
-0.08275997, -1.321045, -3.959626, 1, 1, 1, 1, 1,
-0.08032145, -0.2679539, -3.699558, 1, 1, 1, 1, 1,
-0.07663734, 0.9495209, 0.5761793, 0, 0, 1, 1, 1,
-0.07088416, -0.5498178, -4.215271, 1, 0, 0, 1, 1,
-0.0696339, 0.5186638, 0.9135759, 1, 0, 0, 1, 1,
-0.05926789, 0.1903472, -0.6374314, 1, 0, 0, 1, 1,
-0.0546449, -0.9669901, -2.700903, 1, 0, 0, 1, 1,
-0.0532507, -0.6545417, -3.033236, 1, 0, 0, 1, 1,
-0.0527285, 0.03785489, -0.7571526, 0, 0, 0, 1, 1,
-0.05033622, 0.5772103, -0.7561814, 0, 0, 0, 1, 1,
-0.04907452, -0.07354149, -3.401807, 0, 0, 0, 1, 1,
-0.04529722, 0.134043, 0.6702364, 0, 0, 0, 1, 1,
-0.04529489, 0.114457, -0.5607641, 0, 0, 0, 1, 1,
-0.04387038, -0.7434089, -2.466964, 0, 0, 0, 1, 1,
-0.04108923, 0.9620631, -0.4004565, 0, 0, 0, 1, 1,
-0.03399624, -0.4305926, -4.992918, 1, 1, 1, 1, 1,
-0.03100319, 0.2657403, -0.6610504, 1, 1, 1, 1, 1,
-0.0266197, 1.12617, 0.9973637, 1, 1, 1, 1, 1,
-0.02546277, -0.8334594, -3.228885, 1, 1, 1, 1, 1,
-0.02515988, 1.567115, -2.141565, 1, 1, 1, 1, 1,
-0.02490675, -0.9570692, -3.789241, 1, 1, 1, 1, 1,
-0.02282227, -0.2998772, -4.720585, 1, 1, 1, 1, 1,
-0.02211556, 0.900859, -1.141078, 1, 1, 1, 1, 1,
-0.02181861, 0.909561, 0.5786038, 1, 1, 1, 1, 1,
-0.02131878, -0.6024054, -5.087645, 1, 1, 1, 1, 1,
-0.01280095, 1.426006, -0.5613385, 1, 1, 1, 1, 1,
-0.01248502, -0.1443748, -2.252535, 1, 1, 1, 1, 1,
-0.01057474, 0.06285247, 0.7333286, 1, 1, 1, 1, 1,
-0.002831898, 1.040964, -0.1105193, 1, 1, 1, 1, 1,
0.0004005731, 0.1845959, -0.3743952, 1, 1, 1, 1, 1,
0.004301996, -1.639254, 2.429326, 0, 0, 1, 1, 1,
0.008245359, 0.8899088, -0.1170364, 1, 0, 0, 1, 1,
0.01062447, 0.3912717, 1.108075, 1, 0, 0, 1, 1,
0.0129312, -1.082521, 2.906081, 1, 0, 0, 1, 1,
0.01464477, 0.1879016, 1.993283, 1, 0, 0, 1, 1,
0.01744387, -1.072986, 2.664882, 1, 0, 0, 1, 1,
0.02022332, -0.8999535, 2.69818, 0, 0, 0, 1, 1,
0.02461573, -1.532904, 3.379348, 0, 0, 0, 1, 1,
0.02515102, -1.157418, 2.610673, 0, 0, 0, 1, 1,
0.02582729, -0.00270355, 2.29145, 0, 0, 0, 1, 1,
0.02637179, -0.7544255, 3.684502, 0, 0, 0, 1, 1,
0.02850321, 0.7425517, -0.6923486, 0, 0, 0, 1, 1,
0.03123575, -1.055368, 3.102511, 0, 0, 0, 1, 1,
0.03544542, -0.5887555, 4.946983, 1, 1, 1, 1, 1,
0.03581436, 0.8259511, -0.1395803, 1, 1, 1, 1, 1,
0.03684953, -2.109087, 2.026423, 1, 1, 1, 1, 1,
0.03787482, -0.6381755, 2.538056, 1, 1, 1, 1, 1,
0.0393064, 0.5430322, -1.13596, 1, 1, 1, 1, 1,
0.03988682, -2.790536, 3.696019, 1, 1, 1, 1, 1,
0.04295238, -0.3588608, 0.9241256, 1, 1, 1, 1, 1,
0.04541857, 0.5640115, -1.103221, 1, 1, 1, 1, 1,
0.04722516, -1.389286, 2.424245, 1, 1, 1, 1, 1,
0.05269981, 0.4452564, -0.3279471, 1, 1, 1, 1, 1,
0.05510804, -0.1921238, 4.19361, 1, 1, 1, 1, 1,
0.05617817, 1.231501, 0.7022582, 1, 1, 1, 1, 1,
0.05702884, 1.756337, -0.3540315, 1, 1, 1, 1, 1,
0.05867664, 1.33679, -0.519581, 1, 1, 1, 1, 1,
0.06363277, 0.5955005, -1.153367, 1, 1, 1, 1, 1,
0.06389689, 1.326796, -1.00743, 0, 0, 1, 1, 1,
0.06702074, 0.272733, 0.4934219, 1, 0, 0, 1, 1,
0.0701684, -0.9358073, 2.711376, 1, 0, 0, 1, 1,
0.07160413, -0.3729526, 3.64047, 1, 0, 0, 1, 1,
0.07217028, -0.5448641, 3.50019, 1, 0, 0, 1, 1,
0.07412936, -0.2631316, 1.610286, 1, 0, 0, 1, 1,
0.0746004, 0.2200279, 0.1174777, 0, 0, 0, 1, 1,
0.07729594, -0.6726722, 3.010571, 0, 0, 0, 1, 1,
0.07828846, -0.3105686, 1.532137, 0, 0, 0, 1, 1,
0.08117238, 0.00547835, 1.529948, 0, 0, 0, 1, 1,
0.08222933, 0.2530378, -0.1371641, 0, 0, 0, 1, 1,
0.08317868, 0.4103536, 1.694608, 0, 0, 0, 1, 1,
0.083299, 2.174142, -0.4737356, 0, 0, 0, 1, 1,
0.0846822, -0.8228827, 4.432571, 1, 1, 1, 1, 1,
0.08602674, 0.5104682, 0.1106764, 1, 1, 1, 1, 1,
0.08645909, -0.3686314, 2.577041, 1, 1, 1, 1, 1,
0.09441275, 0.2768298, -0.1307896, 1, 1, 1, 1, 1,
0.09968271, -1.743503, 4.984309, 1, 1, 1, 1, 1,
0.1017913, 1.172416, 0.9470409, 1, 1, 1, 1, 1,
0.1025761, 1.023878, -0.04249446, 1, 1, 1, 1, 1,
0.1036881, 0.7483864, 1.157914, 1, 1, 1, 1, 1,
0.1054972, -0.3241985, 3.499839, 1, 1, 1, 1, 1,
0.108287, -2.325819, 3.743541, 1, 1, 1, 1, 1,
0.1092775, 0.612541, -1.104005, 1, 1, 1, 1, 1,
0.1099287, 0.483897, 1.918872, 1, 1, 1, 1, 1,
0.1104365, 0.2887085, 1.33158, 1, 1, 1, 1, 1,
0.1155941, 0.6779855, -0.442334, 1, 1, 1, 1, 1,
0.1184865, -1.438984, 2.566736, 1, 1, 1, 1, 1,
0.1259976, -0.4872026, 2.347903, 0, 0, 1, 1, 1,
0.1286307, 1.390171, 1.289255, 1, 0, 0, 1, 1,
0.1294741, -1.514551, 2.62033, 1, 0, 0, 1, 1,
0.1341181, 0.4436976, -0.8521982, 1, 0, 0, 1, 1,
0.1375654, 0.9920877, -0.2522484, 1, 0, 0, 1, 1,
0.1386888, -0.7628199, 0.8927239, 1, 0, 0, 1, 1,
0.1388585, 0.5643092, 0.2111599, 0, 0, 0, 1, 1,
0.1421717, 0.672988, 2.206928, 0, 0, 0, 1, 1,
0.1438065, -0.8865502, 3.374145, 0, 0, 0, 1, 1,
0.144178, -0.8144844, 1.943897, 0, 0, 0, 1, 1,
0.1452557, -1.268729, 3.00818, 0, 0, 0, 1, 1,
0.147113, -0.5078101, 2.526355, 0, 0, 0, 1, 1,
0.1477468, 1.000113, -0.5786043, 0, 0, 0, 1, 1,
0.1531414, 1.124932, 2.767172, 1, 1, 1, 1, 1,
0.1543913, 1.495739, -0.2251749, 1, 1, 1, 1, 1,
0.1574299, -0.9927945, 1.858351, 1, 1, 1, 1, 1,
0.1616606, 1.161994, 0.3050878, 1, 1, 1, 1, 1,
0.1623122, 0.9629338, 1.222597, 1, 1, 1, 1, 1,
0.164386, -2.010087, 4.251156, 1, 1, 1, 1, 1,
0.1649929, 0.2999188, 1.027033, 1, 1, 1, 1, 1,
0.171129, 1.125371, 0.8474599, 1, 1, 1, 1, 1,
0.1736401, -1.05805, 4.390012, 1, 1, 1, 1, 1,
0.1741658, 1.171547, 1.966502, 1, 1, 1, 1, 1,
0.1773498, 1.485405, -0.7876155, 1, 1, 1, 1, 1,
0.1815713, -2.600382, 5.282944, 1, 1, 1, 1, 1,
0.1840242, 1.814156, 0.2024012, 1, 1, 1, 1, 1,
0.1849347, 0.7411446, -0.4292167, 1, 1, 1, 1, 1,
0.1867644, 0.0708712, 1.695877, 1, 1, 1, 1, 1,
0.1867965, -0.1804559, 3.621015, 0, 0, 1, 1, 1,
0.1993878, -0.7935581, 1.762282, 1, 0, 0, 1, 1,
0.1995654, -1.994071, 2.811593, 1, 0, 0, 1, 1,
0.2005663, -0.3145859, 1.967469, 1, 0, 0, 1, 1,
0.2012283, 1.430856, -0.4877949, 1, 0, 0, 1, 1,
0.2025163, 0.07164436, -0.7870386, 1, 0, 0, 1, 1,
0.2025738, 1.435293, -1.438127, 0, 0, 0, 1, 1,
0.2050643, -0.9616873, 3.350988, 0, 0, 0, 1, 1,
0.2058091, 0.7943574, 0.6568146, 0, 0, 0, 1, 1,
0.2107407, 0.1241594, 0.8775647, 0, 0, 0, 1, 1,
0.2180881, -1.886299, 3.384088, 0, 0, 0, 1, 1,
0.2193047, -1.704805, 3.816316, 0, 0, 0, 1, 1,
0.2236575, 1.17912, 0.3506284, 0, 0, 0, 1, 1,
0.2287855, 0.9521785, 0.2868803, 1, 1, 1, 1, 1,
0.2316388, -0.2229556, 1.385662, 1, 1, 1, 1, 1,
0.2322249, -1.291544, 2.454339, 1, 1, 1, 1, 1,
0.233325, 1.307842, 0.3005976, 1, 1, 1, 1, 1,
0.2364144, 0.635303, 1.295699, 1, 1, 1, 1, 1,
0.2369858, 0.520973, 0.05550113, 1, 1, 1, 1, 1,
0.2375989, -2.464959, 4.747038, 1, 1, 1, 1, 1,
0.241133, -1.495326, 3.721508, 1, 1, 1, 1, 1,
0.242187, -0.6918906, 2.032342, 1, 1, 1, 1, 1,
0.242543, -0.8187076, 1.011371, 1, 1, 1, 1, 1,
0.244602, -0.2988983, 1.12192, 1, 1, 1, 1, 1,
0.2447323, 1.020918, 0.5287924, 1, 1, 1, 1, 1,
0.2507004, 0.7818935, -1.9034, 1, 1, 1, 1, 1,
0.2596786, -1.763037, 1.965985, 1, 1, 1, 1, 1,
0.2602817, 0.8187387, 0.1976164, 1, 1, 1, 1, 1,
0.2658556, 0.07897197, 1.079108, 0, 0, 1, 1, 1,
0.2706478, 0.9324797, -0.6907337, 1, 0, 0, 1, 1,
0.2715239, 2.341172, -1.694462, 1, 0, 0, 1, 1,
0.2727371, -1.456525, 1.344743, 1, 0, 0, 1, 1,
0.2768678, 1.502983, 0.008791004, 1, 0, 0, 1, 1,
0.2802905, 0.3717508, 0.8059594, 1, 0, 0, 1, 1,
0.2870877, -0.02039892, -0.3295359, 0, 0, 0, 1, 1,
0.2915858, 0.7599044, -0.8072664, 0, 0, 0, 1, 1,
0.2944291, 0.6313218, 1.049335, 0, 0, 0, 1, 1,
0.2951971, 0.4849838, -0.2503705, 0, 0, 0, 1, 1,
0.2963207, 2.570343, 0.09335602, 0, 0, 0, 1, 1,
0.29811, -2.427272, 1.780722, 0, 0, 0, 1, 1,
0.3000034, -2.314706, 3.279726, 0, 0, 0, 1, 1,
0.3042484, 0.01964812, 0.9141153, 1, 1, 1, 1, 1,
0.3059381, 1.169853, 0.1690795, 1, 1, 1, 1, 1,
0.3083629, -0.2125357, 1.656955, 1, 1, 1, 1, 1,
0.3100068, -0.6332241, 1.350182, 1, 1, 1, 1, 1,
0.3122038, 2.234011, 1.452577, 1, 1, 1, 1, 1,
0.3131174, 0.838097, -0.6803243, 1, 1, 1, 1, 1,
0.320006, 0.896282, 0.7774324, 1, 1, 1, 1, 1,
0.3292317, -0.6379323, 3.124333, 1, 1, 1, 1, 1,
0.3306309, 0.4274168, 0.2386809, 1, 1, 1, 1, 1,
0.3315622, -0.3831857, 2.031862, 1, 1, 1, 1, 1,
0.3334387, 1.664985, -0.8294227, 1, 1, 1, 1, 1,
0.3384458, 0.2445221, 0.9564238, 1, 1, 1, 1, 1,
0.3408481, -1.446192, 3.014662, 1, 1, 1, 1, 1,
0.3428297, -0.8532504, 3.253936, 1, 1, 1, 1, 1,
0.3453626, -0.7885343, 3.6047, 1, 1, 1, 1, 1,
0.3457949, -2.165087, 1.09845, 0, 0, 1, 1, 1,
0.3492612, -1.168595, 2.541569, 1, 0, 0, 1, 1,
0.3601114, -1.474805, 3.297633, 1, 0, 0, 1, 1,
0.3607371, 1.154126, 0.8127471, 1, 0, 0, 1, 1,
0.3610865, 0.9081638, 0.01025929, 1, 0, 0, 1, 1,
0.3616113, 1.064325, -1.018856, 1, 0, 0, 1, 1,
0.3630248, 0.8383862, 0.1861413, 0, 0, 0, 1, 1,
0.3643726, 0.02675755, 1.270991, 0, 0, 0, 1, 1,
0.3680665, 1.309923, 0.5786248, 0, 0, 0, 1, 1,
0.3684859, 0.3093838, 0.2157508, 0, 0, 0, 1, 1,
0.368544, -1.046041, 2.942122, 0, 0, 0, 1, 1,
0.3722698, -0.6443142, 4.036892, 0, 0, 0, 1, 1,
0.3805853, -1.11772, 2.921962, 0, 0, 0, 1, 1,
0.381661, -1.54007, 3.575047, 1, 1, 1, 1, 1,
0.383535, 0.5298065, 0.5733012, 1, 1, 1, 1, 1,
0.3855529, -0.1300755, 1.62403, 1, 1, 1, 1, 1,
0.3869855, 0.782829, 1.127065, 1, 1, 1, 1, 1,
0.3878936, 1.596691, -0.1911561, 1, 1, 1, 1, 1,
0.3896534, 0.5031484, 0.8418052, 1, 1, 1, 1, 1,
0.3907357, 0.06739634, 1.499752, 1, 1, 1, 1, 1,
0.3915735, 1.265284, 0.8787661, 1, 1, 1, 1, 1,
0.3946364, -0.5275619, 1.058272, 1, 1, 1, 1, 1,
0.4029058, 1.392875, 0.3233257, 1, 1, 1, 1, 1,
0.4059827, 1.164604, 2.850522, 1, 1, 1, 1, 1,
0.4129005, 0.8561258, 1.393479, 1, 1, 1, 1, 1,
0.4195083, -1.07175, 3.555137, 1, 1, 1, 1, 1,
0.4235313, -0.4464854, 1.355381, 1, 1, 1, 1, 1,
0.4258602, 0.5437852, -1.176198, 1, 1, 1, 1, 1,
0.4320766, 0.4018839, 1.065278, 0, 0, 1, 1, 1,
0.4344217, 0.2461081, 1.231015, 1, 0, 0, 1, 1,
0.4345021, -1.665345, 2.68395, 1, 0, 0, 1, 1,
0.4362127, 0.5355791, 0.05830032, 1, 0, 0, 1, 1,
0.43829, 1.245793, 0.258056, 1, 0, 0, 1, 1,
0.4425958, 0.2996915, 1.981534, 1, 0, 0, 1, 1,
0.444135, -0.6390191, 1.241529, 0, 0, 0, 1, 1,
0.4452769, -1.30175, 2.064585, 0, 0, 0, 1, 1,
0.4454305, -0.7201818, 3.814213, 0, 0, 0, 1, 1,
0.4511413, 0.6300775, -0.0187305, 0, 0, 0, 1, 1,
0.4546795, -0.6809288, 3.017338, 0, 0, 0, 1, 1,
0.4605289, -0.951052, 3.0892, 0, 0, 0, 1, 1,
0.4638618, -1.644142, 3.125903, 0, 0, 0, 1, 1,
0.4673367, -1.418064, 2.329226, 1, 1, 1, 1, 1,
0.4742555, -0.9547506, 3.848157, 1, 1, 1, 1, 1,
0.4751621, -0.5390627, 4.298625, 1, 1, 1, 1, 1,
0.4901139, 0.3109229, 1.141325, 1, 1, 1, 1, 1,
0.4907733, 0.6737314, 2.262671, 1, 1, 1, 1, 1,
0.4907737, 0.3572136, 1.839442, 1, 1, 1, 1, 1,
0.492585, 1.520732, -1.283913, 1, 1, 1, 1, 1,
0.493945, 1.271741, 0.6933504, 1, 1, 1, 1, 1,
0.4940059, 0.02769844, 2.444312, 1, 1, 1, 1, 1,
0.4943458, -2.124547, 2.98358, 1, 1, 1, 1, 1,
0.4980925, -0.48763, 2.352959, 1, 1, 1, 1, 1,
0.5010633, 0.190877, -0.972039, 1, 1, 1, 1, 1,
0.5022593, 1.135958, -0.5104363, 1, 1, 1, 1, 1,
0.5051051, 0.9405797, 0.6477044, 1, 1, 1, 1, 1,
0.5056651, -0.2460033, 3.180876, 1, 1, 1, 1, 1,
0.5096352, 1.857882, 0.2650929, 0, 0, 1, 1, 1,
0.5180556, -0.97083, 2.94494, 1, 0, 0, 1, 1,
0.5250947, -1.881284, 2.509875, 1, 0, 0, 1, 1,
0.5265859, 0.1134478, 0.3141026, 1, 0, 0, 1, 1,
0.5292017, 1.014477, 0.8832864, 1, 0, 0, 1, 1,
0.531936, -0.3745226, 3.399459, 1, 0, 0, 1, 1,
0.5347179, -0.4916776, 2.743865, 0, 0, 0, 1, 1,
0.5385716, -1.118427, 3.22289, 0, 0, 0, 1, 1,
0.5425738, 0.9515378, -0.4927942, 0, 0, 0, 1, 1,
0.543157, 0.4885243, 1.469674, 0, 0, 0, 1, 1,
0.5471022, 1.004563, 1.510083, 0, 0, 0, 1, 1,
0.5475506, -0.0928485, 2.244147, 0, 0, 0, 1, 1,
0.5526356, -0.08095906, 0.5818127, 0, 0, 0, 1, 1,
0.5554265, 0.6149301, 0.1556601, 1, 1, 1, 1, 1,
0.5568454, 0.4045214, -1.335721, 1, 1, 1, 1, 1,
0.5702329, -0.8548667, 2.138815, 1, 1, 1, 1, 1,
0.5710047, -0.05882477, 0.7715421, 1, 1, 1, 1, 1,
0.5733026, -0.4231657, -0.2966939, 1, 1, 1, 1, 1,
0.5781507, -0.5360123, 2.179865, 1, 1, 1, 1, 1,
0.5798334, -0.4081903, 3.557479, 1, 1, 1, 1, 1,
0.5848705, 0.7215142, 0.5289375, 1, 1, 1, 1, 1,
0.5850012, 1.574902, -0.5052053, 1, 1, 1, 1, 1,
0.5858932, -0.07728146, 3.489777, 1, 1, 1, 1, 1,
0.586723, 0.8237371, 0.642238, 1, 1, 1, 1, 1,
0.5876854, 0.7693257, 0.9253168, 1, 1, 1, 1, 1,
0.5899141, 0.6231732, 0.6148579, 1, 1, 1, 1, 1,
0.594556, 0.5845119, 0.9114509, 1, 1, 1, 1, 1,
0.5964647, 0.6923372, 1.14101, 1, 1, 1, 1, 1,
0.602306, 0.4675756, -0.3240648, 0, 0, 1, 1, 1,
0.6046984, 1.007769, 0.5179794, 1, 0, 0, 1, 1,
0.6056364, 1.690958, -1.047141, 1, 0, 0, 1, 1,
0.6115733, -0.7284086, 2.401736, 1, 0, 0, 1, 1,
0.6136773, 0.2268222, 1.92998, 1, 0, 0, 1, 1,
0.6157916, 0.6242662, 1.232433, 1, 0, 0, 1, 1,
0.6276659, 0.5770097, 2.377215, 0, 0, 0, 1, 1,
0.6290162, 0.2653918, 0.6409605, 0, 0, 0, 1, 1,
0.6298436, -0.07440302, 0.4140174, 0, 0, 0, 1, 1,
0.6334613, 0.9798043, -0.1168856, 0, 0, 0, 1, 1,
0.6376491, -0.1523689, 1.944023, 0, 0, 0, 1, 1,
0.6399563, -0.2837881, 1.143205, 0, 0, 0, 1, 1,
0.6400693, -0.3714445, 4.072962, 0, 0, 0, 1, 1,
0.6447812, -0.5798649, 4.253867, 1, 1, 1, 1, 1,
0.6463109, -0.5894766, 2.089077, 1, 1, 1, 1, 1,
0.6478295, 0.3238353, 1.807332, 1, 1, 1, 1, 1,
0.6502184, -1.120718, 3.702269, 1, 1, 1, 1, 1,
0.6538723, -0.03969954, 0.9444315, 1, 1, 1, 1, 1,
0.6546463, -0.06977084, 0.6929302, 1, 1, 1, 1, 1,
0.6643209, 1.0378, 1.124055, 1, 1, 1, 1, 1,
0.6656786, 0.50302, 2.076988, 1, 1, 1, 1, 1,
0.6669662, -0.03960564, 1.114571, 1, 1, 1, 1, 1,
0.6672957, 0.38125, 2.35178, 1, 1, 1, 1, 1,
0.6753739, -2.10161, 2.676522, 1, 1, 1, 1, 1,
0.6829702, 1.879745, -0.4615319, 1, 1, 1, 1, 1,
0.6844303, -1.224084, 1.867857, 1, 1, 1, 1, 1,
0.6847968, -1.569507, 2.238421, 1, 1, 1, 1, 1,
0.6853399, 0.7670271, -0.1297298, 1, 1, 1, 1, 1,
0.6950415, 0.8381048, -0.6951068, 0, 0, 1, 1, 1,
0.6969033, -1.191905, 2.0869, 1, 0, 0, 1, 1,
0.7036064, -0.00571002, 0.5981218, 1, 0, 0, 1, 1,
0.7087465, 0.2205309, 1.361511, 1, 0, 0, 1, 1,
0.7090679, -0.09963051, 3.42987, 1, 0, 0, 1, 1,
0.7141591, 0.8223876, 0.3267958, 1, 0, 0, 1, 1,
0.7167721, 0.02048259, 0.4241123, 0, 0, 0, 1, 1,
0.7184414, 0.4486012, 0.4989984, 0, 0, 0, 1, 1,
0.7239047, 0.3712999, -0.3073704, 0, 0, 0, 1, 1,
0.7261814, 0.7014825, 0.8850517, 0, 0, 0, 1, 1,
0.7264607, 0.0969855, 0.9901454, 0, 0, 0, 1, 1,
0.727538, -0.01044959, 0.161041, 0, 0, 0, 1, 1,
0.7283087, 0.5825267, 2.61032, 0, 0, 0, 1, 1,
0.7294766, -0.7063064, 2.651339, 1, 1, 1, 1, 1,
0.7306082, -0.8343543, 2.007233, 1, 1, 1, 1, 1,
0.7329094, 1.266598, -1.260575, 1, 1, 1, 1, 1,
0.7363594, -0.195105, 1.980609, 1, 1, 1, 1, 1,
0.7374204, 0.8057945, 0.04681261, 1, 1, 1, 1, 1,
0.7387018, 0.2916685, 2.236892, 1, 1, 1, 1, 1,
0.7422354, 0.387226, 0.4715372, 1, 1, 1, 1, 1,
0.7474738, 0.898684, 0.03959122, 1, 1, 1, 1, 1,
0.747718, 1.438009, 1.816964, 1, 1, 1, 1, 1,
0.7497462, 0.390655, 1.588527, 1, 1, 1, 1, 1,
0.7500486, -0.2694137, 1.456291, 1, 1, 1, 1, 1,
0.7502983, 0.6524681, 2.09796, 1, 1, 1, 1, 1,
0.7553221, -1.021175, 3.017741, 1, 1, 1, 1, 1,
0.7555387, 0.6104994, 1.787106, 1, 1, 1, 1, 1,
0.7565747, 0.2332507, 1.086788, 1, 1, 1, 1, 1,
0.7644665, -0.1530019, 1.833062, 0, 0, 1, 1, 1,
0.7727326, 1.769212, -0.3681635, 1, 0, 0, 1, 1,
0.773248, -0.222903, 1.254752, 1, 0, 0, 1, 1,
0.7780393, -0.8540522, 2.348835, 1, 0, 0, 1, 1,
0.7801477, -0.9311144, 2.482433, 1, 0, 0, 1, 1,
0.787272, 0.5629986, 0.685422, 1, 0, 0, 1, 1,
0.7889977, -0.6764104, 3.032387, 0, 0, 0, 1, 1,
0.7961488, 1.256947, 0.8047242, 0, 0, 0, 1, 1,
0.798619, 1.025619, -0.6003913, 0, 0, 0, 1, 1,
0.8068882, -1.530795, 3.530245, 0, 0, 0, 1, 1,
0.8075063, 0.3995406, 1.44194, 0, 0, 0, 1, 1,
0.8145279, -1.217963, 3.180564, 0, 0, 0, 1, 1,
0.8161422, -0.6361387, 1.273277, 0, 0, 0, 1, 1,
0.8171878, -0.6130341, 2.376236, 1, 1, 1, 1, 1,
0.8177873, -0.8744108, 2.286138, 1, 1, 1, 1, 1,
0.8209148, 1.3644, -1.108211, 1, 1, 1, 1, 1,
0.8218392, -1.540016, 2.127174, 1, 1, 1, 1, 1,
0.8251047, 0.4448903, -0.6971014, 1, 1, 1, 1, 1,
0.8258086, -0.1622056, 0.575157, 1, 1, 1, 1, 1,
0.8278371, 0.3337781, 1.091259, 1, 1, 1, 1, 1,
0.831845, 0.1674512, 0.9145926, 1, 1, 1, 1, 1,
0.8319384, 0.1063933, 2.696684, 1, 1, 1, 1, 1,
0.8372992, -0.562862, 3.512308, 1, 1, 1, 1, 1,
0.8382025, -0.5196066, 2.649983, 1, 1, 1, 1, 1,
0.8385064, -0.5341004, 2.351075, 1, 1, 1, 1, 1,
0.841391, 0.7764725, 3.021034, 1, 1, 1, 1, 1,
0.8423671, -0.2129887, 1.379096, 1, 1, 1, 1, 1,
0.8443989, 1.08046, 0.5028257, 1, 1, 1, 1, 1,
0.8474794, -2.178296, 3.207772, 0, 0, 1, 1, 1,
0.849425, -1.340612, 3.807208, 1, 0, 0, 1, 1,
0.8505232, 0.08417835, 0.8603435, 1, 0, 0, 1, 1,
0.8526423, -0.4915001, 0.9795586, 1, 0, 0, 1, 1,
0.8547396, -0.1937288, -0.2479804, 1, 0, 0, 1, 1,
0.8616221, 0.04875808, 0.728436, 1, 0, 0, 1, 1,
0.8617299, -0.7966899, 1.170532, 0, 0, 0, 1, 1,
0.8662753, -0.2888651, 2.425443, 0, 0, 0, 1, 1,
0.8685565, -1.30905, 1.818682, 0, 0, 0, 1, 1,
0.8723239, -1.207868, 1.287652, 0, 0, 0, 1, 1,
0.8771437, -2.171251, 3.120883, 0, 0, 0, 1, 1,
0.8913484, -1.024839, 1.148282, 0, 0, 0, 1, 1,
0.8928453, 1.927682, -1.751867, 0, 0, 0, 1, 1,
0.8977885, 1.381508, 1.056246, 1, 1, 1, 1, 1,
0.8992007, -0.5489997, 1.18035, 1, 1, 1, 1, 1,
0.9017079, -0.7801766, 1.846166, 1, 1, 1, 1, 1,
0.9106213, -0.1634115, 2.610512, 1, 1, 1, 1, 1,
0.9138749, 0.1728143, 2.345476, 1, 1, 1, 1, 1,
0.920911, 0.08267291, 1.221579, 1, 1, 1, 1, 1,
0.9243258, -0.6811961, 2.197585, 1, 1, 1, 1, 1,
0.9272068, 0.1169117, 2.062468, 1, 1, 1, 1, 1,
0.9272865, 0.3814941, 2.877548, 1, 1, 1, 1, 1,
0.9302865, -0.3529514, 2.28809, 1, 1, 1, 1, 1,
0.9303071, 0.2867379, 1.472881, 1, 1, 1, 1, 1,
0.9432185, -0.704694, 3.258451, 1, 1, 1, 1, 1,
0.9436393, 0.05840514, 0.8179995, 1, 1, 1, 1, 1,
0.9495772, 0.5585028, 0.769242, 1, 1, 1, 1, 1,
0.9540642, 1.714396, -0.5826547, 1, 1, 1, 1, 1,
0.9679151, -0.786668, 1.652899, 0, 0, 1, 1, 1,
0.969623, 2.769219, -0.3072593, 1, 0, 0, 1, 1,
0.9713965, 0.7680798, 2.17788, 1, 0, 0, 1, 1,
0.9729382, 1.125628, 0.8537612, 1, 0, 0, 1, 1,
0.9738649, -0.3961926, 3.150652, 1, 0, 0, 1, 1,
0.9742374, -0.4841242, 0.4654132, 1, 0, 0, 1, 1,
0.9806305, 0.4450971, 2.306344, 0, 0, 0, 1, 1,
0.981339, 0.06465186, 0.8322645, 0, 0, 0, 1, 1,
0.9867135, -1.028508, 2.034901, 0, 0, 0, 1, 1,
0.9872804, 1.427224, 0.5489951, 0, 0, 0, 1, 1,
0.9923876, -0.2874773, 1.85093, 0, 0, 0, 1, 1,
1.010056, 0.1712562, 0.9002678, 0, 0, 0, 1, 1,
1.011008, -0.3360493, 1.509486, 0, 0, 0, 1, 1,
1.011234, -0.1514899, 2.726171, 1, 1, 1, 1, 1,
1.014083, -0.1768868, 1.492654, 1, 1, 1, 1, 1,
1.023062, 0.7356297, 3.262344, 1, 1, 1, 1, 1,
1.031474, 0.9769226, -1.283858, 1, 1, 1, 1, 1,
1.039365, -0.7084008, 2.70299, 1, 1, 1, 1, 1,
1.043622, -0.2637239, 1.031074, 1, 1, 1, 1, 1,
1.046136, 1.109964, 1.629642, 1, 1, 1, 1, 1,
1.047205, -0.2978089, 2.354995, 1, 1, 1, 1, 1,
1.052159, -0.0787712, 2.446047, 1, 1, 1, 1, 1,
1.06063, -0.1042571, 1.86999, 1, 1, 1, 1, 1,
1.061375, -0.1867153, 1.68801, 1, 1, 1, 1, 1,
1.065315, -0.06304993, 1.450863, 1, 1, 1, 1, 1,
1.067579, -1.346866, 3.255952, 1, 1, 1, 1, 1,
1.073691, 0.5172471, 3.148922, 1, 1, 1, 1, 1,
1.080496, -1.012484, 3.277838, 1, 1, 1, 1, 1,
1.084767, 2.34117, -0.1914875, 0, 0, 1, 1, 1,
1.088268, 0.1631374, 0.349728, 1, 0, 0, 1, 1,
1.095871, 0.1847058, 0.3673324, 1, 0, 0, 1, 1,
1.097732, 1.675952, 0.6293007, 1, 0, 0, 1, 1,
1.098463, 1.164332, 0.2435524, 1, 0, 0, 1, 1,
1.098667, 0.9087037, -0.7514296, 1, 0, 0, 1, 1,
1.09966, -1.505864, 2.870526, 0, 0, 0, 1, 1,
1.103432, -0.4332599, 1.849463, 0, 0, 0, 1, 1,
1.104122, -1.075277, 3.337169, 0, 0, 0, 1, 1,
1.104194, 0.07834608, 2.86952, 0, 0, 0, 1, 1,
1.109858, -0.4297785, 2.162315, 0, 0, 0, 1, 1,
1.110174, -1.492846, 2.222737, 0, 0, 0, 1, 1,
1.112799, -0.04056115, 2.903046, 0, 0, 0, 1, 1,
1.114119, -1.082424, 3.768786, 1, 1, 1, 1, 1,
1.125306, -1.635212, 3.107697, 1, 1, 1, 1, 1,
1.125817, -0.4795705, 1.142689, 1, 1, 1, 1, 1,
1.127863, 0.3358605, 0.2608123, 1, 1, 1, 1, 1,
1.130999, 2.148028, -0.6290945, 1, 1, 1, 1, 1,
1.131181, 0.4588632, 0.0185812, 1, 1, 1, 1, 1,
1.138513, -1.905668, 1.947639, 1, 1, 1, 1, 1,
1.139088, 0.7956634, 0.4612888, 1, 1, 1, 1, 1,
1.145033, 0.405887, 1.187002, 1, 1, 1, 1, 1,
1.152314, 0.7534844, -1.086232, 1, 1, 1, 1, 1,
1.152563, 1.650049, 0.1267605, 1, 1, 1, 1, 1,
1.158263, 0.04740386, 0.402544, 1, 1, 1, 1, 1,
1.161758, -1.438452, 3.432734, 1, 1, 1, 1, 1,
1.16228, 0.5452292, 1.570431, 1, 1, 1, 1, 1,
1.168826, 0.118384, 1.219809, 1, 1, 1, 1, 1,
1.178218, 1.801797, 0.9541188, 0, 0, 1, 1, 1,
1.179222, -0.3422223, 3.017632, 1, 0, 0, 1, 1,
1.182516, -0.1841753, 3.407112, 1, 0, 0, 1, 1,
1.182864, 1.353578, 1.461189, 1, 0, 0, 1, 1,
1.189697, 0.0326005, 2.019068, 1, 0, 0, 1, 1,
1.190584, -1.536544, 2.774137, 1, 0, 0, 1, 1,
1.190953, 0.01862141, -0.5279962, 0, 0, 0, 1, 1,
1.200103, -1.599331, 3.972588, 0, 0, 0, 1, 1,
1.202786, 0.2746603, 1.125474, 0, 0, 0, 1, 1,
1.205979, -1.184839, 2.91882, 0, 0, 0, 1, 1,
1.216972, 1.154748, 0.9306794, 0, 0, 0, 1, 1,
1.222654, 0.4438141, -0.7985169, 0, 0, 0, 1, 1,
1.223103, -1.28873, 2.450669, 0, 0, 0, 1, 1,
1.233708, -0.4482129, 1.200894, 1, 1, 1, 1, 1,
1.235092, 0.4902167, 0.7810174, 1, 1, 1, 1, 1,
1.237478, 1.503705, 2.221687, 1, 1, 1, 1, 1,
1.245943, -0.4784356, 1.226285, 1, 1, 1, 1, 1,
1.247117, -0.5535072, 3.24246, 1, 1, 1, 1, 1,
1.249808, 0.3917333, 0.8629615, 1, 1, 1, 1, 1,
1.257924, 1.433716, 1.439854, 1, 1, 1, 1, 1,
1.270211, -0.7399002, 2.668505, 1, 1, 1, 1, 1,
1.27426, -2.173965, 2.321886, 1, 1, 1, 1, 1,
1.281477, 0.1291059, 2.012602, 1, 1, 1, 1, 1,
1.286759, -0.5106105, 1.940645, 1, 1, 1, 1, 1,
1.290257, 0.7832428, 0.9495318, 1, 1, 1, 1, 1,
1.300338, -0.4634082, 2.384408, 1, 1, 1, 1, 1,
1.303722, 0.4697888, 0.3590456, 1, 1, 1, 1, 1,
1.304705, 0.3598464, 0.846038, 1, 1, 1, 1, 1,
1.317282, 0.06980634, 2.485188, 0, 0, 1, 1, 1,
1.32186, -1.819575, 1.90344, 1, 0, 0, 1, 1,
1.324229, -0.4550733, 0.8927143, 1, 0, 0, 1, 1,
1.325317, 0.3719517, -0.5793716, 1, 0, 0, 1, 1,
1.337297, -0.3048941, 1.81539, 1, 0, 0, 1, 1,
1.344069, -1.831569, 1.214894, 1, 0, 0, 1, 1,
1.345142, 1.795715, 1.808447, 0, 0, 0, 1, 1,
1.352166, -0.2688758, 1.271294, 0, 0, 0, 1, 1,
1.355906, -0.5221006, 2.650256, 0, 0, 0, 1, 1,
1.361786, -1.214569, 1.804306, 0, 0, 0, 1, 1,
1.367636, -1.503827, 2.209504, 0, 0, 0, 1, 1,
1.367737, 1.656596, -0.4530043, 0, 0, 0, 1, 1,
1.3749, -1.439054, 1.956685, 0, 0, 0, 1, 1,
1.395261, 0.1751106, 1.56126, 1, 1, 1, 1, 1,
1.404974, -0.4780633, 2.236257, 1, 1, 1, 1, 1,
1.406142, -0.008280257, 0.5617597, 1, 1, 1, 1, 1,
1.409825, 1.197602, 1.621187, 1, 1, 1, 1, 1,
1.420283, -1.45503, 2.915206, 1, 1, 1, 1, 1,
1.424817, -0.8532782, 1.767916, 1, 1, 1, 1, 1,
1.429695, -1.310349, 1.433486, 1, 1, 1, 1, 1,
1.430928, 1.035205, 1.084318, 1, 1, 1, 1, 1,
1.430935, 0.8498977, 2.631115, 1, 1, 1, 1, 1,
1.437571, -0.3415011, 3.052124, 1, 1, 1, 1, 1,
1.440545, -2.35751, 2.577088, 1, 1, 1, 1, 1,
1.464228, -0.3878718, 1.076069, 1, 1, 1, 1, 1,
1.466029, -0.9185894, 3.017969, 1, 1, 1, 1, 1,
1.483635, -2.211354, 2.624678, 1, 1, 1, 1, 1,
1.493525, 0.5940807, 3.060796, 1, 1, 1, 1, 1,
1.493793, -1.050689, 3.251019, 0, 0, 1, 1, 1,
1.494683, -1.22662, 2.104901, 1, 0, 0, 1, 1,
1.498729, -0.515942, 1.079273, 1, 0, 0, 1, 1,
1.51933, -0.5583982, 0.8795659, 1, 0, 0, 1, 1,
1.538075, 1.290324, 2.332071, 1, 0, 0, 1, 1,
1.544978, 0.6313875, -0.9543411, 1, 0, 0, 1, 1,
1.557609, -0.3441217, 2.203548, 0, 0, 0, 1, 1,
1.565523, -0.2934781, 1.75053, 0, 0, 0, 1, 1,
1.571588, 1.936661, 1.730033, 0, 0, 0, 1, 1,
1.585651, -1.737797, 3.20695, 0, 0, 0, 1, 1,
1.594683, 0.01162707, 1.125423, 0, 0, 0, 1, 1,
1.597797, 0.7319881, -0.09530395, 0, 0, 0, 1, 1,
1.602405, 0.3725954, 1.882212, 0, 0, 0, 1, 1,
1.608761, 0.1123888, 0.3323937, 1, 1, 1, 1, 1,
1.609758, -0.5200334, 1.024257, 1, 1, 1, 1, 1,
1.615827, 0.9349926, 0.8759075, 1, 1, 1, 1, 1,
1.616711, -0.9148887, 0.5230557, 1, 1, 1, 1, 1,
1.617336, 1.538019, 1.257068, 1, 1, 1, 1, 1,
1.637944, 0.2227818, 4.16346, 1, 1, 1, 1, 1,
1.647836, 0.2314592, 1.783291, 1, 1, 1, 1, 1,
1.653653, 1.157396, 0.3611263, 1, 1, 1, 1, 1,
1.677964, -0.914014, 1.83885, 1, 1, 1, 1, 1,
1.679151, 0.7899937, 1.381735, 1, 1, 1, 1, 1,
1.67995, -1.58417, 2.226554, 1, 1, 1, 1, 1,
1.681436, -1.603713, -1.194089, 1, 1, 1, 1, 1,
1.684272, 0.659705, 0.3653861, 1, 1, 1, 1, 1,
1.701902, 0.6265206, 2.567304, 1, 1, 1, 1, 1,
1.753248, 0.08287806, 2.705721, 1, 1, 1, 1, 1,
1.753622, 2.105331, 1.453835, 0, 0, 1, 1, 1,
1.760978, -0.2132466, 2.078726, 1, 0, 0, 1, 1,
1.792068, 0.02198811, 1.378, 1, 0, 0, 1, 1,
1.798957, 0.6536761, 1.934506, 1, 0, 0, 1, 1,
1.80887, -0.5480034, 1.025327, 1, 0, 0, 1, 1,
1.818699, 0.5123429, 0.5117457, 1, 0, 0, 1, 1,
1.822785, -0.2597659, -0.3263206, 0, 0, 0, 1, 1,
1.825332, 0.9920654, -1.331656, 0, 0, 0, 1, 1,
1.865023, 1.950122, 1.303113, 0, 0, 0, 1, 1,
1.868404, 0.1494021, 0.4937513, 0, 0, 0, 1, 1,
1.872896, 0.9180257, -0.335311, 0, 0, 0, 1, 1,
1.877264, -0.3035584, -0.05487168, 0, 0, 0, 1, 1,
1.89653, -0.8226695, 2.029549, 0, 0, 0, 1, 1,
1.916815, 1.381388, 0.5109324, 1, 1, 1, 1, 1,
1.922493, 0.08223569, 2.004049, 1, 1, 1, 1, 1,
1.925458, 0.4108021, 1.293144, 1, 1, 1, 1, 1,
1.940938, -1.808978, 1.182475, 1, 1, 1, 1, 1,
1.950184, 0.09202749, 3.515342, 1, 1, 1, 1, 1,
1.954466, 0.3091568, -0.5264174, 1, 1, 1, 1, 1,
1.963852, 0.5267577, 1.435508, 1, 1, 1, 1, 1,
1.965186, -0.9956679, 2.738836, 1, 1, 1, 1, 1,
2.014452, -0.1997932, 1.046228, 1, 1, 1, 1, 1,
2.033874, 0.4362814, 0.8390734, 1, 1, 1, 1, 1,
2.056915, -1.251134, 2.207502, 1, 1, 1, 1, 1,
2.075228, -0.02982886, 0.2464931, 1, 1, 1, 1, 1,
2.095948, -1.445832, 3.793598, 1, 1, 1, 1, 1,
2.100996, 1.367261, -0.8811338, 1, 1, 1, 1, 1,
2.141252, 1.305179, -0.5602551, 1, 1, 1, 1, 1,
2.16741, 1.663103, 1.402124, 0, 0, 1, 1, 1,
2.170058, 0.2547173, 0.1538942, 1, 0, 0, 1, 1,
2.226511, 0.01140913, 0.08049683, 1, 0, 0, 1, 1,
2.242315, 0.5456291, 1.264115, 1, 0, 0, 1, 1,
2.243356, 1.796304, 0.3546143, 1, 0, 0, 1, 1,
2.252816, 1.233412, 1.863306, 1, 0, 0, 1, 1,
2.298626, 0.7451884, 2.396023, 0, 0, 0, 1, 1,
2.304665, -0.8386233, 1.292427, 0, 0, 0, 1, 1,
2.308756, -0.06623428, 1.802651, 0, 0, 0, 1, 1,
2.394496, 1.285524, 0.5181713, 0, 0, 0, 1, 1,
2.395195, -1.724969, 4.137668, 0, 0, 0, 1, 1,
2.470557, 0.2902922, -0.1942231, 0, 0, 0, 1, 1,
2.541073, 0.6637265, 1.820902, 0, 0, 0, 1, 1,
2.54248, 0.9165416, 1.552292, 1, 1, 1, 1, 1,
2.593612, 0.9857569, 1.777671, 1, 1, 1, 1, 1,
2.637285, -0.5273721, 0.8894795, 1, 1, 1, 1, 1,
2.657688, 0.04444726, 2.166145, 1, 1, 1, 1, 1,
2.664653, 0.05562189, 0.472883, 1, 1, 1, 1, 1,
2.81616, -0.01379345, 1.415791, 1, 1, 1, 1, 1,
3.517112, 1.794324, 1.808338, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.51651;
var distance = 33.42634;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.0366807, 0.07927668, -0.09764981 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.42634);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>